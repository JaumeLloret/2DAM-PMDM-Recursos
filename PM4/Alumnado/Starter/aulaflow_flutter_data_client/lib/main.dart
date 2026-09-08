import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data.dart';

void main() {
  const raw = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://127.0.0.1:8080',
  );
  runApp(
    StarterApp(repository: RemoteOnlyRepository(http.Client(), Uri.parse(raw))),
  );
}

class StarterApp extends StatefulWidget {
  const StarterApp({required this.repository, super.key});

  final RemoteOnlyRepository repository;

  @override
  State<StarterApp> createState() => _StarterAppState();
}

class _StarterAppState extends State<StarterApp> {
  List<StarterTask> tasks = const [];
  String? error;
  bool loading = false;

  Future<void> connect() async {
    setState(() {
      loading = true;
      error = null;
    });
    try {
      await widget.repository.login('demo@aulaflow.local', 'DEMO-pass');
      tasks = await widget.repository.loadTasks();
    } on Object {
      error = 'La operación no pudo completarse.';
    } finally {
      if (mounted) {
        setState(() => loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
    ),
    home: Scaffold(
      appBar: AppBar(title: const Text('PM4 starter remoto')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
          ? Center(child: Text(error!))
          : tasks.isEmpty
          ? Center(
              child: FilledButton(
                key: const Key('connect'),
                onPressed: connect,
                child: const Text('Conectar demo'),
              ),
            )
          : ListView(
              children: [
                for (final task in tasks)
                  ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.status),
                  ),
              ],
            ),
    ),
  );
}

