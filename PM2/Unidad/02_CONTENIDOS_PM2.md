# PM2 · Dart para modelar un problema

## El problema que vamos a resolver

Un prototipo suele empezar con datos fáciles de escribir:

```dart
final card = <String, dynamic>{
  'id': 'C-1',
  'title': 'Dart',
  'priority': 'HIGH',
  'owner': null,
};
```

Funciona, pero no responde preguntas importantes:

- ¿puede faltar `title`?;
- ¿`priority` admite `HGIH` por error?;
- ¿qué tipo tiene `owner`?;
- ¿quién impide un título vacío?;
- ¿qué ocurre si otra parte modifica el map?

En PM2 aprenderás sintaxis Dart para resolver esas preguntas. La meta no es memorizar el lenguaje: es conseguir que el código haga visible el contrato del problema.

Trabaja con el paquete `dart_moderno_examples`. Antes de cada cambio, predice la salida; después ejecútalo y explica la diferencia.

## 1. Tipos: acercar el error a su causa

Dart usa tipado estático. Cada expresión tiene un tipo que el analyzer puede comprobar antes de ejecutar.

```dart
var title = 'Revisar starter'; // Dart infiere String
final attempts = <int>[1, 2];  // List<int>
```

`var` no significa «cualquier cosa». El tipo se infiere una vez:

```dart
var title = 'Dart';
// title = 3; // error: int no se puede asignar a String
```

### `Object`, `Object?` y `dynamic`

```dart
Object visible = 'texto';  // cualquier objeto no nulo
Object? maybeVisible;      // también admite null
dynamic unchecked = {'points': 'five'};
```

- `Object` conserva comprobación estática, pero solo permite operaciones comunes.
- `Object?` obliga a tratar la posible ausencia.
- `dynamic` desactiva comprobaciones en esa expresión y puede desplazar el fallo a ejecución.

Ejemplo débil:

```dart
dynamic points = 'five';
print(points.isEven);
```

Puede compilar la llamada y fallar al ejecutarse. Con un tipo real, el error aparece donde nace:

```dart
final int points = 5;
print(points.isEven);
```

Salida:

```text
false
```

### `void` y `Never`

`void` indica que el llamador no usa un resultado. `Never` describe una función que no termina normalmente:

```dart
Never invalid(String message) => throw ArgumentError(message);

void show(Object? value) {
  if (value is String) {
    print(value.toUpperCase());
  }
}
```

La comprobación `value is String` permite que Dart lo trate como `String` dentro del bloque.

### Acción

1. Predice el resultado de `show('dart')` y `show(null)`.
2. Ejecuta ambos casos.
3. Cambia el parámetro a `dynamic` y explica qué protección has perdido.

### Checkpoint

Puedes explicar por qué sustituir un error por `dynamic` no lo resuelve: solo lo retrasa.

### Error frecuente

**Síntoma:** el analyzer marca una incompatibilidad y cambias el tipo a `dynamic`.  
**Comprueba:** cuál es el tipo real de entrada y qué operaciones necesitas.  
**Actúa:** corrige el contrato o valida en la frontera; no apagues el analyzer.

## 2. `final`, `const` y mutabilidad

`final` fija una referencia después de asignarla, pero el objeto apuntado puede seguir siendo mutable:

```dart
final labels = <String>['dart'];
labels.add('modelado');
print(labels);
```

Salida:

```text
[dart, modelado]
```

Esta línea no compilaría:

```dart
// labels = <String>[];
```

### Colección no modificable

```dart
final safeLabels = List.unmodifiable(labels);
```

Intentar `safeLabels.add('otro')` produce un error en ejecución. Si una clase no debe exponer su lista interna:

```dart
class Column {
  Column(Iterable<String> ids) : _cardIds = List.of(ids);

  final List<String> _cardIds;

  List<String> get cardIds => List.unmodifiable(_cardIds);
}
```

### `const`

`const` crea un valor conocido en compilación:

```dart
const timeout = Duration(seconds: 2);
const allowedStates = {'todo', 'doing', 'done'};
```

Un valor calculado al ejecutar usa `final`:

```dart
final startedAt = DateTime.now();
```

### Acción

