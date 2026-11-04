import 'package:flutter/material.dart';

import 'notices.dart';

void main() => runApp(const NoticesApp());

class NoticesApp extends StatelessWidget {
  const NoticesApp({super.key});
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: NoticesScreen());
}

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});
  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  int minimum = 1;
  bool hideRead = false;
  @override
  Widget build(BuildContext context) {
    final visible = selectNotices(notices, minimum, hideRead);
    return Scaffold(
      appBar: AppBar(title: const Text('Avisos DEMO')),
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Ocultar leídos'),
              value: hideRead,
              onChanged: (value) => setState(() => hideRead = value),
            ),
            Wrap(
              spacing: 8,
              children: [1, 2, 3]
                  .map(
                    (value) => ChoiceChip(
                      label: Text('Prioridad $value o más'),
                      selected: minimum == value,
                      onSelected: (_) => setState(() => minimum = value),
                    ),
                  )
                  .toList(),
            ),
            Text('${visible.length} de ${notices.length}'),
            TextButton(
              onPressed: () => setState(() => minimum = 1),
              child: const Text('Restablecer prioridad'),
            ),
            Expanded(
              child: visible.isEmpty
                  ? const Center(
                      child: Text('No hay avisos con estas condiciones.'),
                    )
                  : ListView(
                      children: visible
                          .map(
                            (n) => ListTile(
                              key: ValueKey(n.id),
                              title: Text(n.title),
                              subtitle: Text('Prioridad ${n.priority}'),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
