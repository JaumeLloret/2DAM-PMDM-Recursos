# Ampliación PM2 · rutas opcionales

Estas rutas no forman parte de los 480 min, no son requisito de PM3 y no generan ventaja obligatoria.

## A1 · `copyWith` manual

Crear una nueva `TaskCard` cambiando prioridad sin mutar la anterior. Analizar coste de boilerplate y campos anulables.

## A2 · Igualdad por valor

Decidir si `MemberRef('m1') == MemberRef('m1')` debe ser cierto. Implementar `==` y `hashCode` solo después de escribir la necesidad en colecciones.

## A3 · Genérico sencillo

Diseñar `Result<T>` mínimo para valor o mensaje de error. Compararlo con el record local del laboratorio. Evitar jerarquías complejas.

## A4 · Extension

Añadir una extensión pequeña sobre `Iterable<TaskCard>` para filtrar urgentes. Comparar con una función externa y conservar la opción más legible.

## A5 · Sealed + patterns

Modelar `SnapshotState` como familia cerrada y usar switch exhaustivo. Es ampliación porque añade jerarquía y patterns más avanzados.

## A6 · Stream conceptual

Simular tres actualizaciones locales con `Stream.periodic`. Explicar diferencia `Future` (un resultado) / `Stream` (secuencia), sin conectividad ni estado Flutter.

## A7 · Eficiencia razonada

Comparar búsqueda lineal en lista con índice `Map<String, TaskCard>`. No hacer benchmarking ornamental: medir solo si el tamaño/caso justifica la decisión.

## Regla

Cada ampliación debe responder «qué problema nuevo resuelve». Si solo demuestra sintaxis, queda como experimento, no como mejora del diseño base.


