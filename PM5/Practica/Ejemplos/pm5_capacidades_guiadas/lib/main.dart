import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'fixtures.dart';
import 'lecciones.dart';

void main() => runApp(const GuidedApp());

class GuidedApp extends StatefulWidget {
  const GuidedApp({super.key});
  @override
  State<GuidedApp> createState() => _GuidedAppState();
}

class _GuidedAppState extends State<GuidedApp> with WidgetsBindingObserver {
  final sensor = SensorLesson();
  final player = DemoPlayer();
  final ble = BleLesson(ScriptedBle());
  final store = MemoryDraftStore(<String, Uint8List>{});
  Derivative? preview;
  String message = 'DEMO: estados simulados; conversión de imagen real.';
  bool busy = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    sensor.addListener(refresh);
    player.addListener(refresh);
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  Future<void> action(Future<void> Function() work) async {
    if (busy) return;
    setState(() => busy = true);
    try {
      await work();
    } on LessonFailure catch (e) {
      message = e.code;
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> suspend() async {
    await ble.stop();
    await sensor.suspend();
    player.pause();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive)
      unawaited(suspend());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    sensor.removeListener(refresh);
    player.removeListener(refresh);
    unawaited(ble.stop());
    sensor.dispose();
    player.dispose();
    super.dispose();
  }

  void process(Uint8List input) {
    final result = processImage(input, 'image/png');
    final draft = store.save(result);
    preview = result;
    message =
        '${draft.id}: ${draft.mime}, ${draft.bytes} bytes. Subida no implementada.';
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('PM5 · capacidades guiadas · DEMO')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(message),
            const Text('No se están usando radio, cámara ni sensor físicos.'),
            Wrap(
              spacing: 8,
              children: [
                for (final d in Decision.values)
                  OutlinedButton(
                    onPressed: () =>
                        setState(() => message = permissionMessage(d)),
                    child: Text(d.name),
                  ),
              ],
            ),
            FilledButton(
              onPressed: busy
                  ? null
                  : () => action(() async {
                      final found = await ble.discover();
                      message =
                          '${found.length} periférico único; ${await ble.ping(found.first.id)}';
                    }),
              child: const Text('Scan y ping DEMO'),
            ),
            FilledButton(
              onPressed: () => action(() async {
                final lesson = BleLesson(ScriptedBle(BleCase.timeout));
                await lesson.ping('DEMO-A');
              }),
              child: const Text('Timeout BLE DEMO'),
            ),
            FilledButton(
              onPressed: () => sensor.start(
                Stream<Sample>.periodic(
                  const Duration(milliseconds: 30),
                  (i) => Sample(i / 10, i * 30),
                ).take(20),
              ),
              child: const Text('Iniciar traza de sensor'),
            ),
            Text(
              'Sensor: ${sensor.state}; x=${sensor.displayed?.x.toStringAsFixed(1) ?? "—"}',
            ),
            FilledButton(
              onPressed: () => action(() async {
                process(demoPng());
              }),
              child: const Text('PNG válido → JPEG'),
            ),
            OutlinedButton(
              onPressed: () => action(() async {
                process(demoCorrupt());
              }),
              child: const Text('Imagen corrupta'),
            ),
            OutlinedButton(
              onPressed: () => action(() async {
                process(demoTooLarge());
              }),
              child: const Text('Más de 5 MiB'),
            ),
            if (preview != null) Image.memory(preview!.bytes, height: 120),
            Wrap(
              spacing: 8,
              children: [
                OutlinedButton(
                  onPressed: player.load,
                  child: const Text('Load DEMO'),
                ),
                OutlinedButton(
                  onPressed: () => action(() async {
                    player.play();
                  }),
                  child: const Text('Play DEMO'),
                ),
                OutlinedButton(
                  onPressed: player.pause,
                  child: const Text('Pause DEMO'),
                ),
              ],
            ),
            Text(
              'Audio: ${player.state.name}; aquí se simula el estado, no suena.',
            ),
            AnimatedContainer(
              duration: MediaQuery.disableAnimationsOf(context)
                  ? Duration.zero
                  : const Duration(milliseconds: 250),
              height: player.state == AudioState.playing ? 70 : 40,
              color: Colors.teal,
              child: const Center(
                child: Text('Animación controlada por estado'),
              ),
            ),
            OutlinedButton(
              onPressed: () => action(suspend),
              child: const Text('Suspender recursos'),
            ),
          ],
        ),
      ),
    ),
  );
}
