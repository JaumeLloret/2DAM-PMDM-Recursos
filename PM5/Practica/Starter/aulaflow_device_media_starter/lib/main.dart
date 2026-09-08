import 'package:flutter/material.dart';

import 'demo_fakes.dart';
import 'device_controller.dart';

void main() => runApp(const StarterApp());

class StarterApp extends StatefulWidget {
  const StarterApp({super.key});

  @override
  State<StarterApp> createState() => _StarterAppState();
}

class _StarterAppState extends State<StarterApp> {
  late final DemoPermissionPort permissions;
  late final DeviceController controller;

  @override
  void initState() {
    super.initState();
    permissions = DemoPermissionPort();
    controller = DeviceController(
      permissions: permissions,
      ble: DemoBlePort(),
      sensor: DemoSensorPort(),
      media: DemoMediaPort(),
    )..addListener(_refresh);
  }

  void _refresh() => setState(() {});

  @override
  void dispose() {
    controller
      ..removeListener(_refresh)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
    home: Scaffold(
      appBar: AppBar(title: const Text('PM5 · Starter DEMO')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(controller.status, key: const Key('status')),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: controller.requestCamera,
            child: const Text('Pedir cámara en contexto'),
          ),
          FilledButton.tonal(
            onPressed: controller.scan,
            child: const Text('Escanear DEMO'),
          ),
          FilledButton.tonal(
            onPressed: controller.startSensor,
            child: const Text('Iniciar sensor DEMO'),
          ),
          FilledButton.tonal(
            onPressed: controller.processFixture,
            child: const Text('Procesar fixture DEMO'),
          ),
          if (controller.latest case final sample?)
            Text('x=${sample.x.toStringAsFixed(1)}'),
        ],
      ),
    ),
  );
}

