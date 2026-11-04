# AulaFlow Dart Domain Lab · starter

Proyecto didáctico local para PM2. No contiene widgets, API, persistencia ni el modelo contractual de AulaFlow 2.0.

## Abrir correctamente

Duplica esta carpeta antes de refactorizar. Abre en VS Code o Android Studio la copia que contiene `pubspec.yaml`.

## Baseline

```bash
dart pub get
dart analyze
dart run bin/main.dart
dart test
```

Salida inicial:

```text
ANTES · todo=2 · doing=0
MOVE · C-1 movida
DESPUÉS · todo=1 · doing=1
SNAPSHOT · board-demo|todo:1|doing:1
```

El código ejecuta, pero usa maps/strings, admite nulos débiles y expone colecciones. Lee `Unidad/05_LABORATORIO_PM2.md` y refactoriza por hitos.

## Escenario de debugging

`dart run bin/debug_scenario.dart` reproduce una tarjeta que desaparece cuando el destino está lleno. Trabájalo en una copia siguiendo `Unidad/04A_DEBUGGING_PM2.md`.

## Si falla

- confirma que estás en la carpeta con `pubspec.yaml`;
- utiliza `dart run bin/main.dart`, no `dart run` sin entry point;
- conserva el primer mensaje exacto;
- consulta `Unidad/11_AYUDA_PM2.md`.

No intentes imitar una solución filtrada. Cada clase debe responder a una regla o responsabilidad que puedas explicar.
