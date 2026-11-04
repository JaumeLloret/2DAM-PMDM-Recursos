import 'device_ports.dart';

// Contratos de partida para H4–H5. Conecta implementaciones después de practicarlas.
class AttachmentDraft {
  const AttachmentDraft(
    this.id,
    this.localReference,
    this.mimeType,
    this.byteCount,
  );
  final String id, localReference, mimeType;
  final int byteCount;
}

abstract interface class CapturePort {
  Future<DemoMedia?> pick();
  Future<DemoMedia?> recoverLost();
}

abstract interface class ProcessorPort {
  Future<DemoMedia> convert(DemoMedia source);
}

abstract interface class StorePort {
  Future<AttachmentDraft> save(DemoMedia original, DemoMedia derivative);
}

abstract interface class PlayerPort {
  Future<void> load();
  Future<void> play();
  Future<void> pause();
  Future<void> dispose();
}
