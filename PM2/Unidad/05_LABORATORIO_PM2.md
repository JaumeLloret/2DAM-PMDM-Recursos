# PM2 · Laboratorio AulaFlow Dart Domain Lab

## Qué vas a demostrar

Vas a transformar un programa que funciona con maps y strings en un modelo de clases pequeño y defendible. El objetivo no es reproducir una solución concreta: cada clase debe existir por una responsabilidad o una regla observable.

El caso es **pure Dart** y didáctico. No define el modelo final, la API ni la arquitectura de AulaFlow 2.0.

## Punto de partida

Duplica `Alumnado/Starter/aulaflow_dart_domain_lab/` y trabaja en la copia. Abre la carpeta que contiene `pubspec.yaml`.

Ejecuta:

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

El programa inicial es ejecutable, pero admite estados débiles: `Map<String, dynamic>`, prioridad como string, nulos ambiguos, reglas repartidas y colecciones expuestas.

## Ruta de 70 minutos

| Hito | Min | Acción | Checkpoint |
|---|---:|---|---|
| 1. Comprender | 10 | Ejecuta, predice la salida y localiza tres riesgos. | Tienes tres pares `riesgo → estado inválido posible`. |
| 2. Diseñar | 15 | Decide datos, reglas, responsabilidades y una clase que no crearás. | Boceto de clases/enum y primera versión de `DECISIONES.md`. |
| 3. Implementar | 30 | Refactoriza por capas pequeñas: tarjeta → columna → tablero. | Tras cada capa, `dart analyze` y el recorrido principal siguen funcionando. |
| 4. Asincronía | 5 | Conserva o reescribe el snapshot local y su fallo controlado. | Obtienes una salida válida y otra de error observable. |
| 5. Evidenciar | 10 | Formatea, ejecuta, revisa decisiones y completa evidencia. | Paquete limpio + `DECISIONES.md` + `EVIDENCIA.md`. |
| **Total** | **70** |  |  |

## Hito 1 · comprender antes de refactorizar

Lee `lib/weak_board.dart` sin editar y responde:

1. ¿qué claves son obligatorias?;
2. ¿qué strings representan vocabularios cerrados?;
3. ¿qué valor puede faltar legítimamente?;
4. ¿qué reglas solo existen dentro de una función?;
5. ¿qué colección puede modificar cualquier llamador?

Conserva la salida inicial en `EVIDENCIA.md`. Será tu baseline para comprobar que el refactor mantiene el comportamiento.

### Si te bloqueas

Empieza por `seedWeakBoard` y sigue una sola tarjeta hasta `moveWeakCard`. No intentes entender todo el fichero a la vez.

## Hito 2 · diseñar lo mínimo

Tu diseño debe poder representar:

- tarjeta con id y título válido;
- prioridad perteneciente a un conjunto cerrado;
- responsable legítimamente ausente;
- columna con capacidad positiva;
- tablero que impide ids duplicados y coordina movimientos.

Antes de programar, completa una tabla:

| Elemento propuesto | Responsabilidad o regla | ¿Por qué no basta un map/función? |
|---|---|---|
|  |  |  |

Añade también una propuesta descartada: una clase que no crearás porque no protege reglas ni tiene responsabilidad propia.

### Checkpoint

No existe un número mínimo de clases. Puedes explicar cada elemento en una frase y ninguna se llama `Manager`, `Utils` o `Helper` sin una responsabilidad concreta.

## Hito 3 · implementar por capas pequeñas

### 3.1 Tarjeta y prioridad

Protege:

1. id no vacío;
2. título de al menos 3 caracteres tras `trim`;
3. prioridad cerrada;
4. responsable opcional explícito.

Ejecuta `dart analyze` antes de continuar.

### 3.2 Columna

Protege:

1. capacidad positiva;
2. número de tarjetas no superior a capacidad;
3. colección interna no modificable desde fuera.

Comprueba un caso válido y un intento de superar capacidad.

### 3.3 Tablero y movimiento

El tablero debe:

- rechazar ids de tarjeta duplicados;
- localizar origen y destino;
- no perder la tarjeta si el destino está lleno o no existe;
- informar éxito y mensaje; un record es válido si ese resultado no necesita vida propia.

No cambies toda la estructura de una vez. Después de cada paso ejecuta:

```bash
dart analyze
dart run bin/main.dart
```

### Checkpoint

El recorrido muestra dos tarjetas antes, una en cada columna después y conserva la tarjeta si un movimiento falla.

## Hito 4 · asincronía local

Incluye una operación `Future` que genere una descripción reproducible del tablero. Debe existir:

- ruta normal;
- ruta de fallo local, controlada y realmente alcanzable;
- manejo del error sin `catch` vacío.

No introduzcas HTTP, archivos, base de datos ni persistencia.

### Checkpoint

Puedes ejecutar una llamada válida y otra inválida y explicar dónde se lanza y dónde se añade contexto.

## Hito 5 · comprobar y evidenciar

Ejecuta:

```bash
dart format --output=none --set-exit-if-changed .
dart analyze
dart run bin/main.dart
dart test
```

Si no has añadido tests, conserva el resultado del test del starter y explica qué comportamiento cubre; no afirmes que valida todo tu modelo.

Completa:

- `DECISIONES.md`: responsabilidad, regla, alternativa descartada y motivo;
- `EVIDENCIA.md`: versión, comandos, salidas y cualquier bloqueo real.

## Requisitos de aceptación

- tipos estáticos; `dynamic` solo en una frontera documentada;
- null safety sin `!` rutinario;
- enum para vocabulario cerrado;
- colecciones tipadas y mutabilidad controlada;
- constructores y operaciones que protegen invariantes;
- composición razonada;
- ninguna clase decorativa;
- operación `Future` local con fallo observable;
- salida reproducible y decisiones coherentes con el código.

## Salida orientativa, no plantilla obligatoria

```text
ANTES · todo=2 · doing=0
MOVE · true · C-1 movida a doing
DESPUÉS · todo=1 · doing=1
SNAPSHOT · board-demo|doing:C-1|todo:C-2
```

Tu salida puede variar si conserva el comportamiento y es verificable.

## Límites

No añadas widgets, navegación, estado de interfaz, arquitectura Flutter, HTTP, JSON de API, autenticación, persistencia, sensores, permisos, multimedia, CI como contenido, SDD/agentes ni contrato/AulaTokens.
