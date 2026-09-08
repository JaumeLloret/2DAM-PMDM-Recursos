import 'package:flutter/material.dart';

import 'quality.dart';

void main() => runApp(const QualityApp());

class QualityApp extends StatefulWidget {
  const QualityApp({super.key, this.store});
  final TaskStore? store;
  @override
  State<QualityApp> createState() => _QualityAppState();
}

class _QualityAppState extends State<QualityApp> {
  late final QualityController controller;
  @override
  void initState() {
    super.initState();
    controller = QualityController(
      widget.store ?? DemoStore(failFirst: true, count: 1500),
    );
    controller.load();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'AulaFlow Mobile Quality Gate',
    theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
    home: Scaffold(
      appBar: AppBar(title: const Text('Quality Gate · DEMO')),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Pendientes: ${controller.pendingCount}',
                key: const Key('pending'),
              ),
            ),
            FilledButton(
              onPressed: controller.load,
              child: const Text('Recargar'),
            ),
            if (controller.loading)
              const LinearProgressIndicator(key: Key('loading')),
            if (controller.error != null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      controller.error!,
                      key: const Key('error'),
                      semanticsLabel: controller.error,
                    ),
                    OutlinedButton(
                      key: const Key('retry'),
                      onPressed: controller.load,
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
            if (!controller.loading &&
                controller.error == null &&
                controller.items.isEmpty)
              const Text(
                'No hay trabajos. Recarga cuando quieras.',
                key: Key('empty'),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return CheckboxListTile(
                    key: ValueKey(item.id),
                    title: Text(item.title),
                    value: item.done,
                    onChanged: (_) => controller.toggle(item.id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
