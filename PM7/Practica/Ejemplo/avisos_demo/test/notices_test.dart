import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:avisos_demo/main.dart';
import 'package:avisos_demo/notices.dart';

void main() {
  test('la prioridad y ocultar leídos se combinan con AND', () {
    expect(selectNotices(notices, 3, true).map((n) => n.id), ['AV-A']);
    expect(selectNotices(notices, 3, false).map((n) => n.id), ['AV-A', 'AV-C']);
  });
  test('una condición sin coincidencias no modifica la fuente', () {
    final source = List<Notice>.of(notices);
    expect(selectNotices(source, 4, false), isEmpty);
    expect(source.map((n) => n.id), ['AV-A', 'AV-B', 'AV-C']);
  });
  testWidgets('restablecer prioridad conserva ocultar leídos', (tester) async {
    await tester.pumpWidget(const NoticesApp());
    expect(find.text('3 de 3'), findsOneWidget);
    await tester.tap(find.byType(SwitchListTile));
    await tester.pump();
    await tester.tap(find.text('Prioridad 3 o más'));
    await tester.pump();
    expect(find.text('1 de 3'), findsOneWidget);
    await tester.tap(find.text('Restablecer prioridad'));
    await tester.pump();
    expect(find.text('2 de 3'), findsOneWidget);
    expect(find.byKey(const ValueKey('AV-C')), findsNothing);
  });
}
