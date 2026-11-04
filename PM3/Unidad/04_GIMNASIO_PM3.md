# PM3 · Gimnasio de 12 katas

> Fuente anterior conservada para trazabilidad. La publicación vigente se define en el manifiesto AULES v3 y usa los libros integrados 13–16; este documento no se exporta como una actividad separada.


Las katas están incluidas en los pasos 2–7 de la Ruta. **No son doce entregas.** Trabaja sobre una copia del ejemplo o del starter y registra cada una en el cuaderno.

En todas usa: **LEE → PREDICE → MODIFICA → VERIFICA → EXPLICA**.

## K1 · Diagnostica un `Row`

- **LEE:** un icono, un título largo y un botón desbordan a 320 px.
- **PREDICE:** identifica padre, constraint e hijo que pide demasiado.
- **MODIFICA:** corrige sin anchura fija ni truncado como primera opción.
- **VERIFICA:** 320/390 px y texto grande, sin franja de overflow.
- **EXPLICA:** qué restricción cambió y por qué.

## K2 · De ancho rígido a límite flexible

- **LEE:** una tarjeta usa `width: 500` dentro de un espacio menor.
- **PREDICE:** qué ocurre a 390 px.
- **MODIFICA:** usa padding, `ConstrainedBox` y el ancho que entrega el padre.
- **VERIFICA:** puede encogerse y no supera 520 px cuando hay espacio.
- **EXPLICA:** por qué la tarjeta no necesita `MediaQuery`.

## K3 · Una lista de destinos, bar o rail

- **LEE:** localiza la lista compartida del ejemplo.
- **PREDICE:** representación a 599/600 px.
- **MODIFICA:** implementa `NavigationBar` compacta y `NavigationRail` ancha.
- **VERIFICA:** selección, orden e iconos se conservan al redimensionar.
- **EXPLICA:** justifica el umbral por espacio, no por dispositivo.

## K4 · Control accesible y feedback

- **LEE:** `IconButton` sin tooltip cambia solo un color.
- **PREDICE:** qué información pierde teclado o lector.
- **MODIFICA:** añade nombre, estado por icono/texto y `SnackBar`.
- **VERIFICA:** teclado y un solo mensaje por acción.
- **EXPLICA:** por qué el color no puede ser la única señal.

## K5 · Diálogo con resultado

- **LEE:** una acción destructiva cambia el estado directamente.
- **PREDICE:** estados tras cancelar y confirmar.
- **MODIFICA:** devuelve `bool?` desde `showDialog` y comprueba `mounted` tras `await`.
- **VERIFICA:** cancelar no cambia nada; confirmar cambia una vez.
- **EXPLICA:** qué problema resuelve la confirmación.

## K6 · Lee rutas antes de navegar

- **LEE:** `/tasks`, `/tasks/:id`, `/board`, `/settings`.
- **PREDICE:** vista de `/tasks/DEMO-7` y comportamiento de un id ausente.
- **MODIFICA:** dibuja nodos, parámetros y retorno antes de tocar código.
- **VERIFICA:** rutas válidas e inválida tienen resultado comprensible.
- **EXPLICA:** diferencia entre destino e información transportada.

## K7 · Id pequeño, no objeto mutable

- **LEE:** `context.go('/detail', extra: mutableMap)`.
- **PREDICE:** qué pasa si el mapa cambia o el detalle se abre directamente.
- **MODIFICA:** navega por id y consulta una fuente compartida.
- **VERIFICA:** el detalle refleja cambios y maneja id inexistente.
- **EXPLICA:** mejora en consistencia y enlaces directos.

## K8 · Estado local o de feature

- **LEE:** expansión de ayuda, filtro, texto temporal, orden, pestaña visual y selección de detalle.
- **PREDICE:** vida, alcance y consumidores de cada dato.
- **MODIFICA:** clasifica y coloca dos ejemplos en `setState`/ViewModel.
- **VERIFICA:** al navegar se conserva solo lo que exige el requisito.
- **EXPLICA:** no basta nombrar la herramienta; justifica la fuente de verdad.

## K9 · Elimina copias de `onlyPending`

- **LEE:** tres widgets mantienen su propia copia.
- **PREDICE:** una secuencia que los deja incoherentes.
- **MODIFICA:** campo privado, getter, comando y `notifyListeners` en ViewModel.
- **VERIFICA:** dos consumidores se actualizan con un solo cambio.
- **EXPLICA:** dónde vive ahora la fuente de verdad.

## K10 · Filtra fuera de `build`

- **LEE:** filtrado y orden calculados de forma distinta en dos vistas.
- **PREDICE:** resultado para filtro sin coincidencias.
- **MODIFICA:** crea getters derivados sin guardar otra lista mutable.
- **VERIFICA:** caso normal, vacío y cambio de orden.
- **EXPLICA:** por qué un getter derivado no duplica estado.

## K11 · ViewModel con repositorio inyectado

- **LEE:** el ViewModel crea directamente sus fixtures.
- **PREDICE:** qué habría que modificar para simular un fallo.
- **MODIFICA:** define `TaskRepository`, implementación local e inyección por constructor; representa loading/ready/failed.
- **VERIFICA:** fake correcta y fake que falla sin red.
- **EXPLICA:** qué frontera real aísla el repositorio.

## K12 · La clase que decides no crear

- **LEE:** propuesta de `TaskService`, `TaskManager`, `FilterUseCase` y `TaskUtils` para fixtures locales.
- **PREDICE:** responsabilidad y variación que aislaría cada clase.
- **MODIFICA:** conserva solo límites con utilidad observable, en cinco cajas o menos.
- **VERIFICA:** puedes narrar el flujo completo sin saltos ni capas vacías.
- **EXPLICA:** qué clase rechazaste y qué coste evitaste.

## Autocorrección

Has cerrado una kata cuando existe predicción, cambio pequeño, comprobación observable y explicación causal. Una captura o código copiado sin explicación no cierra el checkpoint.
