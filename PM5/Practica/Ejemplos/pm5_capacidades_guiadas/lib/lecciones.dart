import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

class LessonFailure implements Exception {
  const LessonFailure(this.code);
  final String code;
}

enum Decision { granted, denied, permanentlyDenied }

String permissionMessage(Decision value) => switch (value) {
  Decision.granted => 'Puedes continuar con esta función.',
  Decision.denied => 'Permiso denegado; puedes reintentar o usar un fixture.',
  Decision.permanentlyDenied => 'Permiso bloqueado; ofrece Ajustes o fixture.',
};

class DemoDevice {
  const DemoDevice(this.id, this.label);
  final String id, label;
}

abstract interface class LessonBlePort {
  Stream<DemoDevice> scan();
  Future<void> connect(String id);
  Future<List<int>> exchange(List<int> request);
  Future<void> disconnect();
}

enum BleCase { normal, timeout, disconnected, unavailable }

class ScriptedBle implements LessonBlePort {
  ScriptedBle([this.scenario = BleCase.normal]);
  final BleCase scenario;
  bool connected = false;
  int activeScans = 0;
  @override
  Stream<DemoDevice> scan() async* {
    if (scenario == BleCase.unavailable)
      throw const LessonFailure('ble_unavailable');
    activeScans++;
    try {
      for (final d in const [
        DemoDevice('DEMO-A', 'Periférico DEMO'),
        DemoDevice('DEMO-A', 'Periférico DEMO'),
      ]) {
        yield d;
      }
    } finally {
      activeScans--;
    }
  }

  @override
  Future<void> connect(String id) async {
    connected = true;
  }

  @override
  Future<List<int>> exchange(List<int> request) async {
    if (!connected) throw const LessonFailure('not_connected');
    if (scenario == BleCase.timeout) throw const LessonFailure('timeout');
    if (scenario == BleCase.disconnected) {
      connected = false;
      throw const LessonFailure('disconnected');
    }
    return utf8.encode('DEMO-PONG');
  }

  @override
  Future<void> disconnect() async {
    connected = false;
  }
}

class BleLesson {
  BleLesson(this.port);
  final LessonBlePort port;
  StreamSubscription<DemoDevice>? _scan;
  Future<List<DemoDevice>> discover() async {
    await stop();
    final found = <String, DemoDevice>{};
    final done = Completer<void>();
    _scan = port.scan().listen(
      (d) => found[d.id] = d,
      onError: (Object e, StackTrace st) {
        if (!done.isCompleted) done.completeError(e, st);
      },
      onDone: () {
        if (!done.isCompleted) done.complete();
      },
    );
    try {
      await done.future.timeout(const Duration(seconds: 8));
      return found.values.toList();
    } on TimeoutException {
      return found.values.toList();
    } finally {
      await stop();
    }
  }

  Future<String> ping(String id) async {
    await stop();
    try {
      await port.connect(id);
      return utf8.decode(
        await port
            .exchange(utf8.encode('DEMO-PING'))
            .timeout(const Duration(seconds: 8)),
      );
    } on TimeoutException {
      throw const LessonFailure('timeout');
    } finally {
      await port.disconnect();
    }
  }

  Future<void> stop() async {
    final old = _scan;
    _scan = null;
    await old?.cancel();
  }
}

class Sample {
  const Sample(this.x, this.milliseconds);
  final double x;
  final int milliseconds;
}

class SensorLesson extends ChangeNotifier {
  StreamSubscription<Sample>? _subscription;
  Sample? latest;
  Sample? displayed;
  String state = 'idle';
  int? _lastPaint;
  bool _closed = false;
  int _revision = 0;
  void _refresh() {
    if (!_closed) notifyListeners();
  }

  Future<void> start(Stream<Sample> samples) async {
    final revision = ++_revision;
    final old = _subscription;
    _subscription = null;
    await old?.cancel();
    // La operación puede haberse suspendido/cerrado durante la espera.
    if (_closed || revision != _revision) return;
    _lastPaint = null;
    state = 'listening';
    _subscription = samples.listen(
      (s) {
        if (_closed || revision != _revision) return;
        latest = s;
        if (_lastPaint == null || s.milliseconds - _lastPaint! >= 120) {
          displayed = s;
          _lastPaint = s.milliseconds;
          _refresh();
        }
      },
      onError: (Object e) {
        if (_closed || revision != _revision) return;
        state = 'sensor_error';
        unawaited(stop());
        _refresh();
      },
      onDone: () {
        if (_closed || revision != _revision) return;
        state = 'finished';
        displayed = latest;
        _subscription = null;
        _refresh();
      },
    );
    _refresh();
  }

  Future<void> stop() async {
    _revision++;
    final old = _subscription;
    _subscription = null;
    await old?.cancel();
  }

  Future<void> suspend() async {
    await stop();
    state = 'paused';
    _refresh();
  }

  @override
  void dispose() {
    _closed = true;
    unawaited(stop());
    super.dispose();
  }
}

class Derivative {
  const Derivative(this.bytes, this.mime, this.width);
  final Uint8List bytes;
  final String mime;
  final int width;
}

Derivative processImage(
  Uint8List bytes,
  String mime, {
  int maxWidth = 1024,
  bool jpeg = true,
  int maxBytes = 5 * 1024 * 1024,
}) {
  if (bytes.length > maxBytes) throw const LessonFailure('too_large');
  if (!const ['image/png', 'image/jpeg'].contains(mime))
    throw const LessonFailure('unsupported_mime');
  img.Image? decoded;
  try {
    decoded = img.decodeImage(bytes);
  } on Object {
    throw const LessonFailure('decode_failed');
  }
  if (decoded == null) throw const LessonFailure('decode_failed');
  final resized = decoded.width > maxWidth
      ? img.copyResize(decoded, width: maxWidth)
      : decoded;
  final result = jpeg
      ? img.encodeJpg(resized, quality: 85)
      : img.encodePng(resized);
  return Derivative(
    Uint8List.fromList(result),
    jpeg ? 'image/jpeg' : 'image/png',
    resized.width,
  );
}

class Draft {
  const Draft(this.id, this.mime, this.bytes);
  final String id, mime;
  final int bytes;
}

class MemoryDraftStore {
  MemoryDraftStore(this.backend);
  final Map<String, Uint8List> backend;
  Draft save(Derivative media) {
    backend['DEMO-DERIVED'] = media.bytes;
    return Draft('DEMO-DERIVED', media.mime, media.bytes.length);
  }
}

enum AudioState { idle, ready, playing, paused, closed }

class DemoPlayer extends ChangeNotifier {
  AudioState state = AudioState.idle;
  void load() {
    state = AudioState.ready;
    notifyListeners();
  }

  void play() {
    if (state != AudioState.ready && state != AudioState.paused)
      throw const LessonFailure('not_loaded');
    state = AudioState.playing;
    notifyListeners();
  }

  void pause() {
    if (state == AudioState.playing) {
      state = AudioState.paused;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    state = AudioState.closed;
    super.dispose();
  }
}
