class Notice {
  const Notice(this.id, this.title, this.priority, this.read);
  final String id;
  final String title;
  final int priority;
  final bool read;
}

const notices = [
  Notice('AV-A', 'Preparar el equipo', 3, false),
  Notice('AV-B', 'Comprobar el aula', 1, false),
  Notice('AV-C', 'Confirmar el horario', 3, true),
];

List<Notice> selectNotices(List<Notice> source, int minimum, bool hideRead) =>
    source
        .where((n) => n.priority >= minimum && (!hideRead || !n.read))
        .toList();
