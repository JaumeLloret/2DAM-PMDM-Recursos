import 'package:flutter_test/flutter_test.dart';
import 'package:quality_gate/quality.dart';

void main() {
  test('starter constructs an item', () {
    expect(const TaskItem('A', 'One').id, 'A');
  });
}
