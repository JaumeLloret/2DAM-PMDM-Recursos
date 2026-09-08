# Contenidos PM2 · Dart moderno con propósito

Este texto es suficiente para realizar los ejemplos, katas y laboratorio sin una explicación presencial completa. Los enlaces oficiales y la fecha de contraste están en [09_REFERENCIAS_Y_ACTUALIZACION_PM2.md](09_REFERENCIAS_Y_ACTUALIZACION_PM2.md).

## 1. Modelo mental: tipos antes que recetas

Dart usa tipado estático: cada expresión tiene un tipo que las herramientas pueden razonar antes de ejecutar. La inferencia evita repetir el tipo cuando el valor inicial ya lo deja claro.

```dart
var title = 'Revisar starter';       // String
final attempts = <int>[1, 2];        // List<int>
Object visible = title;               // acepta cualquier objeto no nulo
Object? maybeVisible;                 // acepta objeto o null
```

Un programa Dart puede ejecutarse con compilación JIT durante desarrollo y compilarse AOT para distribución. Para PM2 importa la consecuencia práctica: analyzer y compilador detectan muchos contratos rotos antes de que el flujo llegue al usuario.

### `Object`, `Object?`, `dynamic`, `Never` y `void`

| Tipo | Lectura útil en PM2 |
|---|---|
| `Object` | algún valor no nulo; solo permite operaciones comunes a todos los objetos |
| `Object?` | algún valor, incluido `null`; obliga a comprobar antes de usar |
| `dynamic` | desactiva gran parte de la comprobación estática en esa expresión; desplaza fallos a runtime |
| `Never` | una expresión que no termina normalmente, por ejemplo una función que siempre lanza |
| `void` | el llamador no usa un valor de retorno |

```dart
Never invalid(String message) => throw ArgumentError(message);

void show(Object? value) {
  if (value is String) {
    print(value.toUpperCase()); // promoción a String
  }
}
```

`dynamic` tiene usos de frontera en código legado o datos no tipados, pero no es una salida rápida:

```dart
dynamic weak = {'points': 'five'};
// Compila la llamada; puede fallar en ejecución.
print(weak['points'].isEven);
```

Con tipo explícito el error aparece cerca del origen:

```dart
final Map<String, int> points = {'team': 5};
print(points['team']?.isEven); // bool?
```

### Analyzer, compilación y runtime

- El analyzer avisa de tipos incompatibles, código muerto y reglas de lint.
- Un error de compilación impide producir el programa.
- Un error de runtime aparece al recorrer una rama válida en tipos pero inválida por datos o estado, como un `ArgumentError`.

El objetivo no es «cero excepciones», sino colocar el fallo en la frontera que puede explicarlo mejor.

## 2. Variables, referencias e inmutabilidad

### `var` o tipo explícito

Usa `var` cuando la derecha revela el tipo:

```dart
var owner = 'Ada';
final cards = <String>['A-01', 'A-02'];
```

Usa tipo explícito cuando comunica una abstracción o evita una inferencia demasiado concreta:

```dart
Iterable<String> visibleCards = cards.where((id) => id.startsWith('A'));
num estimate = 3;
```

### `final` no vuelve inmutable al objeto

```dart
final labels = <String>['dart'];
labels.add('modelado'); // permitido
// labels = [];         // no permitido: la referencia es final
```

Una referencia `final` se asigna una vez. La lista sigue siendo mutable. Para no exponerla:

```dart
class Column {
  final List<String> _cardIds;

  Column(Iterable<String> ids) : _cardIds = List.unmodifiable(ids);

  List<String> get cardIds => _cardIds;
}
```

`List.unmodifiable` hace una copia/vista no modificable del contenido recibido. Si quieres una nueva versión:

```dart
Column addCard(Column current, String id) =>
    Column([...current.cardIds, id]);
```

### `const`

`const` crea un valor conocido en tiempo de compilación:

```dart
const timeout = Duration(seconds: 2);
const allowed = {'todo', 'doing', 'done'};
```

