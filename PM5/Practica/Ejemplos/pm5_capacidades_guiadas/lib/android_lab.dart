import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:sensors_plus/sensors_plus.dart';

import 'fixtures.dart';
import 'lecciones.dart';

/// Adaptador de enseñanza. Solo este archivo importa los plugins Android.
class AndroidLab extends ChangeNotifier {
  final _picker = ImagePicker();
  final _ble = FlutterReactiveBle();
  final _audio = AudioPlayer();
  StreamSubscription<UserAccelerometerEvent>? _sensor;
  StreamSubscription<DiscoveredDevice>? _scan;
  StreamSubscription<ConnectionStateUpdate>? _connection;
  Timer? _scanTimer;
  String? _device;
  bool _closed = false;
  bool audioLoaded = false;
  String message = 'ANDROID: ninguna capacidad se ha observado todavía.';
  String? lastFailure;
  Uint8List? preview;
  double? x;
  DateTime? _lastPaint;
  static const service = String.fromEnvironment('PM5_BLE_SERVICE');
  static const characteristic = String.fromEnvironment(
    'PM5_BLE_CHARACTERISTIC',
  );
  void refresh() {
    if (!_closed) notifyListeners();
  }

  Future<void> run(Future<void> Function() work) async {
    try {
      lastFailure = null;
      await work();
    } on LessonFailure catch (e) {
      lastFailure = e.code;
      message = 'Fallo: ${e.code}';
    } on Object {
      lastFailure = 'platform_error';
      message = 'La plataforma no pudo completar la operación. Registra la acción y revisa el entorno.';
    }
    refresh();
  }

  Future<void> cameraPermission() async {
    final result = await ph.Permission.camera.request();
    message = result.isGranted
        ? 'Cámara autorizada; todavía no se ha capturado.'
        : result.isPermanentlyDenied
        ? 'Cámara bloqueada: puedes abrir Ajustes o usar fixture.'
        : 'Cámara denegada: puedes reintentar o usar fixture.';
  }

  Future<void> settings() async {
    await ph.openAppSettings();
  }

  Future<void> startSensor() async {
    await _sensor?.cancel();
    _lastPaint = null;
    _sensor =
        userAccelerometerEventStream(
          samplingPeriod: const Duration(milliseconds: 30),
        ).listen(
          (sample) {
            x = sample.x;
            final now = DateTime.now();
            if (_lastPaint == null ||
                now.difference(_lastPaint!).inMilliseconds >= 120) {
              _lastPaint = now;
              message = 'Muestra real de acelerómetro recibida.';
              refresh();
            }
          },
          onError: (Object e) {
            message = 'Sensor no disponible o interrumpido; usa la traza DEMO.';
            unawaited(_sensor?.cancel());
            _sensor = null;
            refresh();
          },
          onDone: () {
            _sensor = null;
            message = 'El stream de sensor terminó.';
            refresh();
          },
        );
  }

  Future<void> _process(XFile file) async {
    if (await file.length() > 5 * 1024 * 1024)
      throw const LessonFailure('too_large');
    final bytes = await file.readAsBytes();
    // El decodificador valida el contenido, incluso si el selector no informa MIME.
    final mime =
        file.mimeType ??
        (file.name.toLowerCase().endsWith('.png') ? 'image/png' : 'image/jpeg');
    final result = processImage(bytes, mime);
    final directory = await getApplicationDocumentsDirectory();
    await File('${directory.path}/DEMO-DERIVED.jpg')
        .writeAsBytes(result.bytes, flush: true);
    preview = result.bytes;
    message =
        'JPEG privado guardado: ${result.width}px, ${result.bytes.length} bytes. Subida no implementada.';
  }

