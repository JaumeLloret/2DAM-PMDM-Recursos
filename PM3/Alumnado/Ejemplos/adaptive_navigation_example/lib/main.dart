import 'package:flutter/material.dart';

void main() => runApp(const AdaptiveExampleApp());

class AdaptiveExampleApp extends StatelessWidget {
  const AdaptiveExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const AdaptiveCounterShell(),
    );
  }
}

class AdaptiveCounterShell extends StatefulWidget {
  const AdaptiveCounterShell({super.key});

  @override
  State<AdaptiveCounterShell> createState() => _AdaptiveCounterShellState();
}

class _AdaptiveCounterShellState extends State<AdaptiveCounterShell> {
  int _selectedIndex = 0;
  int _count = 0;

  static const _destinations = <NavigationDestination>[
    NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Inicio'),
    NavigationDestination(icon: Icon(Icons.list_alt_outlined), label: 'Tareas'),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      label: 'Ajustes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 600;
        final content = SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Destino ${_destinations[_selectedIndex].label}'),
                const SizedBox(height: 12),
                Text('Pulsaciones: $_count'),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () => setState(() => _count++),
                  icon: const Icon(Icons.add),
                  label: const Text('Incrementar'),
                ),
              ],
            ),
          ),
        );

        return Scaffold(
          appBar: AppBar(title: const Text('Ejemplo adaptable')),
          body: wide
              ? Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _selectedIndex,
                      labelType: NavigationRailLabelType.all,
                      onDestinationSelected: _select,
                      destinations: _destinations
                          .map(
                            (item) => NavigationRailDestination(
                              icon: item.icon,
                              label: Text(item.label),
                            ),
                          )
                          .toList(),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: content),
                  ],
                )
              : content,
          bottomNavigationBar: wide
              ? null
              : NavigationBar(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: _select,
                  destinations: _destinations,
                ),
        );
      },
    );
  }

  void _select(int index) => setState(() => _selectedIndex = index);
}

