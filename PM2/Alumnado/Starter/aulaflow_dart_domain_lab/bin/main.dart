import '../lib/weak_board.dart';

Future<void> main() async {
  final board = seedWeakBoard();
  // ignore: avoid_print
  print(
    'ANTES · todo=${weakCount(board, 'todo')} · doing=${weakCount(board, 'doing')}',
  );

  final message = moveWeakCard(board, 'C-1', 'todo', 'doing');
  // ignore: avoid_print
  print('MOVE · $message');

  // ignore: avoid_print
  print(
    'DESPUÉS · todo=${weakCount(board, 'todo')} · doing=${weakCount(board, 'doing')}',
  );

  try {
    // ignore: avoid_print
    print('SNAPSHOT · ${await weakSnapshot('board-demo', board)}');
  } on StateError catch (error) {
    // ignore: avoid_print
    print('SNAPSHOT ERROR · $error');
  }
}

