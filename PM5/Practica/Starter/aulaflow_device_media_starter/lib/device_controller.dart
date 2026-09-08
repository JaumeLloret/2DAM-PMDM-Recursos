import 'dart:async';

import 'package:flutter/foundation.dart';

import 'device_ports.dart';

final class DeviceController extends ChangeNotifier {
  DeviceController({
    required this.permissions,
    required this.ble,
    required this.sensor,
    required this.media,
  });

  final PermissionPort permissions;
  final BlePort ble;
  final SensorPort sensor;
  final MediaPort media;

  String status = 'Listo en modo DEMO';
  MotionSample? latest;
  StreamSubscription<MotionSample>? _sensorSubscription;
  StreamSubscription<DeviceInfo>? _scanSubscription;

  Future<void> requestCamera() async {
    final PermissionState state = await permissions.request(Capability.camera);
    status = 'Cámara: ${state.name}';
    notifyListeners();
  }

  Future<void> startSensor() async {
    // TODO(PM5): gestionar duplicados, error, throttling y lifecycle.
    _sensorSubscription = sensor.samples().listen((MotionSample sample) {
      latest = sample;
      notifyListeners();
    });
  }

  Future<void> scan() async {
    // TODO(PM5): permiso contextual, timeout, deduplicación y error.
    _scanSubscription = ble.scan().listen((DeviceInfo device) {
      status = 'Detectado ${device.label}';
      notifyListeners();
    });
  }

  Future<void> processFixture() async {
    final source = await media.pickFixture();
    final output = await media.convert(source);
    status = 'Procesado ${output.mimeType}: ${output.bytes.length} bytes';
    notifyListeners();
  }

  Future<void> suspend() async {
    // TODO(PM5): cancelar scan/sensor y pausar reproducción.
  }

  @override
  void dispose() {
    unawaited(_sensorSubscription?.cancel());
    unawaited(_scanSubscription?.cancel());
    super.dispose();
  }
}

