import 'package:aulaflow_device_media_starter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('starter arranca sin pedir permisos', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const StarterApp());
    expect(find.text('Listo en modo DEMO'), findsOneWidget);
    expect(find.text('Pedir cámara en contexto'), findsOneWidget);
  });
}

