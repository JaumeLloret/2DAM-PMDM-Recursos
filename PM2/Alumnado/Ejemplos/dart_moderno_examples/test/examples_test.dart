import 'package:test/test.dart';

import '../lib/examples.dart';

void main() {
  test('promoción y valor por defecto', () {
    expect(ownerLabel(null), 'SIN RESPONSABLE');
    expect(ownerLabel(' ada '), 'ADA');
  });

  test('colección normalizada conserva orden único', () {
    expect(normalizedTitles([' Dart ', '', 'modelado', 'Dart']), [
      'DART',
      'MODELADO',
    ]);
  });

  test('record comunica validación', () {
    expect(validateTitle(' a ').ok, isFalse);
    expect(validateTitle(' Dart ').message, 'Dart');
  });

  test('invariante de Card', () {
    expect(() => Card(id: 'C-1', title: ' '), throwsArgumentError);
  });

  test('snapshot local', () async {
    expect(
      await createLocalSnapshot(boardId: 'b', cardCount: 2),
      'snapshot:b:2',
    );
  });
}