1. Ejecuta una lista `final` y añade un elemento.
2. Crea una vista `List.unmodifiable`.
3. Predice el error de `add` sobre esa vista antes de provocarlo en una copia de prueba.

### Checkpoint

Distingues estas dos afirmaciones:

- «no puedo reasignar la variable»;
- «nadie puede modificar el objeto».

### Error frecuente

**Síntoma:** una regla se rompe desde fuera mediante un getter.  
**Comprueba:** si el getter devuelve la lista interna.  
**Actúa:** devuelve una vista/copia no modificable o una nueva versión del objeto.

## 3. Null safety: representar una ausencia legítima

`String` no admite `null`; `String?` sí:

```dart
String owner = 'Ada';
String? reviewer;
```

La pregunta de diseño es: ¿la ausencia tiene sentido en el dominio? Una tarjeta puede estar sin responsable; su `id` no debería faltar.

### Promoción

```dart
String ownerLabel(String? owner) {
  final normalized = owner?.trim();
  if (normalized == null || normalized.isEmpty) {
    return 'SIN RESPONSABLE';
  }
  return normalized.toUpperCase();
}
```

Después de la comprobación, Dart sabe que `normalized` es `String`.

### Operadores útiles

```dart
final display = reviewer?.trim().toUpperCase() ?? 'SIN REVISOR';
reviewer ??= 'Pendiente';
```

- `?.` llama solo si el valor no es nulo.
- `??` aporta una alternativa.
- `??=` asigna solo cuando todavía es nulo.

### Por qué `!` no valida

```dart
String shout(String? text) => text!.toUpperCase();
```

`!` promete al compilador que el valor no será nulo. Si la promesa es falsa, el programa falla. Es más seguro validar:

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

`late` aplaza la inicialización y mueve parte del riesgo a ejecución:

```dart
late final String sessionId;
```

Úsalo solo si el ciclo de vida garantiza la asignación antes de leer. En los modelos pequeños de PM2 suele ser mejor un constructor completo.

### Acción

Trabaja K1. Prueba `null`, una cadena de espacios y `'  Ada'`.

Salida esperada:

```text
?
?
A
```

### Checkpoint

Puedes señalar qué campos de una tarjeta admiten ausencia y cuáles deben validarse al construir.

### Error frecuente

**Síntoma:** `Null check operator used on a null value`.  
**Comprueba:** dónde aparece `!` y qué entrada real llegó.  
**Actúa:** promoción, validación o alternativa explícita; no añadas otro `!`.

## 4. Funciones que expresan intención

Una función breve puede usar `=>`:

```dart
int remaining({required int capacity, required int used}) =>
    capacity - used;
```

Los parámetros nombrados hacen legible la llamada:

```dart
remaining(capacity: 5, used: 2);
```

Para valores opcionales, usa nulabilidad o valor por defecto:

```dart
bool canMove({
  required int currentSize,
  required int capacity,
  bool urgent = false,
}) {
  return currentSize < capacity || urgent;
}
```

### Funciones como valores

```dart
typedef CardRule = bool Function(String title);

List<String> accepted(
  Iterable<String> titles, {
  required CardRule rule,
}) => titles.where(rule).toList(growable: false);
```

Uso:

```dart
final minLength = 4;
final result = accepted(
  ['UI', 'Dart', 'Modelado'],
  rule: (title) => title.length >= minLength,
);
print(result);
```

Salida:

```text
[Dart, Modelado]
```

La función anónima captura `minLength`: es una closure.

### Acción

Trabaja K3. Compara `canEnter(3, 4, true)` con una llamada que nombre sus argumentos.

### Checkpoint

Otra persona puede leer la llamada sin memorizar el orden de tres valores.

### Error frecuente

**Síntoma:** una llamada como `move(3, 4, true)` no se entiende.  
**Comprueba:** si los argumentos representan reglas distintas.  
**Actúa:** usa parámetros nombrados; no añadas comentarios a cada llamada.

## 5. Colecciones: elegir por la regla

```dart
final ordered = <String>['todo', 'doing', 'done'];
final uniqueTags = <String>{'dart', 'domain'};
final capacityByColumn = <String, int>{
  'todo': 5,
  'doing': 2,
};
```