No uses `const` como decoración. Si el valor llega al ejecutar, usa `final`:

```dart
final startedAt = DateTime.now();
```

Preferir inmutabilidad reduce estados intermedios, alias inesperados y necesidad de defensas; una colección mutable encapsulada puede ser correcta si el comportamiento necesita cambiarla.

## 3. Null safety: representar ausencia

`String` excluye `null`; `String?` lo admite.

```dart
String owner = 'Lin';
String? reviewer;
```

### Promoción

```dart
String label(String? owner) {
  if (owner == null) return 'Sin responsable';
  return owner.toUpperCase(); // promovido a String
}
```

### Operadores esenciales

```dart
final display = reviewer?.trim().toUpperCase() ?? 'SIN REVISOR';
reviewer ??= 'Pendiente';
```

- `?.` llama solo si no es nulo.
- `??` aporta alternativa si la izquierda es nula.
- `??=` asigna solo si aún es nulo.

### El peligro de `!`

```dart
String shout(String? text) => text!.toUpperCase();
```

`!` no valida: promete al compilador que tú garantizas un valor. Si la promesa es falsa, falla en runtime. Sustituye la promesa por un contrato:

```dart
String shout(String? text) {
  final normalized = text?.trim();
  if (normalized == null || normalized.isEmpty) {
    throw ArgumentError.value(text, 'text', 'Debe contener texto');
  }
  return normalized.toUpperCase();
}
```

### `late`

`late` aplaza la inicialización y traslada parte de la responsabilidad a runtime:

```dart
late final String sessionId;
```

Úsalo solo si el ciclo de vida garantiza que se asignará antes de leer. En modelos pequeños, un constructor completo suele ser más seguro.

### Parámetros opcionales

```dart
String cardLabel({
  required String title,
  String? owner,
  String prefix = 'CARD',
}) => '$prefix · $title · ${owner ?? 'sin responsable'}';
```

Un parámetro nombrado opcional es anulable o tiene valor por defecto. `required` obliga al llamador sin convertirlo en posicional.

## 4. Funciones que expresan intención

```dart
int remaining({required int capacity, required int used}) =>
    capacity - used;
```

Usa `=>` cuando la función es una expresión clara. Si necesita validación o varios pasos, usa bloque.

### Posicionales y nombrados

```dart
String truncate(String text, [int max = 20]) =>
    text.length <= max ? text : '${text.substring(0, max)}…';

bool canMove({
  required int currentSize,
  required int capacity,
  bool urgent = false,
}) {
  return currentSize < capacity || urgent;
}
```

Los posicionales convienen para argumentos obvios y breves. Los nombrados evitan llamadas opacas como `move(3, 4, true)`.

### Funciones como valores y closures

```dart
typedef CardRule = bool Function(String title);

List<String> accepted(
  Iterable<String> titles, {
  required CardRule rule,
}) => titles.where(rule).toList(growable: false);

final minLength = 4;
final result = accepted(
  ['UI', 'Dart', 'Modelado'],
  rule: (title) => title.length >= minLength,
);
```

La función anónima captura `minLength`: es una closure. No extraigas una función si el nuevo nombre no aclara intención o si obliga a saltar de archivo sin beneficio.

## 5. Colecciones tipadas y legibles

### `List`, `Set`, `Map`

```dart
final ordered = <String>['todo', 'doing', 'done'];
final uniqueTags = <String>{'dart', 'domain'};
final capacityByColumn = <String, int>{
  'todo': 5,
  'doing': 2,
};
```

- `List`: orden y posibles duplicados.
- `Set`: pertenencia/elementos únicos.
- `Map`: clave → valor.

### Iterar o transformar

```dart
final longTitles = titles
    .where((title) => title.length >= 5)
    .map((title) => title.toUpperCase())
    .toList(growable: false);
```

Una cadena corta y nombrable es legible. Si encadenas cinco operaciones y cuesta depurar, divide:

```dart
final visible = titles.where((title) => title.isNotEmpty);
final normalized = visible.map((title) => title.trim());
final result = normalized.toList(growable: false);
```

