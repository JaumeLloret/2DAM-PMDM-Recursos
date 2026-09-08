enum Priority { low, normal, high, urgent }

String ownerLabel(String? owner) {
  final normalized = owner?.trim();
  if (normalized == null || normalized.isEmpty) {
    return 'SIN RESPONSABLE';
  }
  return normalized.toUpperCase();
}

List<String> normalizedTitles(Iterable<String> titles) {
  final unique = <String>{};
  for (final raw in titles) {
    final title = raw.trim();
    if (title.length >= 4) {
      unique.add(title.toUpperCase());
    }
  }
  return List.unmodifiable(unique);
}

({bool ok, String message}) validateTitle(String raw) {
  final title = raw.trim();
  if (title.length < 3) {
    return (ok: false, message: 'Mínimo 3 caracteres');
  }
  return (ok: true, message: title);
}

int priorityLimit(Priority priority) => switch (priority) {
  Priority.low => 10,
  Priority.normal => 8,
  Priority.high => 4,
  Priority.urgent => 1,
};

class Card {
  Card({required this.id, required String title, this.owner})
    : title = _validTitle(title);

  final String id;
  final String title;
  final String? owner;

  String get label => '$id · $title · ${owner ?? 'sin responsable'}';

  static String _validTitle(String raw) {
    final title = raw.trim();
    if (title.length < 3) {
      throw ArgumentError.value(raw, 'title', 'Mínimo 3 caracteres');
    }
    return title;
  }
}

Future<String> createLocalSnapshot({
  required String boardId,
  required int cardCount,
}) async {
  await Future<void>.delayed(const Duration(milliseconds: 10));
  if (boardId.trim().isEmpty) {
    throw ArgumentError.value(boardId, 'boardId', 'No puede estar vacío');
  }
  return 'snapshot:$boardId:$cardCount';
}

