import 'dart:typed_data';

import 'package:image/image.dart' as img;

Uint8List demoPng() {
  final picture = img.Image(width: 1280, height: 720);
  img.fill(picture, color: img.ColorRgb8(30, 145, 170));
  return Uint8List.fromList(img.encodePng(picture));
}

Uint8List demoCorrupt() => Uint8List.fromList([68, 69, 77, 79]);
Uint8List demoTooLarge() => Uint8List(5 * 1024 * 1024 + 1);
Uint8List demoTone() {
  const count = 800;
  final b = ByteData(44 + count * 2);
  void text(int at, String s) {
    for (var i = 0; i < s.length; i++) {
      b.setUint8(at + i, s.codeUnitAt(i));
    }
  }

  text(0, 'RIFF');
  b.setUint32(4, 36 + count * 2, Endian.little);
  text(8, 'WAVE');
  text(12, 'fmt ');
  b.setUint32(16, 16, Endian.little);
  b.setUint16(20, 1, Endian.little);
  b.setUint16(22, 1, Endian.little);
  b.setUint32(24, 8000, Endian.little);
  b.setUint32(28, 16000, Endian.little);
  b.setUint16(32, 2, Endian.little);
  b.setUint16(34, 16, Endian.little);
  text(36, 'data');
  b.setUint32(40, count * 2, Endian.little);
  for (var i = 0; i < count; i++) {
    b.setInt16(44 + i * 2, (i ~/ 10).isEven ? 2000 : -2000, Endian.little);
  }
  return b.buffer.asUint8List();
}
