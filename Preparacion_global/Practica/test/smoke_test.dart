import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ppg_pmdm/main.dart';

void main() {
  testWidgets('arranque y conversión básica pública', (tester) async {
    await tester.pumpWidget(const DistanceApp());
    await tester.enterText(find.byKey(const Key('distance')), '2.5');
    await tester.tap(find.text('Convertir'));
    await tester.pump();
    expect(find.text('2500.0 m'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
