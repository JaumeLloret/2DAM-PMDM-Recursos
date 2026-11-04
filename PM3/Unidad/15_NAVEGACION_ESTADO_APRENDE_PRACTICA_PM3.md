# Navegación y estado: aprende y practica

## Una ruta identifica una pantalla y un dato

Has terminado la práctica 1. Continúa ahora sobre una COPIA de AulaFlow, el proyecto que descargaste en la guía. Los ejemplos del libro anterior no tienen router: no busques allí las rutas de esta lección. En AulaFlow, abre el archivo principal y localiza `GoRouter`, `/tasks`, `/board`, `/settings` y `/detail`.

Una **ruta** describe una ubicación de la aplicación. Un **id** identifica un dato concreto. El título de una tarea puede cambiar; su id debe seguir identificando la misma tarea. En el starter, al pulsar una tarea se ejecuta `context.go('/detail', extra: task)`: se transporta el mapa mutable entero. Es cómodo para arrancar, pero acopla lista y detalle al mismo objeto.

**Ejemplo trabajado · E5.** Compara dos contratos:

```dart
// Punto de partida real: el detalle recibe un mapa.
context.go('/detail', extra: task);

// Contrato que vas a construir: la ruta transporta el identificador.
context.go('/tasks/${task['id']}');
```

Cambiar solo el segundo renglón NO basta. El router debe reconocer el patrón y el detalle debe recibir el id:

```dart
GoRoute(
  path: '/tasks/:id',
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    return TaskDetailById(id: id); // Esta vista la crearás tú.
  },
)
```

Este fragmento explica la conexión; `TaskDetailById` todavía no existe en el starter. Créala antes de compilar, empezando por un `Scaffold` que muestre el id recibido. Después resolverá el dato en el repositorio compartido. No confundas un boceto con una clase ya descargada.

**Practica · K6 y K7.** Dibuja la ruta desde lista hasta detalle de DEMO-201. Haz primero que se vea el id. Prueba también un id inventado: la pantalla debe decir que no encuentra la tarea y ofrecer volver a la lista, sin una excepción. Guarda patrón, id válido, id inválido y resultados. Si no llega al detalle, comprueba primero el patrón; si llega pero falta el dato, comprueba después la búsqueda. Son dos fallos distintos.

## Un dato compartido necesita un dueño

En el starter, `onlyPending` está dentro de `_TaskListState` y el filtrado se hace en `build`. El tablero muestra datos estáticos. Si cambias una tarea, cada pantalla puede contar una historia diferente. El problema no se arregla copiando la variable a todas las vistas.

Una **feature** es una parte funcional de la aplicación, aquí las tareas. Un **ViewModel** mantiene el estado que necesitan sus vistas y expone acciones. Un `ChangeNotifier` permite avisar cuando ese estado cambia. `ListenableBuilder` escucha ese aviso y reconstruye la parte de UI que lo necesita.

{{DIAGRAM_STATE}}

**Ejemplo trabajado · E4.** Este modelo mínimo permite comprender el filtro antes de añadir tareas y orden. Crea una clase de ensayo aparte, con el import de Flutter que proporciona `ChangeNotifier`:

```dart
class FilterModel extends ChangeNotifier {
  bool _onlyPending = false;
  bool get onlyPending => _onlyPending;

  void setOnlyPending(bool value) {
    if (value == _onlyPending) return;
    _onlyPending = value;
    notifyListeners();
  }
}
```

Para conectar el modelo a una vista de ensayo, declara `final model = FilterModel();` como campo de su `State`, fuera de `build`. En el cuerpo usa:

```dart
ListenableBuilder(
  listenable: model,
  builder: (context, _) => SwitchListTile(
    title: Text(model.onlyPending ? 'Solo pendientes' : 'Todas las tareas'),
    value: model.onlyPending,
    onChanged: model.setOnlyPending,
  ),
)
```

Cuando ese `State` sea dueño del modelo, libera su escucha al terminar:

```dart
@override
void dispose() {
  model.dispose();
  super.dispose();
}
```

Una vista que solo recibe un modelo compartido no lo destruye: lo hace quien lo creó y es responsable de su vida. Si necesitas usarlo en lista y tablero, crea el modelo por encima de ambas y pásalo por constructor.

La vista lee `onlyPending`; el evento llama al método; el método cambia el estado y avisa. No cambies datos de negocio mientras `build` está dibujando. El mismo `FilterModel` debe existir antes de construir las vistas que lo comparten; si lo creas de nuevo en cada `build`, perderás el filtro.

**Practica · K8 y K9.** Conecta un `SwitchListTile` de ensayo a ese modelo mediante `ListenableBuilder`. Verifica que activar el filtro actualiza un texto que también lo lee. Después identifica qué valores de AulaFlow deben pertenecer a `TasksViewModel`: tareas, filtro y orden. Mantén local lo que solo afecta a la presentación momentánea. Guarda un mapa «dato → dueño → quién lo lee». Evita una segunda copia de `onlyPending` en el tablero.

Si la UI no cambia, comprueba en orden: el callback se ejecuta, modifica la misma instancia que lee la vista, llama a `notifyListeners` y el builder escucha esa instancia.

## De datos locales a un repositorio que puedes sustituir

Un **Repository** ofrece los datos y las operaciones que necesita la aplicación. Oculta dónde están guardados. En PM3 están en memoria; no necesitas servidor, login ni una capa `Service` vacía. Un **Service** tendría sentido si hubiese que hablar con una fuente externa real. Añadir nombres de capas no demuestra separación.

