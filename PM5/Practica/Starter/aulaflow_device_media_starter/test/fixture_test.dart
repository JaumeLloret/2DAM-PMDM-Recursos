import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:aulaflow_device_media_starter/demo_fakes.dart';

void main() {
  test(
    'el fixture público contiene un PNG decodificable, no texto DEMO',
    () async {
      final source = await DemoMediaPort().pickFixture();
      expect(img.decodePng(source.bytes), isNotNull);
      expect(source.mimeType, 'image/png');
    },
  );
}
