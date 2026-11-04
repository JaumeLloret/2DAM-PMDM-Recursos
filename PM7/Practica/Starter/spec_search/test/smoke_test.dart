import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spec_search/catalog.dart';
import 'package:spec_search/main.dart';

void main() {
  test('baseline provides synthetic data', () => expect(demoEntries.length, 4));
  testWidgets('baseline mounts the four visible entries', (tester) async {
    await tester.pumpWidget(const SearchApp());
    for (final entry in demoEntries) {
      expect(find.byKey(ValueKey(entry.id)), findsOneWidget);
      expect(find.text(entry.title), findsOneWidget);
    }
    expect(find.text('Consulta DEMO'), findsOneWidget);
  });
}
