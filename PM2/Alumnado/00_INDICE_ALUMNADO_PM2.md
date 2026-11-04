# PM2 · Cómo utilizar el paquete del alumnado

Empieza por `Unidad/01_GUIA_ALUMNADO_PM2.md`. Esa Ruta indica qué leer, hacer, comprobar y conservar en las 8 horas de PM2.

## Orden recomendado

1. **Ruta y diagnóstico** · `Unidad/01` + Q01–Q05.
2. **Teoría con propósito** · `Unidad/02`.
3. **Ejemplos reproducibles** · `Unidad/03` + `Ejemplos/dart_moderno_examples/`.
4. **Entrenamiento** · `Unidad/04` + `01_CUADERNO_KATAS_PM2.md`.
5. **Debugging** · `Unidad/04A_DEBUGGING_PM2.md`.
6. **Laboratorio** · `Starter/aulaflow_dart_domain_lab/` + `Unidad/05`.
7. **Entrega** · `Unidad/06` + plantillas/checklist.
8. **Autoevaluación** · `Unidad/12` + Q06–Q12.

Los talleres de `Unidad/10` son opcionales y contienen una ruta autónoma equivalente.

## Comandos base

Ejecuta desde la carpeta que contiene `pubspec.yaml`:

<pre style="white-space: pre-wrap; overflow-wrap: anywhere;"><code>dart --version
dart pub get
dart format --output=none --set-exit-if-changed .
dart analyze
dart run bin/main.dart
dart test</code></pre>

Registra salidas reales. Si un comando falla, conserva el primer error y consulta `Unidad/11_AYUDA_PM2.md`.

## Qué no contiene este paquete

No incluye soluciones, oráculos ni variantes individuales. Tampoco necesitas widgets Flutter, red, autenticación, persistencia, sensores o multimedia.

La recuperación `Recuperacion/loan_queue_recovery/` solo se utiliza cuando se asigne expresamente. La ampliación es opcional.