`fold` acumula, pero un bucle puede ser más claro:

```dart
var total = 0;
for (final estimate in estimates) {
  total += estimate;
}
```

### Spreads y collection-if/for

```dart
final base = <String>['todo'];
final includeReview = true;
final flow = <String>[
  ...base,
  if (includeReview) 'review',
  for (final n in [1, 2]) 'done-$n',
];
```

Úsalos si la construcción se lee mejor que varios `add`.

### Identidad e igualdad

Dos objetos creados por separado suelen no ser iguales si la clase no redefine `==`:

```dart
class MemberRef {
  final String id;
  const MemberRef(this.id);
}

final a = MemberRef('m1');
final b = MemberRef('m1');
print(a == b); // false con la implementación mínima
```

En PM2 basta razonar la decisión. Si el dominio exige igualdad por valor, se puede implementar conscientemente o dejarlo como ampliación; no añadir boilerplate sin necesidad observable.

## 6. Records, patterns y switch expressions con moderación

### Record para retorno pequeño

```dart
({bool ok, String message}) validateTitle(String raw) {
  final title = raw.trim();
  if (title.length < 3) {
    return (ok: false, message: 'Mínimo 3 caracteres');
  }
  return (ok: true, message: title);
}

final (:ok, :message) = validateTitle(' Dart ');
```

Un record es agregado anónimo, inmutable y tipado. Es adecuado para dos o tres valores locales que viajan juntos. Si el concepto tiene identidad, invariantes o comportamiento estable, crea una clase.

### Switch expression

```dart
enum Priority { low, normal, high, urgent }

int limitFor(Priority priority) => switch (priority) {
  Priority.low => 10,
  Priority.normal => 8,
  Priority.high => 5,
  Priority.urgent => 1,
};
```

Un `switch` exhaustivo sobre enum evita strings libres y obliga a decidir cada caso. No conviertas una condición simple en pattern matching ornamental.

### Patterns

```dart
final result = (ok: true, message: 'movida');
final (:ok, :message) = result;
print('$ok · $message');
```

El pattern describe la forma y extrae valores. PM2 usa destructuring de records y casos simples; sealed classes y patrones avanzados quedan en ampliación.

## 7. Clases necesarias: el centro de RA2.a

### Responsabilidad y cohesión

Una clase agrupa datos y comportamiento que cambian por la misma razón:

```dart
class TaskCard {
  final String id;
  final String title;
  final Priority priority;
  final String? assigneeId;

  TaskCard({
    required this.id,
    required String title,
    this.priority = Priority.normal,
    this.assigneeId,
  }) : title = _validTitle(title);

  static String _validTitle(String raw) {
    final value = raw.trim();
    if (value.length < 3) {
      throw ArgumentError.value(raw, 'title', 'Mínimo 3 caracteres');
    }
    return value;
  }

  bool get isAssigned => assigneeId != null;
}
```

La clase existe porque una tarjeta tiene un nombre estable y protege la regla del título. El getter deriva estado; no duplica un boolean mutable.

### Constructores y fronteras

- Constructor generativo: crea y valida una instancia.
- Constructor nombrado: expresa una variante real de creación.
- `factory`: devuelve una instancia con lógica que no se resuelve con una lista de inicializadores.

```dart
class Estimate {
  final int minutes;

  Estimate(this.minutes) {
    if (minutes <= 0) {
      throw ArgumentError.value(minutes, 'minutes', 'Debe ser positivo');
    }
  }

  Estimate.hour() : this(60);
}
```

No añadas `factory` solo porque existe en Dart.

### Invariantes

Una invariante es una condición que todo objeto válido debe cumplir siempre. Si una columna tiene capacidad:

```dart
class BoardColumn {
  final int capacity;
  final List<TaskCard> _cards;

  BoardColumn({required this.capacity, Iterable<TaskCard> cards = const []})
      : _cards = List.of(cards) {
    if (capacity <= 0) throw ArgumentError('Capacidad positiva requerida');
    if (_cards.length > capacity) throw StateError('Capacidad superada');
  }

  List<TaskCard> get cards => List.unmodifiable(_cards);

  void add(TaskCard card) {
    if (_cards.length >= capacity) throw StateError('Columna llena');
    _cards.add(card);
  }
}
```