- `List`: orden y posibles duplicados.
- `Set`: pertenencia sin duplicados.
- `Map`: asociación clave → valor.

### Transformaciones legibles

```dart
final result = titles
    .map((title) => title.trim())
    .where((title) => title.length >= 4)
    .map((title) => title.toUpperCase())
    .toList(growable: false);
```

Si una cadena cuesta narrarla, divide los pasos:

```dart
final visible = titles.where((title) => title.trim().isNotEmpty);
final normalized = visible.map((title) => title.trim());
final result = normalized.toList(growable: false);
```

Un bucle también puede ser la opción más clara. No se premia usar más métodos.

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

### Acción

Trabaja K4 con `[' dart ', '', 'Flutter', 'dart']`. Conserva el primer orden y elimina vacíos y duplicados.

Salida esperada:

```text
[dart, Flutter]
```

### Checkpoint

Puedes explicar por qué utilizaste lista, set o ambos.

### Error frecuente

**Síntoma:** una cadena de transformaciones funciona pero no sabes localizar un fallo.  
**Comprueba:** si puedes nombrar cada estado intermedio.  
**Actúa:** divide la cadena o usa un bucle claro.

## 6. Record, enum y switch: herramientas pequeñas

### Record para un resultado local

```dart
({bool ok, String message}) validateTitle(String raw) {
  final title = raw.trim();
  if (title.length < 3) {
    return (ok: false, message: 'Mínimo 3 caracteres');
  }
  return (ok: true, message: title);
}
```

Uso con destructuring:

```dart
final (:ok, :message) = validateTitle(' Dart ');
print('$ok · $message');
```

Salida:

```text
true · Dart
```

Un record encaja cuando pocos valores viajan juntos, son locales y no tienen identidad ni reglas propias.

### Enum para un vocabulario cerrado

```dart
enum Priority { low, normal, high, urgent }

int limitFor(Priority priority) => switch (priority) {
  Priority.low => 10,
  Priority.normal => 8,
  Priority.high => 4,
  Priority.urgent => 1,
};
```

El `switch` es exhaustivo: si añades un valor al enum, el analyzer te obliga a decidir su comportamiento.

### Acción

Trabaja K5 y K6. Después responde:

- ¿por qué `Priority` no es un string escrito por el usuario?;
- ¿por qué `(ok, message)` no necesita todavía una clase?

### Checkpoint

No eliges una construcción porque «es moderna», sino porque hace visible una regla.

### Error frecuente

**Síntoma:** todo se convierte en clase o todo se convierte en record.  
**Comprueba:** identidad, invariantes, comportamiento y vida propia.  
**Actúa:** conserva la opción más pequeña que exprese el contrato.

## 7. Clases necesarias e invariantes

Una clase agrupa estado y comportamiento que pertenecen al mismo concepto:

```dart
class TaskCard {
  TaskCard({
    required this.id,
    required String title,
    this.priority = Priority.normal,
    this.assigneeId,
  }) : title = _validTitle(title);

  final String id;
  final String title;
  final Priority priority;
  final String? assigneeId;

  bool get isAssigned => assigneeId != null;

  static String _validTitle(String raw) {
    final value = raw.trim();
    if (value.length < 3) {
      throw ArgumentError.value(raw, 'title', 'Mínimo 3 caracteres');
    }
    return value;
  }
}
```

La clase existe porque una tarjeta tiene identidad y protege la regla del título. `isAssigned` es calculado; no duplica estado.

### Invariante

Una invariante debe cumplirse para todo objeto válido, no solo al construirlo:

```dart
class BoardColumn {
  BoardColumn({required this.capacity, Iterable<TaskCard> cards = const []})
      : _cards = List.of(cards) {
    if (capacity <= 0) {
      throw ArgumentError.value(capacity, 'capacity', 'Debe ser positiva');
    }
    if (_cards.length > capacity) {
      throw StateError('Capacidad superada');
    }
  }

  final int capacity;
  final List<TaskCard> _cards;

  List<TaskCard> get cards => List.unmodifiable(_cards);

  void add(TaskCard card) {
    if (_cards.length >= capacity) {
      throw StateError('Columna llena');
    }
    _cards.add(card);
  }
}
```

