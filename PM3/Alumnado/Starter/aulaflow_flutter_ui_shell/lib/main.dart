import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const StarterApp());

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/tasks',
  routes: [
    GoRoute(
      path: '/tasks',
      builder: (_, _) => const StarterShell(index: 0, child: TaskList()),
    ),
    GoRoute(
      path: '/board',
      builder: (_, _) => const StarterShell(index: 1, child: Board()),
    ),
    GoRoute(
      path: '/settings',
      builder: (_, _) => const StarterShell(index: 2, child: Settings()),
    ),
    GoRoute(
      path: '/detail',
      builder: (_, state) => Detail(task: state.extra! as Map<String, Object>),
    ),
  ],
);

class StarterShell extends StatelessWidget {
  const StarterShell({required this.index, required this.child, super.key});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AulaFlow UI starter')),
      body: SafeArea(child: child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          const locations = ['/tasks', '/board', '/settings'];
          context.go(locations[value]);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Tareas'),
          NavigationDestination(
            icon: Icon(Icons.view_kanban),
            label: 'Tablero',
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }
}

class DemoFixtures {
  static final tasks = <Map<String, Object>>[
    {'id': 'DEMO-201', 'title': 'Reparar overflow', 'done': false},
    {'id': 'DEMO-202', 'title': 'Separar estado', 'done': false},
    {'id': 'DEMO-203', 'title': 'Añadir feedback', 'done': true},
  ];
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool onlyPending = false;

  @override
  Widget build(BuildContext context) {
    final visible = DemoFixtures.tasks
        .where((task) => !onlyPending || task['done'] == false)
        .toList();
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Solo pendientes'),
          value: onlyPending,
          onChanged: (value) => setState(() => onlyPending = value),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: visible.length,
            itemBuilder: (context, index) {
              final task = visible[index];
              return ListTile(
                title: Text(task['title']! as String),
                subtitle: Text(task['id']! as String),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/detail', extra: task),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            title: Text('Pendientes'),
            subtitle: Text('2 tareas demo'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Terminadas'),
            subtitle: Text('1 tarea demo'),
          ),
        ),
      ],
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Ajustes de demostración'));
  }
}

class Detail extends StatefulWidget {
  const Detail({required this.task, super.key});

  final Map<String, Object> task;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle starter')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.task['title']! as String,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(widget.task['id']! as String),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  setState(
                    () => widget.task['done'] = !(widget.task['done']! as bool),
                  );
                },
                child: const Text('Alternar estado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

