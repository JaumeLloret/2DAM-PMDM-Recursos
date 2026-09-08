# Gimnasio PM2 · 12 katas graduadas

Los katas están incluidos en las fases 2, 3, 5 y 6 de la ruta; no son doce entregas ni tiempo adicional. Registra predicción, cambio y salida en el cuaderno. El oráculo completo es docente.

## K1 · Corregir tipo y null safety

Código:

```dart
String initials(String? name) => name!.trim()[0].toUpperCase();
```

Requisito: `null`, vacío o espacios devuelven `?`; otro valor devuelve la primera letra.

Casos esperados: `initials(null) == '?'`, `initials('  Ada') == 'A'`.

## K2 · Retirar `dynamic` innecesario

```dart
dynamic remaining(dynamic capacity, dynamic used) => capacity - used;
```

Requisito: solo enteros no negativos y `used <= capacity`; contrato inválido lanza `ArgumentError`.

Esperado: `remaining(capacity: 5, used: 2) == 3`.

## K3 · Parámetros nombrados claros

Reescribe:

```dart
bool canEnter(int current, int limit, bool urgent) =>
    current < limit || urgent;
```

La llamada debe leerse sin recordar posiciones y `urgent` debe valer `false` por defecto.

## K4 · Transformar una colección

Entrada: `[' dart ', '', 'Flutter', 'dart']`.

Obtén títulos limpios, no vacíos y únicos sin perder el primer orden. Esperado: `['dart', 'Flutter']`. Explica por qué usas lista, set o ambos.

## K5 · Devolver dos valores con record

Diseña `validateTitle(String raw)` que devuelva `({bool ok, String message})`.

Esperado para `' a '`: `(ok: false, message: 'Mínimo 3 caracteres')`. Para `' Dart '`: `(ok: true, message: 'Dart')`.

Explica por qué aquí un record es suficiente.

## K6 · Simplificar decisión con switch expression

Parte de una cadena `LOW/NORMAL/HIGH`. Sustitúyela por `enum Priority` y una expresión `switch` que devuelva 10, 8 y 4. No añadas pattern matching más complejo.

## K7 · Clase con constructor e invariante

Crea `Estimate` con minutos positivos. `Estimate(0)` debe lanzar `ArgumentError`. Añade getter `hours` sin almacenar un segundo estado.

## K8 · Enum o string libre

Caso A: estado de tarjeta cerrado (`todo`, `doing`, `done`). Caso B: etiqueta escrita por usuario.

Elige enum o string para cada uno y justifica. Implementa únicamente A como enum; B se valida como texto.

## K9 · Composición antes que herencia

Código inicial:

```dart
class UrgentCard extends Card {}
class AssignedCard extends Card {}
```

Reformula usando `Priority` y `MemberRef?` dentro de `Card`. Si conservarías una herencia, demuestra la relación «es-un» y el contrato estable.

## K10 · Esperar y manejar un Future

Código:

```dart
Future<String> loadLabel() async {
  await Future<void>.delayed(const Duration(milliseconds: 10));
  throw StateError('fuente local no disponible');
}

void main() {
  final label = loadLabel();
  print(label.toUpperCase());
}
```

Corrige firma, `await` y error. Salida esperada: un mensaje comprensible, sin `Instance of 'Future<String>'` ni `catch` vacío.

## K11 · Del `Map<String, dynamic>` a clases

Entrada:

```dart
final cards = [
  {'id': 'C1', 'title': 'Dart', 'priority': 'HIGH', 'owner': null},
];
```

Genera solo las clases/enum necesarios para:

- título mínimo 3;
- prioridad cerrada;
- responsable legítimamente ausente;
- acceso tipado.

Escribe una frase por clase: «existe porque…».

## K12 · La clase que NO crearías

Propuesta: `CardTitleUtils`, `PriorityManager`, `BoardService`, `MoveResult`.

Con el alcance actual, elimina o conserva cada una. Debes argumentar responsabilidad, regla o vida propia. Se espera que al menos una no exista. Si éxito + mensaje solo viajan dentro de una operación, compara `MoveResult` con un record.

## Auto-feedback rápido

- Si el código solo cambia sintaxis pero mantiene estados inválidos: vuelve a K7/K11.
- Si todo se convierte en clase: vuelve a K5/K12.
- Si aparecen `dynamic` o `!`: exige una frontera y una justificación.
- Si una cadena funcional cuesta narrarla: divide pasos.
- Si el `Future` se imprime: falta `await`.


