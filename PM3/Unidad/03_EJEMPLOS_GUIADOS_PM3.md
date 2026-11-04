# PM3 · Ejemplos guiados reproducibles

> Fuente anterior conservada para trazabilidad. La publicación vigente se define en el manifiesto AULES v3 y usa los libros integrados 13–16; este documento no se exporta como una actividad separada.


Los ejemplos no se leen como recetas. En cada uno vas a **localizar, predecir, ejecutar, modificar, verificar y explicar**.

## Prepara el paquete de ejemplos

Abre como proyecto la carpeta:

```text
30 - PMDM/Unidades/PM3/Alumnado/Ejemplos/adaptive_navigation_example/
```

Desde la carpeta que contiene `pubspec.yaml`:

```bash
flutter create . --platforms=android --project-name adaptive_navigation_example
flutter pub get
flutter analyze
flutter test
flutter run
```

Estado inicial esperado: tres destinos; `NavigationBar` en espacio compacto, `NavigationRail` desde 600 px y un contador local.

## E1 · Reparar un overflow comprendiendo las constraints

**Localiza:** `lib/main.dart` y el widget que compone texto y controles en horizontal.

**Predice:** qué ocurrirá a 280 px o con fuente grande si un `Row` contiene un texto largo sin flexibilidad.

**Prueba este estado en una copia:**

```dart
Row(children: [
  const Icon(Icons.info_outline),
  const Text('Una etiqueta suficientemente larga para el espacio disponible'),
]);
```

**Modifica:** envuelve el `Text` en `Expanded` y permite varias líneas.

**Verifica:** 280, 390 y 900 px; ejecuta también `flutter analyze`.

**Explica:** qué constraint recibió el texto antes y después. «He puesto `Expanded`» no basta.

**Si falla:** reduce el ejemplo a icono + texto y revisa que `Expanded` sea hijo directo del `Row`.

## E2 · Los mismos destinos, dos representaciones

**Localiza:** `lib/main.dart`, la lista compartida de destinos y el `LayoutBuilder`.

**Predice:** qué navegación aparece a 599 y 600 px.

**Ejecuta:** prueba 390 × 800 y 900 × 700 con el procedimiento de la Ruta.

**Modifica:** cambia temporalmente el breakpoint a 720.

**Verifica:** solo existe bar o rail, el orden y las etiquetas coinciden y el destino seleccionado se conserva al redimensionar.

**Explica:** por qué medimos el espacio del contenedor y no preguntamos si el dispositivo «es una tablet».

## E3 · Estado efímero legítimo

**Localiza:** el contador del ejemplo y su `setState`.

**Predice:** si el valor debería sobrevivir al cambiar de destino según dos requisitos distintos: contador visual temporal o dato de la feature.

**Modifica:** reinícialo al cambiar de destino.

**Verifica:** describe cuándo ese reinicio es correcto y cuándo indicaría que el estado vive demasiado abajo.

## E4 · Estado de feature fuera de `build`

**Lee y compara:**

```dart
final visible = fixtures.where(matchesFilter).toList();
```

```dart
List<DemoTask> get visibleTasks => ...;
```

**Predice:** qué widgets necesitarían duplicar la primera regla.

**Modifica:** mueve filtro y orden a getters del ViewModel sin crear una segunda lista mutable.

**Verifica:** cambia el filtro desde dos consumidores y comprueba en tu app que ambos reflejan la misma decisión. El starter incluye una prueba de arranque; no incluye un test del ViewModel para esta modificación. Si ya has creado uno en tu copia puedes ejecutarlo, pero aquí no se exige escribir tests nuevos.

**Explica:** qué es regla de feature y qué sigue siendo una decisión visual de la View.

## E5 · Ruta por id

**Localiza en el starter:** `context.go('/detail', extra: taskMap)`.

**Predice:** qué necesita el detalle si se abre directamente.

**Modifica:** usa `/tasks/${task.id}` y consulta la fuente compartida por id.

**Verifica:** `/tasks/DEMO-201` muestra el dato correcto y `/tasks/DEMO-INVALID` ofrece una salida comprensible.

**Explica:** por qué un id pequeño reduce acoplamiento y evita datos obsoletos.

## E6 · Confirmación y feedback

**Predice:** qué debe cambiar al cancelar y al confirmar.

**Modifica:** abre `AlertDialog`, recupera `bool?`, comprueba `context.mounted`, ejecuta el comando y muestra `SnackBar`.

**Verifica:** cancelar no modifica datos; confirmar actualiza detalle y lista; el control se alcanza con teclado.

**Si falla el SnackBar:** revisa el `ScaffoldMessenger` ancestro y el subárbol de navegación antes de mover código al azar.

## E7 · Arquitectura que termina donde termina el problema

**Dibuja antes de modificar:**

```text
TasksView → TasksViewModel → TaskRepository ← InMemoryTaskRepository
```

**Modifica:** inyecta `TaskRepository` por constructor.

**Verifica:** puedes sustituirlo por un fake que falla sin tocar la ViewModel.

**Explica:** por qué no existe `Service`: no hay fuente externa en PM3.

## E8 · Vacío y error no son lo mismo

**Predice:** qué controles deberían seguir disponibles en un filtro sin resultados y en un fallo de carga.

**Modifica:** representa `ready` con lista vacía y `failed` con mensaje y reintento.

**Verifica:** ambos estados se distinguen sin depender solo del color y el reintento no se lanza desde `build`.

## Cierre de ejemplos

- [ ] He ejecutado el estado inicial.
- [ ] He escrito una predicción antes de cada cambio.
- [ ] He hecho una modificación pequeña, no una reescritura completa.
- [ ] He comprobado una salida esperada y una regresión cercana.
- [ ] Puedo explicar la relación entre evento, estado y reconstrucción.
