import 'dart:async';
import 'dart:typed_data';

import 'device_ports.dart';

final class DemoPermissionPort implements PermissionPort {
  PermissionState next = PermissionState.denied;

  @override
  Future<PermissionState> request(Capability capability) async => next;
}

final class DemoBlePort implements BlePort {
  bool connected = false;

  @override
  Stream<DeviceInfo> scan() => Stream<DeviceInfo>.fromIterable(
    const <DeviceInfo>[DeviceInfo('DEMO-DEVICE-01', 'Periférico DEMO')],
  );

  @override
  Future<void> connect(String id) async {
    connected = true;
  }

  @override
  Future<List<int>> exchange(List<int> request) async {
    if (!connected) throw StateError('DEMO: no conectado');
    return <int>[...request.reversed];
  }

  @override
  Future<void> disconnect() async {
    connected = false;
  }
}

final class DemoSensorPort implements SensorPort {
  @override
  Stream<MotionSample> samples() => Stream<MotionSample>.periodic(
    const Duration(milliseconds: 250),
    (int tick) => MotionSample(tick / 10, 0.2, -0.1),
  ).take(20);
}

final class DemoMediaPort implements MediaPort {
  @override
  Future<DemoMedia> pickFixture() async => DemoMedia(
    bytes: Uint8List.fromList(<int>[0x44, 0x45, 0x4d, 0x4f]),
    mimeType: 'image/png',
  );

  @override
  Future<DemoMedia> convert(DemoMedia source) async {
    // TODO(PM5): sustituir por decode + resize + encode JPEG real.
    return source;
  }
}

