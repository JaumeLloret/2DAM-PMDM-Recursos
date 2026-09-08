import 'package:flutter_test/flutter_test.dart';
import 'package:spec_search/catalog.dart';

void main() {
  test('baseline provides synthetic data', () {
    expect(demoEntries.length, 4);
  });
}
