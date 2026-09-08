# Ejemplos guiados PM2

Los ejemplos ejecutables están en [Alumnado/Ejemplos/dart_moderno_examples/](../Alumnado/Ejemplos/dart_moderno_examples). Cada bloque sigue `predice → ejecuta → modifica → explica`.

## Preparación

```bash
cd dart_moderno_examples
dart pub get
dart run
dart test
```

Salida esencial esperada:

```text
null-safety: SIN RESPONSABLE
colecciones: [DART, MODELADO]
record: true · DART
switch: 1
clase: C-1 · Dart seguro · sin responsable
async: snapshot:board-demo:2
```

Los milisegundos no forman parte de la evidencia.

## E1 · Una referencia final puede apuntar a una lista mutable

```dart
final tags = <String>['dart'];
tags.add('domain');
print(tags);
```

Predicción correcta: `[dart, domain]`. `final` impide reasignar `tags`, no mutar la lista. Modifica el ejemplo con `List.unmodifiable` y comprueba que `add` lanza en ejecución.

## E2 · Promoción antes que `!`

```dart
String ownerLabel(String? owner) {
  final normalized = owner?.trim();
  if (normalized == null || normalized.isEmpty) return 'SIN RESPONSABLE';
  return normalized.toUpperCase();
}
```

La comprobación permite que analyzer trate `normalized` como `String` en la última línea. Variante: devuelve `RESPONSABLE: ...`.

## E3 · Transformación legible

```dart
final result = titles
    .map((title) => title.trim())
    .where((title) => title.length >= 4)
    .map((title) => title.toUpperCase())
    .toList(growable: false);
```

Se separan los pasos si la cadena requiere comentarios para descifrarse. Variante: conservar el orden y eliminar duplicados conscientemente.

## E4 · Record o clase

```dart
({bool ok, String normalized}) normalizeTitle(String raw) {
  final value = raw.trim();
  return (ok: value.length >= 3, normalized: value);
}
```

Record es suficiente porque el resultado es pequeño, local y no tiene comportamiento. Si aparecen errores múltiples, reglas o vida propia, valora una clase.

## E5 · Switch exhaustivo sobre enum

```dart
enum Priority { low, normal, high, urgent }

int workInProgressLimit(Priority priority) => switch (priority) {
  Priority.low => 10,
  Priority.normal => 8,
  Priority.high => 4,
  Priority.urgent => 1,
};
```

Añade temporalmente un valor al enum: analyzer obliga a decidir su comportamiento. Esa es la ventaja sobre un `String`.

## E6 · Clase que protege una regla

```dart
class Card {
  final String id;
  final String title;

  Card({required this.id, required String title})
      : title = _validateTitle(title);

  static String _validateTitle(String raw) {
    final value = raw.trim();
    if (value.length < 3) {
      throw ArgumentError.value(raw, 'title', 'Mínimo 3 caracteres');
    }
    return value;
  }
}
```

Prueba `Card(id: 'C-1', title: '  ')`. La clase existe para nombrar tarjeta y mantener un título válido, no para envolver dos campos sin criterio.

## E7 · Copia defensiva

```dart
class Column {
  final List<Card> _cards;
  Column(Iterable<Card> cards) : _cards = List.of(cards);
  List<Card> get cards => List.unmodifiable(_cards);
}
```

El llamador no puede vaciar la lista interna mediante el getter. Decide si el método `add` pertenece a la columna o si prefieres una versión inmutable.

## E8 · Future local y fallo observable

```dart
Future<String> snapshot(String boardId) async {
  await Future<void>.delayed(const Duration(milliseconds: 10));
  if (boardId.isEmpty) throw ArgumentError('boardId vacío');
  return 'snapshot:$boardId';
}
```

El `Future` simula una espera local controlada. No hay HTTP, archivo ni base de datos. Variante: captura el error en `main` y escribe un mensaje útil.

## Preguntas de cierre

1. ¿Qué ejemplo impide un estado inválido?
2. ¿Cuál usa un record porque una clase sería excesiva?
3. ¿Qué diferencia hay entre colección no modificable y referencia final?
4. ¿Dónde puede fallar E8 y quién debe decidir cómo mostrarlo?


