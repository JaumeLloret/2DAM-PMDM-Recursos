import 'dart:async';
import 'dart:typed_data';

enum PermissionState { notRequested, granted, denied, permanentlyDenied }

enum Capability { bluetooth, camera }

final class DeviceInfo {
  const DeviceInfo(this.id, this.label);
  final String id;
  final String label;
}

final class MotionSample {
  const MotionSample(this.x, this.y, this.z);
  final double x;
  final double y;
  final double z;
}

final class DemoMedia {
  const DemoMedia({required this.bytes, required this.mimeType});
  final Uint8List bytes;
  final String mimeType;
}

abstract interface class PermissionPort {
  Future<PermissionState> request(Capability capability);
}

abstract interface class BlePort {
  Stream<DeviceInfo> scan();
  Future<void> connect(String id);
  Future<List<int>> exchange(List<int> request);
  Future<void> disconnect();
}

abstract interface class SensorPort {
  Stream<MotionSample> samples();
}

abstract interface class MediaPort {
  Future<DemoMedia> pickFixture();
  Future<DemoMedia> convert(DemoMedia source);
}

