typedef WeakCard = Map<String, dynamic>;
typedef WeakColumn = Map<String, dynamic>;

List<WeakColumn> seedWeakBoard() {
  return <WeakColumn>[
    <String, dynamic>{
      'id': 'todo',
      'capacity': 3,
      'cards': <WeakCard>[
        <String, dynamic>{
          'id': 'C-1',
          'title': 'Modelar dominio',
          'priority': 'HIGH',
          'owner': 'm-1',
        },
        <String, dynamic>{
          'id': 'C-2',
          'title': 'Revisar null safety',
          'priority': 'NORMAL',
          'owner': null,
        },
      ],
    },
    <String, dynamic>{'id': 'doing', 'capacity': 1, 'cards': <WeakCard>[]},
  ];
}

WeakColumn? findWeakColumn(List<WeakColumn> board, String id) {
  for (final column in board) {
    if (column['id'] == id) return column;
  }
  return null;
}

String moveWeakCard(
  List<WeakColumn> board,
  String cardId,
  String sourceId,
  String targetId,
) {
  final source = findWeakColumn(board, sourceId);
  final target = findWeakColumn(board, targetId);
  if (source == null || target == null) return 'Columna inexistente';

  final sourceCards = source['cards'] as List<WeakCard>;
  final targetCards = target['cards'] as List<WeakCard>;
  final capacity = target['capacity'] as int;
  if (targetCards.length >= capacity) return 'Destino lleno';

  WeakCard? selected;
  for (final card in sourceCards) {
    if (card['id'] == cardId) selected = card;
  }
  if (selected == null) return 'Tarjeta inexistente';

  sourceCards.remove(selected);
  targetCards.add(selected);
  return '$cardId movida';
}

int weakCount(List<WeakColumn> board, String columnId) {
  final column = findWeakColumn(board, columnId);
  if (column == null) return 0;
  return (column['cards'] as List<WeakCard>).length;
}

Future<String> weakSnapshot(String boardId, List<WeakColumn> board) async {
  await Future<void>.delayed(const Duration(milliseconds: 10));
  if (boardId.trim().isEmpty) throw StateError('boardId vacío');
  final parts = board
      .map((column) => '${column['id']}:${(column['cards'] as List).length}')
      .join('|');
  return '$boardId|$parts';
}

