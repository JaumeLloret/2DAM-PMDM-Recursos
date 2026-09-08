import 'package:test/test.dart';

import '../lib/weak_board.dart';

void main() {
  test('starter ejecuta su recorrido base', () async {
    final board = seedWeakBoard();
    expect(moveWeakCard(board, 'C-1', 'todo', 'doing'), 'C-1 movida');
    expect(weakCount(board, 'todo'), 1);
    expect(weakCount(board, 'doing'), 1);
    expect(await weakSnapshot('board-demo', board), contains('board-demo'));
  });
}

