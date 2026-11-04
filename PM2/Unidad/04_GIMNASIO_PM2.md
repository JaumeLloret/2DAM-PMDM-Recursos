# PM2 · Entrenamiento: 12 katas graduadas

Las katas forman parte de los pasos 2, 3, 5 y 6 de la Ruta. No son doce entregas independientes.

## Preparar el espacio de trabajo

Utiliza tu copia `dart_moderno_examples_trabajo`. Para cada kata puedes crear un fichero `bin/k1.dart`, `bin/k2.dart`, etc. Ejecuta el que estés trabajando:

```bash
dart run bin/k1.dart
```

Al terminar un bloque, ejecuta también:

```bash
dart format .
dart analyze
```

En el cuaderno registra: predicción, cambio mínimo, comando, salida real y explicación.

**Bloque A · tipos y null safety**

## K1 · El `!` que oculta una ausencia

**Lee:**

```dart
String initials(String? name) => name!.trim()[0].toUpperCase();
```

**Predice:** ¿qué ocurre con `null`, `''`, `'   '` y `'  Ada'`?

**Modifica:** `null`, vacío o espacios deben devolver `?`; otro valor devuelve la primera letra.

**Verifica:**

```text
initials(null) -> ?
initials('   ') -> ?
initials('  Ada') -> A
```

**Explica:** qué comprobación permite dejar de usar `!`.

## K2 · `dynamic` desplaza el error

**Lee:**

```dart
dynamic remaining(dynamic capacity, dynamic used) => capacity - used;
```

**Predice:** qué ocurre con `remaining(5, '2')`.

**Modifica:** usa parámetros nombrados de tipo `int`; solo acepta valores no negativos y `used <= capacity`. Un contrato inválido lanza `ArgumentError`.

**Verifica:**

```text
remaining(capacity: 5, used: 2) -> 3
remaining(capacity: 2, used: 3) -> ArgumentError
```

**Compara:** error cerca del origen frente a error desplazado a ejecución.

**Bloque B · funciones y colecciones**

## K3 · Una llamada que se entiende

**Lee:**

```dart
bool canEnter(int current, int limit, bool urgent) =>
    current < limit || urgent;
```

**Predice:** qué significa `canEnter(4, 4, true)` sin mirar la firma.

**Modifica:** usa parámetros nombrados y `urgent = false`.

**Verifica:** escribe dos llamadas que se entiendan por sí mismas.

**Explica:** por qué nombrar argumentos reduce errores de orden.

## K4 · Limpiar y conservar el primer orden

**Entrada:**

```dart
[' dart ', '', 'Flutter', 'dart']
```

**Predice:** valores tras `trim`, vacíos descartados y duplicados.

**Modifica:** devuelve títulos limpios, no vacíos y únicos sin perder la primera aparición.

**Verifica:**

```text
[dart, Flutter]
```

**Compara:** una solución con lista+set y otra con búsqueda en lista. Justifica legibilidad, no solo longitud.

## K5 · Dos valores sin crear una clase

**Modifica:** crea `validateTitle(String raw)` con retorno `({bool ok, String message})`.

**Verifica:**

```text
validateTitle(' a ') -> (ok: false, message: Mínimo 3 caracteres)
validateTitle(' Dart ') -> (ok: true, message: Dart)
```

**Explica:** por qué el resultado es local y no necesita identidad ni invariantes propias.

## K6 · Vocabulario cerrado

**Lee:** un diseño que recibe `'LOW'`, `'NORMAL'` o `'HIGH'` como string.

**Predice:** qué ocurre con `'HGIH'`.

**Modifica:** crea `enum Priority` y una expresión `switch` que devuelva 10, 8 y 4.

**Diagnostica:** añade un valor al enum y observa el error del switch no exhaustivo.

**Verifica:** revierte o completa el caso antes de continuar.

**Bloque C · clases, reglas y composición**

## K7 · Una clase que impide minutos inválidos

**Problema:** una estimación debe tener minutos positivos.

**Diseña:** clase `Estimate`, constructor e invariante. `hours` es un getter calculado, no un segundo campo mutable.

**Verifica:**

```text
Estimate(90).hours -> 1.5
Estimate(0) -> ArgumentError
```

**Explica:** dónde queda protegida la regla.

## K8 · Enum o texto libre

Compara:

- estado de tarjeta: `todo`, `doing`, `done`;
- etiqueta escrita por una persona.

**Predice:** cuál tiene vocabulario cerrado.

**Modifica:** implementa el estado como enum y valida la etiqueta como texto.

**Verifica:** no se puede construir un estado con una falta de ortografía.

## K9 · Composición antes que herencia

**Lee:**

```dart
class UrgentCard extends Card {}
class AssignedCard extends Card {}
```

**Diagnostica:** ¿una tarjeta deja de ser `Card` cuando cambia la prioridad o el responsable?

**Modifica:** usa `Priority` y `String? assigneeId` —o un pequeño `MemberRef` si puedes justificarlo— dentro de `Card`.

**Verifica:** una misma tarjeta puede cambiar de prioridad sin cambiar de tipo.

**Explica:** por qué no existe una relación «es-un» estable.

**Bloque D · asincronía**

## K10 · Esperar y conservar el error

**Lee:**

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

**Predice:** tipo de `label` y primer error del analyzer.

**Modifica:** corrige la firma de `main`, usa `await` y muestra un mensaje comprensible. No uses `catch` vacío.

**Verifica:** la salida contiene el motivo `fuente local no disponible` y no contiene `Instance of 'Future<String>'`.

**Explica:** qué espera `await` y dónde decides cómo mostrar el error.

**Bloque E · decisiones de modelado**

## K11 · Del map a un modelo

**Lee:**

```dart
final cards = [
  {'id': 'C1', 'title': 'Dart', 'priority': 'HIGH', 'owner': null},
];
```

**Antes de programar**, responde:

1. datos obligatorios;
2. ausencia legítima;
3. vocabulario cerrado;
4. estados inválidos.

**Modifica:** crea únicamente las clases/enum necesarios para título mínimo 3, prioridad cerrada, responsable opcional y acceso tipado.

**Verifica:** título vacío falla cerca del constructor y una prioridad inexistente no puede representarse.

**Explica:** completa «esta clase existe porque…» para cada clase.

## K12 · La clase que decides no crear

Valora estas propuestas:

```text
CardTitleUtils
PriorityManager
BoardService
MoveResult
```

**Compara:** responsabilidad, regla y vida propia.

**Decide:** elimina o conserva cada propuesta. Al menos una no debe existir.

**Transfiere:** si éxito+mensaje solo viajan dentro de una operación, compara `MoveResult` con un record.

**Checkpoint:** puedes defender tanto una clase creada como una descartada.

## Auto-feedback

- Si el código cambia sintaxis pero mantiene estados inválidos, vuelve a K7/K11.
- Si todo se convierte en clase, vuelve a K5/K12.
- Si aparecen `dynamic` o `!`, documenta la frontera o retíralos.
- Si una cadena de operaciones no se puede narrar, divide los pasos.
- Si el `Future` se imprime, falta `await`.
- Si solo tienes salida pero no predicción ni explicación, la kata sigue ámbar.