Validar solo en el constructor no basta: `add` también puede romper la capacidad.

### Constructor nombrado y `factory`

Un constructor nombrado expresa una creación real:

```dart
class Estimate {
  Estimate(this.minutes) {
    if (minutes <= 0) throw ArgumentError('Minutos positivos');
  }

  Estimate.hour() : this(60);

  final int minutes;
}
```

Usa `factory` solo si la creación necesita devolver otra instancia, cachear o decidir una implementación. No lo añadas como decoración.

### Composición antes que herencia

Una tarjeta urgente no necesita un subtipo `UrgentCard` si solo cambia su prioridad:

```dart
class TaskCard {
  final Priority priority;
  // resto del modelo
}
```

Herencia requiere una relación «es-un» estable y un subtipo que respete el contrato del padre. Reutilizar dos líneas no basta.

### Acción

Trabaja K7–K9 y K11. Para cada clase completa la frase:

> Esta clase existe porque protege… / coordina… / representa…

Después trabaja K12 y elimina al menos una clase decorativa.

### Checkpoint

Puedes señalar:

1. una regla protegida en constructor;
2. una regla protegida al modificar;
3. una colección no expuesta;
4. una relación resuelta por composición;
5. una clase que decidiste no crear.

### Error frecuente

**Síntoma:** aparecen `Manager`, `Utils` o clases sin comportamiento.  
**Comprueba:** qué regla o responsabilidad tendría cada una.  
**Actúa:** mueve el comportamiento al concepto que posee los datos o usa una función con nombre concreto.

## 8. `Future`, `async` y errores locales

Un `Future<T>` representa un resultado `T` que llegará más tarde o una finalización con error.

```dart
Future<String> createLocalSnapshot(String boardId) async {
  await Future<void>.delayed(const Duration(milliseconds: 10));
  if (boardId.trim().isEmpty) {
    throw ArgumentError('boardId vacío');
  }
  return 'snapshot:$boardId';
}
```

Para obtener el resultado:

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

Salida normal:

```text
snapshot:board-1
```

Si llamas con una cadena vacía, obtendrás un mensaje de error con contexto.

### Secuencia no es concurrencia

```dart
final first = await createLocalSnapshot('a');
final second = await createLocalSnapshot('b');
```

La segunda operación empieza después de terminar la primera. PM2 no necesita optimizar esto ni introducir red, isolates o Streams.

### Acción

Trabaja K10. Corrige firma, `await` y manejo de error. Ejecuta una ruta válida y otra inválida.

### Checkpoint

- No imprimes un `Future` sin esperar.
- No usas un `catch` vacío.
- La capa que captura puede añadir contexto útil.

### Error frecuente

**Síntoma:** aparece `Instance of 'Future<String>'`.  
**Comprueba:** si la función llamadora es `async`.  
**Actúa:** espera el resultado con `await` y decide dónde manejar el error.

## 9. Del map a un modelo defendible

Antes de crear clases, responde:

1. ¿Qué datos son obligatorios?
2. ¿Qué ausencias son legítimas?
3. ¿Qué vocabularios están cerrados?
4. ¿Qué estados serían inválidos?
5. ¿Quién modifica las colecciones?
6. ¿Qué operación necesita coordinar varias reglas?
7. ¿Qué clase no aporta nada y debería desaparecer?

Un posible modelo puede usar `TaskCard`, `BoardColumn`, `Priority` y `Board`, pero no es la única respuesta. Lo evaluable es que cada elemento tenga una responsabilidad, proteja reglas y permita un cambio pequeño sin romper el conjunto.

## Cierre rápido

Antes de pasar al laboratorio, explica sin mirar:

- diferencia entre `final` y colección inmutable;
- por qué `dynamic` y `!` necesitan una frontera justificada;
- cuándo elegir record y cuándo clase;
- qué es una invariante;
- por qué composición suele encajar mejor que una herencia oportunista;
- qué representa un `Future` y dónde se observa su error.

Si una respuesta no está clara, vuelve al checkpoint de esa sección y realiza la kata indicada.
