import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quality_gate/main.dart';
import 'package:quality_gate/quality.dart';

class ControlledStore implements TaskStore {
  final requests = <Completer<List<TaskItem>>>[];

  @override
  Future<List<TaskItem>> fetch() {
    final request = Completer<List<TaskItem>>();
    requests.add(request);
    return request.future;
  }
}

void main() {
  test('guided: count two open tasks', () async {
    final store = ControlledStore();
    final controller = QualityController(store);
    addTearDown(controller.dispose);

    final loading = controller.load();
    store.requests.single.complete([
      const TaskItem('A', 'Abierta A'),
      const TaskItem('B', 'Terminada B', done: true),
      const TaskItem('C', 'Abierta C'),
    ]);
    await loading;

    expect(controller.pendingCount, 2);
  });

  testWidgets('guided: a tap completes the selected task', (tester) async {
    final store = ControlledStore();
    await tester.pumpWidget(QualityApp(store: store));
    store.requests.single.complete([const TaskItem('A', 'Abierta A')]);
    await tester.pump();

    await tester.tap(find.byKey(const ValueKey('A')));
    await tester.pump();
    expect(find.text('Pendientes: 0'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });
}
