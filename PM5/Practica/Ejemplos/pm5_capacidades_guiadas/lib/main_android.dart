import 'dart:async';

import 'package:flutter/material.dart';

import 'android_lab.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AndroidLessonApp());
}

class AndroidLessonApp extends StatefulWidget {
  const AndroidLessonApp({super.key});
  @override
  State<AndroidLessonApp> createState() => _AndroidLessonAppState();
}

class _AndroidLessonAppState extends State<AndroidLessonApp>
    with WidgetsBindingObserver {
  late final AndroidLab lab;
  bool busy = false;
  @override
  void initState() {
    super.initState();
    lab = AndroidLab()..addListener(refresh);
    WidgetsBinding.instance.addObserver(this);
    unawaited(lab.run(lab.recoverLost));
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  Future<void> action(Future<void> Function() work) async {
    if (busy) return;
    setState(() => busy = true);
    await lab.run(work);
    if (mounted) setState(() => busy = false);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) unawaited(lab.run(lab.suspend));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    lab.removeListener(refresh);
    unawaited(lab.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('PM5 · Android · observación por capacidad'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(lab.message),
          const Text(
            'Usa una tarjeta o escena DEMO. Una operación no demuestra las demás.',
          ),
          for (final item in <(String, Future<void> Function())>[
            ('Pedir cámara', lab.cameraPermission),
            ('Abrir Ajustes', lab.settings),
            ('Iniciar sensor real', lab.startSensor),
            ('Seleccionar imagen DEMO', () => lab.pick()),
            ('Capturar DEMO-OBJECT', () => lab.pick(camera: true)),
            ('Recuperar datos interrumpidos', lab.recoverLost),
            ('Cargar tono sintético', lab.loadAudio),
            ('Reproducir tono', lab.playAudio),
            ('Pausar tono', lab.pauseAudio),
            ('Buscar periférico de aula', lab.scan),
            ('Conectar e intercambiar GATT', lab.connectAndPing),
            ('Suspender recursos', lab.suspend),
          ])
            OutlinedButton(
              onPressed: busy ? null : () => action(item.$2),
              child: Text(item.$1),
            ),
          Text('Última muestra x: ${lab.x?.toStringAsFixed(2) ?? "—"}'),
          if (lab.preview != null) Image.memory(lab.preview!, height: 160),
        ],
      ),
    ),
  );
}