  Future<void> pick({bool camera = false}) async {
    if (camera) {
      final permission = await ph.Permission.camera.request();
      if (!permission.isGranted) {
        message = 'Cámara no autorizada; puedes seleccionar un archivo DEMO.';
        return;
      }
    }
    final selected = await _picker.pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
      requestFullMetadata: false,
    );
    if (selected == null) {
      message =
          'Selección cancelada: se conserva la previsualización anterior.';
      return;
    }
    await _process(selected);
  }

  Future<void> recoverLost() async {
    final lost = await _picker.retrieveLostData();
    if (lost.isEmpty) return;
    if (lost.exception != null) throw const LessonFailure('lost_data_failed');
    final files = lost.files;
    if (files != null && files.isNotEmpty) await _process(files.first);
  }

  Future<void> loadAudio() async {
    final directory = await getTemporaryDirectory();
    final f = File('${directory.path}/DEMO-TONE.wav');
    await f.writeAsBytes(demoTone(), flush: true);
    await _audio.setFilePath(f.path);
    audioLoaded = true;
    message = 'Tono sintético cargado.';
  }

  Future<void> playAudio() async {
    if (!audioLoaded) throw const LessonFailure('not_loaded');
    unawaited(
      _audio.play().catchError((Object e) {
        message = 'Reproducción interrumpida.';
        refresh();
      }),
    );
    message = 'Reproducción solicitada: anota si has oído el tono.';
  }

  Future<void> pauseAudio() async {
    await _audio.pause();
    message = 'Audio pausado.';
  }

  Future<void> stopScan() async {
    final old = _scan;
    _scan = null;
    _scanTimer?.cancel();
    _scanTimer = null;
    await old?.cancel();
  }

  Future<void> scan() async {
    if (service.isEmpty || characteristic.isEmpty)
      throw const LessonFailure('teacher_gatt_configuration_missing');
    final scanPermission = await ph.Permission.bluetoothScan.request();
    if (!scanPermission.isGranted)
      throw const LessonFailure('bluetooth_scan_denied');
    // Consultar la radio y usar la conexión requieren CONNECT en Android 12+.
    final connectPermission = await ph.Permission.bluetoothConnect.request();
    if (!connectPermission.isGranted)
      throw const LessonFailure('bluetooth_connect_denied');
    if (_ble.status != BleStatus.ready) {
      try {
        await _ble.statusStream
            .firstWhere((s) => s == BleStatus.ready)
            .timeout(const Duration(seconds: 3));
      } on Object {
        throw const LessonFailure('ble_not_ready');
      }
    }
    await stopScan();
    _device = null;
    final seen = <String>{};
    _scan = _ble
        .scanForDevices(
          withServices: [Uuid.parse(service)],
          scanMode: ScanMode.balanced,
        )
        .listen(
          (d) {
            if (seen.add(d.id)) {
              _device ??= d.id;
              message =
                  '${seen.length} periférico(s) del servicio de aula. Identificadores no mostrados.';
              refresh();
            }
          },
          onError: (Object e) {
            message = 'Escaneo interrumpido.';
            unawaited(stopScan());
            refresh();
          },
        );
    _scanTimer = Timer(const Duration(seconds: 8), () {
      unawaited(stopScan());
      message = _device == null
          ? 'No se detectó el periférico configurado.'
          : 'Escaneo finalizado; puedes conectar.';
      refresh();
    });
    message = 'Escaneando el servicio de aula durante un máximo de 8 segundos.';
  }

  Future<void> connectAndPing() async {
    final id = _device;
    if (id == null) throw const LessonFailure('no_device');
    final permission = await ph.Permission.bluetoothConnect.request();
    if (!permission.isGranted)
      throw const LessonFailure('bluetooth_connect_denied');
    await stopScan();
    await _connection?.cancel();
    final ready = Completer<void>();
    _connection = _ble
        .connectToDevice(id: id, connectionTimeout: const Duration(seconds: 8))
        .listen(
          (update) {
            if (update.connectionState == DeviceConnectionState.connected &&
                !ready.isCompleted)
              ready.complete();
            if (update.connectionState == DeviceConnectionState.disconnected) {
              message = 'Periférico desconectado.';
              refresh();
              if (!ready.isCompleted)
                ready.completeError(const LessonFailure('disconnected'));
            }
          },
          onError: (Object e) {
            if (!ready.isCompleted)
              ready.completeError(const LessonFailure('connect_failed'));
          },
        );
    try {
      await ready.future.timeout(const Duration(seconds: 9));
      final c = QualifiedCharacteristic(
        serviceId: Uuid.parse(service),
        characteristicId: Uuid.parse(characteristic),
        deviceId: id,
      );
      await _ble
          .writeCharacteristicWithResponse(c, value: utf8.encode('DEMO-PING'))
          .timeout(const Duration(seconds: 8));
      final response = await _ble
          .readCharacteristic(c)
          .timeout(const Duration(seconds: 8));
      message =
          'GATT leído: ${response.length} bytes. Contrasta su contenido con el protocolo de aula.';
    } finally {
      await _connection?.cancel();
      _connection = null;
    }
  }

  Future<void> suspend() async {
    await stopScan();
    await _sensor?.cancel();
    _sensor = null;
    await _connection?.cancel();
    _connection = null;
    await _audio.pause();
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    await suspend();
    await _audio.dispose();
    super.dispose();
  }
}