Validar solo en el constructor no basta si una operación pública puede romper la regla después.

### Método o función externa

Coloca un método en la clase cuando necesita su estado y protege su responsabilidad. Usa función externa para una transformación que no pertenece claramente a un objeto o combina varias abstracciones sin convertir una clase en «Dios».

### Composición frente a herencia

Una tarjeta urgente no necesita ser subclase de tarjeta si solo cambia prioridad:

```dart
class TaskCard {
  final Priority priority; // composición de un valor
  // ...
}
```

Herencia es apropiada cuando existe una relación «es-un» estable y el subtipo respeta el contrato del padre. Reutilizar dos métodos no basta.

### Identidad frente a valor

- `TaskCard` suele tener identidad (`id`) y cambia de columna sin convertirse en otra tarjeta.
- `Priority` es un conjunto cerrado de valores.
- Un pequeño resultado `(ok, message)` no necesita identidad: un record basta.

### Nombres que explican

Evita `BoardManager`, `CardHelper`, `Utils`. Pregunta qué acción concreta coordina. `Board.moveCard` o una función `moveCard` suelen ser más claros.

## 8. Asincronía básica sin red

Un `Future<T>` representa un resultado `T` que llegará o un error que se completará más tarde.

```dart
Future<String> createLocalSnapshot(String boardId) async {
  await Future<void>.delayed(const Duration(milliseconds: 50));
  if (boardId.trim().isEmpty) {
    throw ArgumentError('boardId vacío');
  }
  return 'snapshot:$boardId';
}
```

Consumirlo:

```dart
Future<void> main() async {
  try {
    final snapshot = await createLocalSnapshot('board-1');
    print(snapshot);
  } on ArgumentError catch (error) {
    print('No se pudo crear: $error');
  }
}
```

### Secuencia no es concurrencia

```dart
final first = await createLocalSnapshot('a');
final second = await createLocalSnapshot('b');
```

La segunda operación empieza después de la primera. PM2 solo necesita reconocerlo. Optimización concurrente, isolates y Streams no son núcleo.

### Errores

- lanza un error cerca de la regla que falla;
- captura donde puedas añadir contexto o decidir recuperación;
- no uses `catch (_) {}` vacío;
- no conviertas toda excepción en `false` si se pierde la causa.

## 9. Del map a las clases

Punto de partida:

```dart
final cards = <Map<String, dynamic>>[
  {'id': 'C1', 'title': 'Dart', 'priority': 'HIGH', 'owner': null},
];
```

Preguntas de refactor:

1. ¿Qué claves son obligatorias?
2. ¿Qué valores posibles están cerrados?
3. ¿Qué ausencia es legítima?
4. ¿Qué estado nunca debe existir?
5. ¿Qué operación modifica el conjunto?
6. ¿Qué clase protege cada regla?

Posible resultado:

- `TaskCard`: identidad, título válido, prioridad y responsable opcional.
- `Priority`: valores cerrados y quizá una regla pequeña.
- `BoardColumn`: capacidad y pertenencia de tarjetas.
- `Board`: mover conservando unicidad y capacidad.

No es la única solución. Una clase que no protege una regla, no nombra un concepto útil y no concentra comportamiento puede sobrar.

## 10. Checklist de lectura de un diseño

- ¿Puedo construir un objeto inválido?
- ¿Puedo romperlo desde una lista expuesta?
- ¿El nulo significa ausencia real?
- ¿Hay strings libres con vocabulario cerrado?
- ¿Cada clase tiene una razón de cambio?
- ¿La composición expresa la relación real?
- ¿Un record local evita una clase sin identidad?
- ¿El `Future` se espera y el error se observa?
- ¿La salida es reproducible?
- ¿Puedo explicar qué clase eliminaría?


