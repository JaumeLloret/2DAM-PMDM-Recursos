import 'package:aulaflow_flutter_data_client_starter/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('starter DTO reads the current minimal contract', () {
    final task = StarterTask.fromJson({
      'id': 'DEMO-1',
      'title': 'Starter',
      'status': 'todo',
    });
    expect(task.id, 'DEMO-1');
  });

  test('starter DTO rejects a missing required field', () {
    expect(
      () => StarterTask.fromJson({'id': 'DEMO-1', 'title': 'Starter'}),
      throwsFormatException,
    );
  });
}

