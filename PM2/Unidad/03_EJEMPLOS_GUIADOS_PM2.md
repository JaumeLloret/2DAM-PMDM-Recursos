# PM2 · Ejemplos guiados

Estos ejemplos convierten cada concepto de la teoría en una acción pequeña. No edites el original directamente: duplica `dart_moderno_examples` y llama a la copia `dart_moderno_examples_trabajo`.

## Preparar la copia

1. Abre VS Code o Android Studio.
2. Selecciona **Abrir carpeta / Open Folder**.
3. Elige `dart_moderno_examples_trabajo`, la carpeta que contiene `pubspec.yaml`.
4. Abre una terminal integrada en esa carpeta.
5. Ejecuta:

```bash
dart pub get
dart analyze
dart run bin/main.dart
dart test
```

Salida esencial:

```text
null-safety: SIN RESPONSABLE
colecciones: [DART, MODELADO]
record: true · Dart
switch: 1
clase: C-1 · Dart seguro · sin responsable
async: snapshot:board-demo:2
```

Debes obtener también cinco tests correctos. Los milisegundos no forman parte de la evidencia.

Si `dart run` busca otro fichero, utiliza siempre `dart run bin/main.dart`. Si los imports aparecen rotos, comprueba que has abierto la carpeta con `pubspec.yaml` y repite `dart pub get`.

## E1 · `final` no vuelve inmutable una lista

### Antes de ejecutar

Predice si `add` compila:

```dart
final tags = <String>['dart'];
tags.add('domain');
print(tags);
```

### Ejecuta

Puedes crear temporalmente `bin/e1.dart` y ejecutar:

```bash
dart run bin/e1.dart
```

Salida:

```text
[dart, domain]
```

### Modifica

Crea `final safeTags = List.unmodifiable(tags);` e intenta añadir otro valor.

### Checkpoint

Explica por qué una referencia `final` y una lista no modificable resuelven problemas distintos.

### Si falla antes de tiempo

Si no encuentra `bin/e1.dart`, confirma que el fichero está dentro de `bin/` y que la terminal está en la raíz del paquete.

## E2 · Promoción antes que `!`

Localiza `ownerLabel` en `lib/examples.dart`.

### Predice

¿Qué devuelve para `null`, `'   '` y `' ada '`?

### Modifica

Añade temporalmente tres llamadas en `bin/main.dart` y comprueba:

```text
SIN RESPONSABLE
SIN RESPONSABLE
ADA
```

### Variación

Haz que el resultado válido sea `RESPONSABLE: ADA`.

### Checkpoint

Señala la línea que permite la promoción de `String?` a `String`.

## E3 · Transformar sin ocultar los pasos

Localiza `normalizedTitles`.

### Predice

Para `[' Dart ', '', 'modelado', 'Dart']`, escribe primero:

1. valores tras `trim`;
2. valores que pasan el filtro;
3. resultado final y duplicados.

### Ejecuta

La salida final es:

```text
[DART, MODELADO]
```

### Modifica

Conserva mayúsculas/minúsculas originales, pero elimina duplicados ignorando el caso. Divide el problema en pasos si una cadena larga deja de ser legible.

### Checkpoint

Justifica qué colección conserva el primer orden y cuál detecta pertenencia.

## E4 · Record o clase

Localiza `validateTitle`.

### Predice

```dart
validateTitle(' a ')
validateTitle(' Dart ')
```

Resultados:

```text
(ok: false, message: Mínimo 3 caracteres)
(ok: true, message: Dart)
```

### Modifica

Añade un tercer dato local `normalizedLength`. Después responde: ¿sigue siendo un resultado pequeño sin vida propia o empieza a justificar una clase?

### Checkpoint

Tu decisión menciona identidad, reglas o comportamiento; no solo número de campos.

## E5 · Enum y switch exhaustivo

Localiza `Priority` y `priorityLimit`.

### Predice

¿Qué devuelve cada prioridad? Ejecuta y compara.

### Modifica

Añade temporalmente `blocked` al enum sin tocar el switch. Ejecuta `dart analyze`.

Debes ver un error que indica que el switch no cubre todos los casos.

### Repara

Añade el caso que falta o revierte el experimento.

### Checkpoint

Explica qué error podría admitir un string libre que el enum evita.

## E6 · Clase que protege una regla

Localiza `Card`.

### Predice

¿Qué ocurre con este caso?

```dart
Card(id: 'C-1', title: '  ');
```

### Ejecuta

Añádelo en un bloque `try` temporal o utiliza el test existente. Debe lanzar `ArgumentError`.

### Modifica

Protege también un `id` vacío. No añadas una clase nueva: la propia tarjeta conoce esa regla.

### Checkpoint

Puedes indicar qué estados inválidos son imposibles después del constructor.

## E7 · Copia defensiva

Crea esta clase en un fichero temporal:

```dart
class Column {
  Column(Iterable<String> ids) : _ids = List.of(ids);

  final List<String> _ids;

  List<String> get ids => List.unmodifiable(_ids);
}
```

### Predice y prueba

Intenta modificar la lista recibida por el getter.

### Compara

Compara con `List<String> get ids => _ids;` y explica qué regla podría romper un llamador externo.

### Checkpoint

La colección interna no puede cambiarse a través del getter.

## E8 · `Future` normal y fallo observable

Localiza `createLocalSnapshot`.

### Predice

1. salida con `boardId: 'board-demo'`;
2. tipo devuelto antes de usar `await`;
3. error con `boardId: ''`.

### Ejecuta

Prueba ruta válida e inválida. En la inválida, captura `ArgumentError` y añade contexto; no uses un `catch` vacío.

### Checkpoint

No aparece `Instance of 'Future<String>'` y puedes explicar qué espera exactamente `await`.

## Cierre de los ejemplos

Ejecuta de nuevo:

```bash
dart format .
dart analyze
dart run bin/main.dart
dart test
```

Conserva en el cuaderno:

- una predicción que no acertaste;
- la diferencia observada;
- una regla que ahora puedes explicar;
- un error que sabes diagnosticar.

