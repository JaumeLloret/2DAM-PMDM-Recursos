class Entry {
  const Entry(this.id, this.title, this.done);
  final String id;
  final String title;
  final bool done;
}

const demoEntries = [
  Entry('DEMO-A', 'Revisión de cámara', false),
  Entry('DEMO-B', 'Preparar documentación', true),
  Entry('DEMO-C', 'Revision de cámara', true),
  Entry('DEMO-D', 'Plan de mañana', false),
];
