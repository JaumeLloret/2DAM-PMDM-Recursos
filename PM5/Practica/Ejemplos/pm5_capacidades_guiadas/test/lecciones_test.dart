import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:pm5_capacidades_guiadas/fixtures.dart';
import 'package:pm5_capacidades_guiadas/lecciones.dart';

void main() {
  test('inicio pendiente no crea sensor después de dispose', () async {
    final input = StreamController<Sample>();
    final lesson = SensorLesson();
    final pending = lesson.start(input.stream);
    lesson.dispose();
    await pending;
    expect(input.hasListener, isFalse);
    final drained = input.stream.drain<void>();
    await input.close();
    await drained;
  });
  test('suspender invalida un inicio que esperaba cancelación', () async {
    final cancelled = Completer<void>();
    final old = StreamController<Sample>(onCancel: () => cancelled.future);
    final replacement = StreamController<Sample>();
    final lesson = SensorLesson();
    await lesson.start(old.stream);
    final pending = lesson.start(replacement.stream);
    await lesson.suspend();
    cancelled.complete();
    await pending;
    expect(replacement.hasListener, isFalse);
    expect(lesson.state, 'paused');
    await old.close();
    final drained = replacement.stream.drain<void>();
    await replacement.close();
    await drained;
    lesson.dispose();
  });
  test('dos inicios conservan solo el sensor más reciente', () async {
    final first = StreamController<Sample>();
    final second = StreamController<Sample>();
    final lesson = SensorLesson();
    await Future.wait([
      lesson.start(first.stream),
      lesson.start(second.stream),
    ]);
    expect(first.hasListener, isFalse);
    expect(second.hasListener, isTrue);
    await lesson.stop();
    final drained = first.stream.drain<void>();
    await first.close();
    await drained;
    await second.close();
    lesson.dispose();
  });
  test('PNG válido se recodifica y reduce; el JPEG tiene bytes y dimensiones reales', () {
    final before = demoPng();
    expect(img.decodePng(before)!.width, 1280);
    final out = processImage(before, 'image/png');
    expect(out.mime, 'image/jpeg');
    expect(out.width, 1024);
    expect(out.bytes.take(2), [255, 216]);
    expect(img.decodeJpg(out.bytes)!.width, 1024);
  });
  test('tipo, tamaño y corrupción se distinguen', () {
    for (final pair in [
      (demoPng(), 'text/plain', 'unsupported_mime'),
      (demoTooLarge(), 'image/png', 'too_large'),
      (demoCorrupt(), 'image/png', 'decode_failed'),
    ]) {
      expect(
        () => processImage(pair.$1, pair.$2),
        throwsA(isA<LessonFailure>().having((e) => e.code, 'code', pair.$3)),
      );
    }
  });
  test('recuperación reutiliza procesador con JPEG → PNG y regla distinta', () {
    final jpeg = processImage(demoPng(), 'image/png');
    final png = processImage(
      jpeg.bytes,
      'image/jpeg',
      jpeg: false,
      maxWidth: 640,
      maxBytes: 3 * 1024 * 1024,
    );
    expect(img.decodePng(png.bytes)!.width, 640);
  });
  test('BLE deduplica, cierra scan y desconecta tras ping', () async {
    final port = ScriptedBle();
    final lesson = BleLesson(port);
    expect((await lesson.discover()).length, 1);
    expect(port.activeScans, 0);
    expect(await lesson.ping('DEMO-A'), 'DEMO-PONG');
    expect(port.connected, isFalse);
  });
  test('timeout y desconexión no dejan conexión abierta', () async {
    for (final scenario in [BleCase.timeout, BleCase.disconnected]) {
      final port = ScriptedBle(scenario);
      await expectLater(
        BleLesson(port).ping('DEMO-A'),
        throwsA(isA<LessonFailure>()),
      );
      expect(port.connected, isFalse);
    }
  });
  test('sensor cancela al suspender; no acepta muestras posteriores', () async {
    final input = StreamController<Sample>();
    final lesson = SensorLesson();
    await lesson.start(input.stream);
    input.add(const Sample(1, 0));
    await Future<void>.delayed(Duration.zero);
    expect(lesson.latest!.x, 1);
    await lesson.suspend();
    input.add(const Sample(2, 150));
    await Future<void>.delayed(Duration.zero);
    expect(lesson.latest!.x, 1);
    await input.close();
    lesson.dispose();
  });
  test('sensor separa última muestra de repintado limitado', () async {
    final input = StreamController<Sample>();
    final lesson = SensorLesson();
    await lesson.start(input.stream);
    input.add(const Sample(1, 0));
    input.add(const Sample(2, 50));
    await Future<void>.delayed(Duration.zero);
    expect(lesson.latest!.x, 2);
    expect(lesson.displayed!.x, 1);
    await lesson.stop();
    await input.close();
    lesson.dispose();
  });
  test('denegaciones ofrecen salidas diferentes', () {
    expect(permissionMessage(Decision.denied), contains('reintentar'));
    expect(permissionMessage(Decision.permanentlyDenied), contains('Ajustes'));
  });
  test('play antes de load falla; al suspender el estado se pausa', () {
    final p = DemoPlayer();
    expect(p.play, throwsA(isA<LessonFailure>()));
    p.load();
    p.play();
    p.pause();
    expect(p.state, AudioState.paused);
    p.dispose();
  });
  test('WAV sintético tiene cabeceras y datos; no es una grabación', () {
    final tone = demoTone();
    expect(String.fromCharCodes(tone.take(4)), 'RIFF');
    expect(String.fromCharCodes(tone.sublist(8, 12)), 'WAVE');
    expect(tone.length, greaterThan(44));
  });
}
