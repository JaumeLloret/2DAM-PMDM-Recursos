import 'package:flutter/material.dart';

import 'catalog.dart';

void main() => runApp(const SearchApp());

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Consulta DEMO')),
      body: ListView(
        children: demoEntries
            .map(
              (entry) => ListTile(
                key: ValueKey(entry.id),
                title: Text(entry.title),
                subtitle: Text(entry.done ? 'Terminada' : 'Pendiente'),
              ),
            )
            .toList(),
      ),
    ),
  );
}
