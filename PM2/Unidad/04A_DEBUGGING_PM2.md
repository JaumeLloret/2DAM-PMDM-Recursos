# PM2 · Debugging: una tarjeta que desaparece

## Problema

Vas a depurar una operación que informa correctamente de que el destino está lleno, pero pierde la tarjeta de origen. El programa compila: el fallo está en el orden de las operaciones y en la invariante que debía conservarse.

## Estado seguro

No necesitas Git para esta actividad. Duplica la carpeta `aulaflow_dart_domain_lab` y llama a la copia `aulaflow_dart_domain_lab_debug`. Trabaja solo en esa copia.

Abre la carpeta copiada —la que contiene `pubspec.yaml`— y ejecuta:

```bash
dart pub get
dart run bin/debug_scenario.dart
```

## Síntoma esperado

```text
ANTES · todo=2 · doing=1
RESULTADO · Destino lleno
DESPUÉS · todo=1 · doing=1
BUG · C-1 ha desaparecido
```

La operación ha detectado que `doing` está llena, pero ya había retirado `C-1` de `todo`.

## No cambies todavía el código

Anota:

1. dos hipótesis sobre el orden de las operaciones;
2. qué colección debes observar antes y después;
3. qué regla debe cumplirse aunque el movimiento falle.

## Inspecciona

Abre `lib/debug_scenario.dart` y localiza:

- selección de la tarjeta;
- retirada de la columna origen;
- comprobación de capacidad;
- inserción en destino.

Traza a mano el tamaño de ambas listas después de cada línea. No necesitas un debugger gráfico para esta primera reparación.

## Reparación mínima

Mueve la comprobación que impide la operación **antes** de la primera mutación. No reescribas todo el starter ni ocultes el error con un `try/catch`.

Ejecuta de nuevo:

```bash
dart run bin/debug_scenario.dart
```

Checkpoint reparado:

```text
ANTES · todo=2 · doing=1
RESULTADO · Destino lleno
DESPUÉS · todo=2 · doing=1
OK · C-1 continúa en todo
```

## Regresión

En tu copia crea un test que compruebe dos condiciones cuando el destino está lleno:

```dart
expect(result, 'Destino lleno');
expect(sourceCards.any((card) => card['id'] == 'C-1'), isTrue);
```

Adapta los nombres a tu fichero y ejecuta:

```bash
dart test
```

## Qué conservas

- hipótesis previa;
- causa en 2–4 frases;
- cambio mínimo;
- salida antes/después;
- test o comprobación de regresión.

## Qué has aprendido

Validar tarde puede romper una invariante aunque el mensaje de error sea correcto. Una operación que mueve datos debe comprobar primero si puede completarse o disponer de una forma segura de revertirse.

