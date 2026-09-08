# Ejemplos guiados · PM3

En todos: predice, ejecuta, observa, explica y cambia una condición. Los ejemplos
completos viven en [Alumnado/Ejemplos/adaptive_navigation_example/](../Alumnado/Ejemplos/adaptive_navigation_example).

## E1 · Un overflow que no se arregla con deseo

```dart
Row(children: [
  const Icon(Icons.info_outline),
  const Text('Una etiqueta suficientemente larga para el espacio disponible'),
]);
```

1. Predice qué ocurre a 280 px y con texto al 200 %.
2. Ejecuta y lee el mensaje de constraints.
3. Envuelve el `Text` en `Expanded` y permite varias líneas.
4. Verifica 280, 390 y 900 px.
5. Explica qué constraint cambió. «He puesto Expanded» no basta.

## E2 · Mismos destinos, representación distinta

El ejemplo comparte tres `NavigationDestination`. Bajo 600 px los muestra en
`NavigationBar`; desde 600 los transforma en `NavigationRailDestination`.

Puntos de lectura:

- `LayoutBuilder` mide el espacio del shell, no adivina dispositivo;
- bar y rail comparten orden, iconos y etiquetas;
- solo existe una representación a la vez;
- el body usa `Expanded` en la variante ancha.

Cambia el breakpoint a 720 y registra en qué anchura deja de ser cómoda cada
representación. Decide con evidencia cuál conservarías para esas etiquetas.

## E3 · Estado efímero legítimo

El contador del ejemplo solo interesa a la pantalla y no modela datos de la
feature. `setState` es suficiente. Haz que se reinicie al cambiar de destino y
explica por qué eso sería correcto o incorrecto según el requisito.

Los apartados E4–E8 comparan decisiones de refactorización para aplicar al laboratorio. Los nombres de la propuesta no corresponden a archivos ya implementados en el starter.

## E4 · Estado de feature

Compara:

```dart
final visible = fixtures.where(matchesFilter).toList(); // dentro de build
```

con:

```dart
List<DemoTask> get visibleTasks => ...; // en TasksViewModel
```

El segundo diseño concentra fuente, filtro y orden, permite probar el resultado
sin bombear widgets y evita que cada vista invente su interpretación. No mueve al
ViewModel decisiones puramente visuales como el icono de un estado.

## E5 · Ruta por id

Starter: `context.go('/detail', extra: taskMap)`. Propuesta de refactorización:
`context.go('/tasks/${task.id}')`. Dibuja qué necesita cada destino si se abre
directamente. En tu refactorización, la pantalla consultará `findById`; en el starter
depende de que otra pantalla le entregue un objeto vivo.

Prueba `/tasks/DEMO-INVALID`: debe aparecer una salida comprensible, no un crash.

## E6 · Confirmación y feedback

Implementa una confirmación que abra `AlertDialog`, devuelva `bool?`, ejecute el comando y muestre
`SnackBar`. Cancela y verifica que no cambia nada. Confirma y comprueba que el
estado cambia también al volver a la lista. Prueba pulsación por teclado.

## E7 · Arquitectura que termina donde termina el problema

```text
TasksView → TasksViewModel → TaskRepository ← InMemoryTaskRepository
```

Se puede sustituir el repositorio en un test. No se añade `Service`: los fixtures
ya están dentro de Dart. Añadir una clase `DemoService` que solo devuelve la
misma lista duplicaría nombres, no aislaría una frontera externa.

## E8 · Error y vacío son estados diferentes

Representa el fallo con `LoadPhase.failed` y ofrece reintento. Un filtro sin resultados
renderiza un estado vacío, no el mismo error. En el test, un repositorio fake
falla sin red. Explica qué control debe permanecer disponible en cada estado.

## Checklist de reproducción

- [ ] predije antes de ejecutar;
- [ ] registré tamaño lógico y escala de texto;
- [ ] identifiqué padre, constraint e hijo en el layout;
- [ ] pude recorrer bar/rail con teclado;
- [ ] una ruta inválida no bloqueó la app;
- [ ] cancelar el diálogo no modificó datos;
- [ ] el estado sobrevivió al cambio de vista cuando debía;
- [ ] no añadí servicios externos.

