# Gimnasio graduado · PM3

Estas 12 katas están incluidas en las fases 2–7. Entrega predicción, cambio
pequeño y explicación. Las soluciones docentes admiten alternativas equivalentes.

## K1 · Diagnostica un `Row`

Un icono, un título largo y un botón desbordan a 320 px. Marca quién impone las
constraints y qué hijo pide demasiado. Corrige sin ancho fijo ni truncado como
primera opción. Verifica texto al 200 %.

## K2 · De rígido a restringido

Recibes una tarjeta con `width: 500`. Haz que aproveche hasta 520 px pero pueda
encogerse. Usa `ConstrainedBox`, padding y el ancho que entrega el padre. Explica
por qué `MediaQuery` no es necesario dentro de la tarjeta.

## K3 · Bar o rail

Con una única lista de tres destinos, implementa `NavigationBar` bajo 600 px y
`NavigationRail` desde 600. Conserva selección al redimensionar y justifica el
umbral por espacio, no por tipo de dispositivo.

## K4 · Control accesible y feedback

Un `IconButton` sin tooltip alterna un favorito solo cambiando de color. Añade
nombre accesible, estado distinguible por icono/texto y `SnackBar`. Comprueba
teclado y que no aparecen mensajes duplicados.

## K5 · Diálogo con resultado

Implementa confirmación de borrado demo que devuelva `bool?`. Cancelar no cambia
estado. Tras `await`, comprueba montaje antes de usar contexto. El foco inicial y
las acciones deben ser comprensibles.

## K6 · Lee rutas, dibuja navegación

Para `/tasks`, `/tasks/:id`, `/board`, `/settings`, dibuja nodos, parámetros y
retornos. Predice qué vista crea `/tasks/DEMO-7` y qué debe pasar con un id
ausente. No ejecutes hasta cerrar la predicción.

## K7 · Id pequeño, no objeto grande

Refactoriza `context.go('/detail', extra: mutableMap)` a ruta por id. El detalle
consulta una fuente compartida y ofrece salida si no existe. Explica qué mejora
en enlaces directos y consistencia.

## K8 · ¿Local o de feature?

Clasifica y justifica: expansión de ayuda, filtro de tareas, texto temporal de un
campo, orden de tablero, índice de pestaña puramente visual, selección que usa el
detalle. No basta responder `setState`/ViewModel: nombra vida, alcance y fuente.

## K9 · `setState` disperso

Tres widgets mantienen copias de `onlyPending`. Sustitúyelas por un
`TasksViewModel` con campo privado, getter, comando y `notifyListeners`. Prueba
que cambiar el filtro actualiza dos consumidores.

## K10 · Filtrar fuera de `build`

Mueve filtrado y orden desde la vista a getters del ViewModel. No guardes otra
lista mutable como segunda fuente de verdad. Añade caso vacío y test unitario.

## K11 · ViewModel + fake por constructor

Define `TaskRepository`, `InMemoryTaskRepository` y un ViewModel que recibe la
interfaz. Carga mediante `Future`, representa `loading/ready/failed` e inyecta un
fake que falla. No uses HTTP, fichero ni base de datos.

## K12 · La clase que no creas

Te proponen `TaskService`, `TaskManager`, `FilterUseCase` y `TaskUtils` para tres
fixtures locales. Decide cuáles no crearías y por qué. Conserva solo límites que
aislen una responsabilidad o variación real. Dibuja el resultado en cinco cajas
o menos.

## Criterios de autocorrección

Una solución sólida:

- funciona en 390 y 900 px;
- explica constraints y no solo widgets usados;
- mantiene una fuente de verdad;
- navega por ubicación/id;
- separa lógica de feature y layout;
- ofrece feedback y recuperación de error;
- no adelanta fuentes externas ni patrones ceremoniales.

