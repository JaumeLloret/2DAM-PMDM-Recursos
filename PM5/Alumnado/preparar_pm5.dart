import 'dart:convert';
import 'dart:io';

/// Desde PM5/: dart run Alumnado/preparar_pm5.dart starter|ejemplo|recuperacion
Future<void> main(List<String> args) async {
  const paths = {
    'starter': 'Practica/Starter/aulaflow_device_media_starter',
    'ejemplo': 'Practica/Ejemplos/pm5_capacidades_guiadas',
    'recuperacion': 'Practica/Recuperacion/Starter/museum_pocket_guide_starter',
  };
  final choice = args.isEmpty ? 'starter' : args.single;
  final rel = paths[choice];
  if (rel == null || !File('$rel/pubspec.yaml').existsSync()) {
    stderr.writeln(
      'Abre la raíz PM5/ y elige starter, ejemplo o recuperacion.',
    );
    exitCode = 2;
    return;
  }
  final project = Directory(rel).absolute;
  final pubspec = File('${project.path}/pubspec.yaml');
  final name = RegExp(
    r'^name:\s*(\w+)',
    multiLine: true,
  ).firstMatch(pubspec.readAsStringSync())!.group(1)!;
  final original = <String, List<int>>{};
  for (final folder in ['lib', 'test']) {
    final dir = Directory('${project.path}/$folder');
    if (dir.existsSync()) {
      for (final f in dir.listSync(recursive: true).whereType<File>()) {
        original[f.path] = f.readAsBytesSync();
      }
    }
  }
  for (final file in ['pubspec.yaml', 'analysis_options.yaml']) {
    final f = File('${project.path}/$file');
    if (f.existsSync()) original[f.path] = f.readAsBytesSync();
  }
  final sample = File('${project.path}/test/widget_test.dart');
  final hadSample = sample.existsSync();
  Future<bool> flutter(List<String> command) async {
    final process = await Process.start(
      Platform.isWindows ? 'flutter.bat' : 'flutter',
      command,
      workingDirectory: project.path,
      mode: ProcessStartMode.inheritStdio,
      runInShell: Platform.isWindows,
    );
    return await process.exitCode == 0;
  }

  if (!await flutter([
    'create',
    '.',
    '--platforms=android,web',
    '--project-name',
    name,
  ])) {
    exitCode = 3;
    return;
  }
  if (!hadSample && sample.existsSync()) sample.deleteSync();
  final analysis = '${project.path}/analysis_options.yaml';
  if (original.containsKey(analysis))
    File(analysis).writeAsBytesSync(original[analysis]!);
  for (final e in original.entries) {
    final actual = File(e.key).readAsBytesSync();
    if (actual.length != e.value.length ||
        List.generate(
          actual.length,
          (i) => i,
        ).any((i) => actual[i] != e.value[i]))
      throw StateError('Flutter modificó una fuente del paquete: ${e.key}');
  }
  final gradle = File('${project.path}/android/app/build.gradle.kts');
  if (gradle.existsSync())
    gradle.writeAsStringSync(
      gradle.readAsStringSync().replaceFirst(
        'minSdk = flutter.minSdkVersion',
        'minSdk = 24',
      ),
    );
  if (choice == 'ejemplo') {
    final manifest = File(
      '${project.path}/android/app/src/main/AndroidManifest.xml',
    );
    var m = manifest.readAsStringSync();
    const permissions = '''
<uses-feature android:name="android.hardware.bluetooth_le" android:required="false" />
<uses-feature android:name="android.hardware.sensor.accelerometer" android:required="false" />
<uses-feature android:name="android.hardware.camera.any" android:required="false" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" android:usesPermissionFlags="neverForLocation" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.CAMERA" />
''';
    if (!m.contains('android.permission.BLUETOOTH_SCAN')) {
      m = m.replaceFirst('</manifest>', '$permissions\n</manifest>');
      manifest.writeAsStringSync(m);
    }
  }
  if (!await flutter(['pub', 'get'])) {
    exitCode = 4;
    return;
  }
  if (choice == 'ejemplo') {
    // Puente ya validado en el curso para la versión fijada 5.5.0; no actualiza el paquete.
    final config = File('${project.path}/.dart_tool/package_config.json');
    final data = jsonDecode(config.readAsStringSync()) as Map<String, dynamic>;
    final package = (data['packages'] as List)
        .cast<Map<String, dynamic>>()
        .singleWhere((p) => p['name'] == 'reactive_ble_mobile');
    final packageRoot = Directory.fromUri(
      config.uri.resolve(package['rootUri'] as String),
    );
    if (!File('${packageRoot.path}/pubspec.yaml')
        .readAsStringSync()
        .contains('version: 5.5.0'))
      throw StateError('Versión BLE distinta de la del curso.');
    final build = File('${packageRoot.path}/android/build.gradle');
    final text = build.readAsStringSync();
    if (text.contains('compileSdkVersion 33')) {
      build.writeAsStringSync(
        text.replaceFirst('compileSdkVersion 33', 'compileSdkVersion 36'),
      );
    } else if (!text.contains('compileSdkVersion 36')) {
      throw StateError('El puente BLE requiere revisión del docente.');
    }
  }
  stdout.writeln(
    'PM5_PREPARADO: $rel. Abre esa carpeta en VS Code o Android Studio.',
  );
  stdout.writeln(
    'Comprueba flutter analyze y flutter test. DEMO web: flutter run -d chrome',
  );
  if (choice == 'ejemplo')
    stdout.writeln(
      'Android real: flutter run -t lib/main_android.dart -d ID_ANDROID',
    );
}
