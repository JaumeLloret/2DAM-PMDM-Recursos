import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quality_gate/main.dart';
import 'package:quality_gate/quality.dart';

class SmokeStore implements TaskStore {
  @override
  Future<List<TaskItem>> fetch() async => [const TaskItem('A', 'Trabajo A')];
}

void main() {
  testWidgets('starter mounts the screen and exposes reload', (tester) async {
    await tester.pumpWidget(QualityApp(store: SmokeStore()));
    await tester.pump();
    expect(find.text('Quality Gate · DEMO'), findsOneWidget);
    expect(find.text('Recargar'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
