import '../lib/examples.dart';

Future<void> main() async {
  // ignore: avoid_print
  print('null-safety: ${ownerLabel(null)}');

  final titles = normalizedTitles([' Dart ', '', 'modelado', 'Dart']);
  // ignore: avoid_print
  print('colecciones: $titles');

  final result = validateTitle(' Dart ');
  final (:ok, :message) = result;
  // ignore: avoid_print
  print('record: $ok · $message');

  // ignore: avoid_print
  print('switch: ${priorityLimit(Priority.urgent)}');

  final card = Card(id: 'C-1', title: ' Dart seguro ');
  // ignore: avoid_print
  print('clase: ${card.label}');

  try {
    final snapshot = await createLocalSnapshot(
      boardId: 'board-demo',
      cardCount: 2,
    );
    // ignore: avoid_print
    print('async: $snapshot');
  } on ArgumentError catch (error) {
    // ignore: avoid_print
    print('async-error: $error');
  }
}