AulaFlow comienza con mapas de `DemoFixtures`. Define un modelo de tarea con id, título y estado antes de reemplazarlos. Haz el cambio en pasos: primero leer, después actualizar y finalmente conectar el filtro. Un contrato pequeño puede ser:

```dart
abstract class TaskRepository {
  List<DemoTask> readAll();
  void setDone(String id, bool done);
}
```

`DemoTask` es el modelo que crearás, no una clase ya incluida. `InMemoryTaskRepository` conservará la colección en memoria. El ViewModel recibe un `TaskRepository` por constructor. Eso se llama **inyección de dependencias**: quien construye la aplicación decide qué implementación entregar.

{{DIAGRAM_ARCHITECTURE}}

**Ejemplo trabajado · E7.** Compara `TasksViewModel(TaskRepository repository)` con crear `InMemoryTaskRepository()` dentro del ViewModel. En el primer caso puedes entregar un fake que falle para probar el error. En el segundo, el ViewModel decide también la fuente y resulta más difícil sustituirla.

**Practica · K10.** Extrae el cálculo de tareas visibles a un getter del ViewModel. La vista solo recorre ese resultado. No vuelvas a filtrar y ordenar la colección dentro de cada pantalla. Prueba tres casos con datos DEMO: sin filtro, solo pendientes y ninguna coincidencia. Escribe el número esperado ANTES de ejecutar. Guarda esperado y observado. Si difieren, revisa datos y predicado, no maquilles el contador.

En el proyecto integrado añadirás una ordenación explícita y comprobarás que lista y tablero derivan de la misma colección. No conviertas un ejemplo de filtro en una segunda fuente de tareas.

## Interacción, vacío y error: tres decisiones distintas

Un botón debe dejar clara su consecuencia. Para una acción que cambia una tarea, pide confirmación, espera el resultado, cambia mediante el ViewModel y muestra feedback. Cancelar debe dejar los datos intactos.

**Ejemplo trabajado · E6.** Patrón de control para adaptar al nombre de tus clases:

```dart
final accepted = await showDialog<bool>(
  context: context,
  builder: (dialogContext) => AlertDialog(
    title: const Text('¿Marcar la tarea como completada?'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(dialogContext, false),
        child: const Text('Cancelar'),
      ),
      FilledButton(
        onPressed: () => Navigator.pop(dialogContext, true),
        child: const Text('Completar tarea'),
      ),
    ],
  ),
);
if (accepted != true) return;
// Aquí llamas a tu ViewModel; todavía no es código del starter.
if (!context.mounted) return;
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Tarea actualizada')),
);
```

Después de una espera, `context.mounted` permite comprobar que la vista sigue en el árbol antes de usar su contexto. El comentario marca dónde conectar tu comando: mostrar el mensaje sin cambiar la tarea sería feedback falso.

**Practica · K11.** Haz primero funcionar el comando sin diálogo. Luego conecta la confirmación. Registra el estado antes y después de Cancelar y Confirmar. Debe cambiar cero veces al cancelar y una vez al confirmar. Comprueba el foco de ambos botones con Tab, Enter y Escape cuando la plataforma lo permita.

**Ejemplo trabajado · E8.** Una lista vacía puede ser un resultado correcto del filtro. Un error significa que no se pudo obtener el resultado. Usa estados explícitos: cargando, disponible —con elementos o vacío— y fallo. No muestres «No hay tareas» cuando el repositorio ha fallado.

**Practica · K12.** Sustituye el repositorio por un fake que lance un error y verifica mensaje y botón Reintentar. Devuelve después el repositorio normal. Compara con el filtro sin coincidencias: en ese caso explica cómo quitar el filtro. Guarda una evidencia de cada caso y la causa que los diferencia.

## Depura el flujo, conserva lo aprendido y pasa al proyecto

Tienes ya las piezas para integrar. Antes, practica un diagnóstico pequeño en una copia del starter. En `StarterShell`, localiza `locations` y los destinos de `NavigationBar`. Cambia SOLO en la copia el orden de dos rutas de `locations`, sin cambiar las etiquetas. Pulsa los destinos: una etiqueta te llevará a otra pantalla.

No es un fallo del router ni del proyecto de ejemplos. Es un desacuerdo entre dos listas. Escribe «predigo que etiqueta X abrirá Y», ejecuta, captura y revierte el cambio. Después dibuja una sola descripción de destino que incluya etiqueta, icono y ruta. Ese será tu arreglo en AulaFlow.

Para cualquier error sigue la misma secuencia: síntoma observable → hipótesis → cambio mínimo → misma prueba → evidencia. Un *hot reload* no sustituye reiniciar la aplicación cuando has cambiado cómo se crean sus dependencias.

Guarda tu mapa de estado, la ruta por id, los resultados K6–K12 y las dos pruebas de Cancelar/Confirmar. No se envían como siete tareas separadas. Si te bloqueas, vuelve al capítulo concreto: [rutas](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md), [estado](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md) o [interacción](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md).

Continúa en [PM3 · Proyecto AulaFlow: construye tu aplicación paso a paso](16_PROYECTO_PASO_A_PASO_PM3.md). Vas a integrar las piezas sobre tu copia, con comprobaciones al final de cada tramo.

Referencias de consulta: [navegación Flutter](https://docs.flutter.dev/ui/navigation), [estado sencillo](https://docs.flutter.dev/data-and-backend/state-mgmt/simple), [arquitectura Flutter](https://docs.flutter.dev/app-architecture/guide).
