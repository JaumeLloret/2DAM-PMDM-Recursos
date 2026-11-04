# PM3 · Laboratorio AulaFlow Flutter UI Shell

> Fuente anterior conservada para trazabilidad. La publicación vigente se define en el manifiesto AULES v3 y usa los libros integrados 13–16; este documento no se exporta como una actividad separada.


## La misión

El starter muestra datos locales y permite moverse, pero mezcla responsabilidades: solo usa navegación compacta, guarda estado de feature en una vista, conoce directamente los fixtures y pasa un mapa mutable al detalle.

Vas a convertirlo en una app Flutter local, adaptable y explicable. `AulaFlow Flutter UI Shell` es un caso didáctico con datos `DEMO-*`; no establece la arquitectura futura de AulaFlow 2.0.

## Antes de modificar

Abre la carpeta `Alumnado/Starter/aulaflow_flutter_ui_shell/`, ejecuta los comandos de la Ruta y completa la práctica **Debugging PM3**. Conserva una copia segura del starter.

## Hito 0 · baseline reproducible · 10 min

**Objetivo:** demostrar que el punto de partida funciona.

**Acción:** ejecuta `flutter pub get`, `flutter analyze`, `flutter test` y `flutter run`; recorre Tareas, Tablero, Ajustes y un detalle.

**Mínimo verificable:** app abierta, tests iniciales verdes y deudas señaladas en tu cuaderno.

**Rescate:** si no arranca, consulta Ayuda PM3 y conserva el primer error. No empieces el refactor sobre un baseline desconocido.

## Hito 1 · shell adaptable · 20 min

**Objetivo:** compartir destinos y adaptar su representación.

**Acción:** extrae una única descripción de destinos; usa `LayoutBuilder`; muestra `NavigationBar` bajo 600 px y `NavigationRail` desde 600.

**Mínimo verificable:** a 390 px solo hay bar; a 900 px solo hay rail; selección, orden e iconos coinciden.

**Rescate:** reduce temporalmente el body a un texto por destino y comprueba primero índice/ruta.

## Hito 2 · navegación por id · 15 min

**Objetivo:** desacoplar lista y detalle.

**Acción:** sustituye `/detail` + mapa mutable por `/tasks/:id`; recupera el dato desde una fuente compartida.

**Mínimo verificable:** id válido abre detalle; id inválido ofrece salida comprensible.

**Rescate:** escribe primero el patrón de ruta y muestra el id recibido antes de consultar datos.

## Hito 3 · estado de feature · 25 min

**Objetivo:** mantener una única fuente de verdad.

**Acción:** crea un `TasksViewModel` con fase, tareas, filtro y orden; mueve filtrado/orden fuera de `build`; deja en `setState` solo estado realmente local.

**Mínimo verificable:** cambiar filtro actualiza lista y tablero; volver desde detalle conserva el estado exigido.

**Rescate:** empieza solo por `onlyPending`; añade orden y fases cuando ese flujo sea observable.

## Hito 4 · repositorio local e inyección · 15 min

**Objetivo:** separar la fuente local sin fingir una infraestructura futura.

**Acción:** define `TaskRepository`, implementa `InMemoryTaskRepository` e inyéctalo por constructor.

**Mínimo verificable:** el ViewModel no crea su repositorio y puede recibir un fake que falla.

**Rescate:** si aparece una capa que solo reenvía la misma llamada, elimínala. En PM3 no hace falta `Service` porque no hay fuente externa.

## Hito 5 · interacción y estados · 15 min

**Objetivo:** cerrar un flujo control → estado → feedback.

**Acción:** añade confirmación cancelable, cambio de estado y `SnackBar`; representa loading, ready/vacío y failed/reintento.

**Mínimo verificable:** cancelar no cambia; confirmar cambia una vez; vacío y error se distinguen.

**Rescate:** prueba primero el comando del ViewModel sin diálogo y después conecta la UI.

## Hito 6 · comprobación integrada · 10 min

Prueba y registra:

| Caso | Resultado esperado |
|---|---|
| 390 px | bar inferior, contenido desplazable, sin overflow |
| 900 px | rail lateral, cuerpo ocupa el resto |
| texto grande | etiquetas y acciones siguen disponibles |
| id válido/inválido | detalle coherente / salida comprensible |
| filtro vacío | estado vacío, no error |
| fake falla | error y reintento |
| cancelar/confirmar | sin cambio / cambio y feedback |
| teclado | destinos, control y diálogo alcanzables cuando el destino lo permite |

## Producto mínimo I2

- lista, tablero, ajustes y detalle;
- bar/rail por espacio disponible;
- ruta por id;
- filtro y orden observables;
- ViewModel con `ChangeNotifier`/`Listenable`;
- `TaskRepository` inyectado e implementación en memoria;
- diálogo, cambio y feedback;
- estados de carga, vacío y error;
- comprobación compacta/ancha, texto ampliado y teclado.

Entrega código, `pubspec.yaml`, mapa antes/después, plantilla de decisiones, registro real de comandos y dos capturas sin datos personales. No entregues `build/`, `.env`, plataformas generadas innecesarias, secretos ni solución docente.

## I3 · misma evidencia con o sin asistencia

Recibirás una microvariación: filtro, orden, destino local, breakpoint razonado, error fake o feedback. Trabajarás **23 minutos sin agente**:

1. predice archivos y estado afectados;
2. implementa una modificación pequeña;
3. ejecuta y conserva el resultado;
4. explica durante 60–90 segundos o mediante la evidencia equivalente cómo fluye evento → estado → rebuild;
5. responde una pregunta de límites.

En el taller puede observarse en directo. Si no asistes, la variación se asigna por AULES y entregas predicción, cambio, salida y explicación. Si aún falta autenticidad, se realiza una comprobación focalizada; no se repite toda PM3.

## Condición de parada

Cuando el producto mínimo funciona y puedes explicarlo, cierra. No añadas REST, login, persistencia, sensores, multimedia, pipeline, agentes ni más capas por apariencia.
