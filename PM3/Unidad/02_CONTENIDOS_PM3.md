# PM3 · De una pantalla que funciona a una interfaz que se explica

> Fuente anterior conservada para trazabilidad. La publicación vigente se define en el manifiesto AULES v3 y usa los libros integrados 13–16; este documento no se exporta como una actividad separada.


## El problema que vamos a resolver

El starter abre pantallas, pero todavía no responde bien cuando cambia el ancho, mezcla datos con presentación y entrega un objeto mutable al detalle. Antes de elegir widgets o capas, necesitamos comprender cuatro preguntas:

1. ¿Qué parte de la interfaz se está describiendo?
2. ¿Qué espacio recibe?
3. ¿Dónde vive el estado que observa?
4. ¿Qué límite real necesitamos separar?

Trabaja con el ejemplo y el starter. En cada sección encontrarás una acción y un checkpoint: leer sin ejecutar no basta, y ejecutar sin poder explicarlo tampoco.

## 1. Widget, árbol y `BuildContext`

### Problema

Cuando Flutter vuelve a llamar a `build`, puede parecer que «dibuja todo desde cero». Esa idea lleva a evitar widgets pequeños o a guardar objetos que no deberían sobrevivir.

### Decisión

Piensa en un `Widget` como una **descripción inmutable** de una parte de la UI. `build` produce una nueva descripción cuando cambian las entradas observadas. Flutter la relaciona con elementos ya existentes y actualiza el render necesario.

Tres árboles ayudan a razonar:

- widgets: configuraciones que escribimos;
- elementos: instancias que mantienen posición y relación con estado;
- render: medición, disposición y pintura.

No necesitas memorizar su implementación. Sí necesitas saber que un rebuild no equivale a reconstruir físicamente toda la pantalla.

`BuildContext` identifica una posición del árbol. Desde esa posición se buscan ancestros como tema, router, `ScaffoldMessenger` o un ViewModel provisto. No lo guardes para usarlo mucho después.

```dart
final accepted = await showDialog<bool>(context: context, builder: ...);
if (accepted == true && context.mounted) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Cambio guardado')),
  );
}
```

`MaterialApp` proporciona un `ScaffoldMessenger` raíz por defecto. El error no depende simplemente de estar «por encima de un `Scaffold`», sino de buscar desde un contexto que queda fuera del ámbito apropiado o pertenece a otro subárbol de navegación.

### Acción y checkpoint

Localiza tres llamadas que usan `context` en el starter. Para cada una escribe qué ancestro necesita. Puedes continuar cuando distingues posición del árbol de widget visual.

### Si falla

Si un diálogo o `SnackBar` no aparece, imprime o simplifica el subárbol y comprueba primero desde qué contexto se realiza la búsqueda. No muevas la llamada al azar.

## 2. Estado local y estado de feature

### Problema

Tres widgets pueden guardar tres copias de `onlyPending`. Cada copia funciona por separado, pero dejan de representar una única decisión del usuario.

### Decisión

Usa `setState` para información corta que solo pertenece a una vista: expansión de ayuda, pestaña puramente visual o texto temporal. Lleva a un ViewModel el filtro, orden, selección o datos que afectan a varios widgets o deben probarse sin UI.

```text
evento → comando del ViewModel → cambia estado → notifyListeners → rebuild
```

`setState` no es incorrecto. El problema es dispersar una fuente de verdad.

### Acción y checkpoint

Clasifica expansión de ayuda, filtro de tareas, orden del tablero, texto de un campo y selección del detalle. Justifica vida, alcance y consumidores. Cierra el checkpoint cuando puedes explicar por qué dos estados visualmente parecidos necesitan hogares distintos.

### Si falla

Si un dato se pierde al navegar, pregunta primero si el requisito exige conservarlo. Si sí, probablemente vive demasiado abajo; si no, reiniciarlo puede ser correcto.

## 3. Constraints: entender antes de añadir anchuras

### Problema

Una franja amarilla/negra indica que un hijo pide más espacio del permitido. Fijar otra anchura puede ocultar el síntoma en tu equipo y romperlo en otro.

### Explicación

El layout sigue tres movimientos:

1. el padre envía `BoxConstraints`;
2. el hijo elige un tamaño dentro de esos límites;
3. el padre posiciona al hijo.

Un `Row` ofrece a hijos no flexibles un ancho horizontal sin acotar. Un texto largo puede desbordar. `Expanded` entrega el espacio restante; `Flexible` permite encogerse; `Wrap` salta de línea; `ListView` aporta desplazamiento cuando corresponde.

`SafeArea` evita zonas del sistema, pero no adapta contenido. `MediaQuery.sizeOf(context)` mide la ventana. `LayoutBuilder` entrega las restricciones locales del punto exacto donde decides el layout.

### Acción y checkpoint

Reproduce E1, predice el fallo y corrígelo con flexibilidad. Verifica a 390 px y texto grande. Puedes seguir cuando puedes nombrar padre, constraint e hijo que pedía demasiado.

### Si falla

Reduce el `Row` a dos hijos. Comprueba que `Expanded` o `Flexible` es hijo directo del flex. No uses `SingleChildScrollView` horizontal como parche automático.

## 4. Responsive y adaptive

### Problema

Clasificar por «móvil/tablet» no dice cuánto espacio recibe un widget dentro de una ventana dividida.

### Decisión

- **Responsive:** reorganiza el mismo contenido según el espacio.
- **Adaptive:** puede elegir un patrón o control diferente.

En este caso, menos de 600 px usa `NavigationBar` y desde 600 px usa `NavigationRail`. Es una decisión razonable para tres etiquetas cortas, no una ley universal.

```dart
LayoutBuilder(
  builder: (context, constraints) {
    final wide = constraints.maxWidth >= 600;
    return Scaffold(
      body: wide ? Row(children: [rail, Expanded(child: body)]) : body,
      bottomNavigationBar: wide ? null : bar,
    );
  },
)
```

Comparte una lista de destinos para que icono, etiqueta, orden y ruta no diverjan.

### Acción y checkpoint

Prueba E2 a 599/600 px y cambia el breakpoint a 720. Conserva la anchura en la que cada representación deja de ser cómoda. El checkpoint no es «usa 600»: es justificar una decisión con el contenido real.

### Si falla

Si aparecen bar y rail a la vez, revisa la condición y las propiedades del `Scaffold`. Si el body desaparece en ancho, comprueba `Expanded` dentro del `Row`.

## 5. Material 3: controles con propósito

### Problema

Una interfaz puede contener muchos controles y seguir sin comunicar qué acción es principal, qué cambió o cómo cancelar.

### Decisión

- `Scaffold`: estructura de pantalla;
- `AppBar`: identidad y acciones globales de esa pantalla;
- `NavigationBar`/`NavigationRail`: destinos principales;
- `PopupMenuButton`: acciones secundarias, no destinos;
- `FilledButton`: acción principal;
- `IconButton`: necesita `tooltip` cuando no hay texto;
- `AlertDialog`: decisión que merece interrupción;
- `SnackBar`: confirmación breve no bloqueante.

No dependas solo del color para expresar estado. Combina texto, icono o semántica adecuada.

### Acción y checkpoint

Trabaja K4 y K5. Cancela y confirma. Cierra cuando cancelar no cambia datos, confirmar cambia una vez y el resultado se entiende sin interpretar solo un color.

## 6. Navegación declarativa por ubicación e id

### Problema

El starter pasa un mapa mutable entero mediante `extra`. El detalle depende de que otra pantalla lo abra y puede mostrar una copia obsoleta.

### Decisión

Representa la ubicación y un parámetro estable:

```dart
GoRoute(
  path: '/tasks/:id',
  builder: (_, state) => DetailView(
    id: state.pathParameters['id']!,
  ),
)
```

El detalle consulta la fuente de verdad por id. `extra` sigue siendo útil para información efímera concreta, pero no es el contrato principal de este laboratorio.

Usa `context.go` para seleccionar una ubicación del shell. PM3 no necesita autenticación, redirecciones protegidas ni shell routers de producción.

### Acción y checkpoint

Trabaja K6–K7. Abre un id válido y uno inexistente. Puedes continuar cuando la ruta inválida ofrece salida comprensible y el detalle refleja un cambio realizado desde otra vista.

### Si falla

Muestra temporalmente el id recibido. Separa «la ruta no coincide» de «el repositorio no encuentra el modelo».

## 7. UI como función del estado

### Problema

Si `build` inicia una carga, cada rebuild puede repetirla. Si vacío y error comparten pantalla, el usuario no sabe si reintentar o cambiar el filtro.

### Decisión

Describe la UI desde un estado observable:

```text
UI = f(phase, tasks, filter, order, selection)
```

Un `ChangeNotifier` mantiene campos privados, expone lecturas seguras, ejecuta comandos y llama a `notifyListeners` después del cambio. Con `provider`, `watch` observa y `read` ejecuta sin suscribirse.

Fases mínimas:

- loading: operación en curso;
- ready: lista visible, incluso vacía;
- failed: error comprensible y reintento.

### Acción y checkpoint

Mueve `onlyPending` al ViewModel y añade un fake que falla. Cierra cuando filtro vacío y fallo producen respuestas diferentes y una carga no se relanza desde `build`.

### Si falla

Cuenta invocaciones del repositorio. Si aumentan al redibujar, mueve la llamada al ciclo de inicialización o a un comando explícito.

## 8. View y ViewModel

La **View** compone widgets, adapta layout, observa estado, envía eventos y navega. El **ViewModel** carga datos, mantiene estado de feature, deriva filtro/orden, expone comandos y representa errores.

No muevas automáticamente cada `if` visual al ViewModel. Elegir un icono puede ser decisión visual; determinar qué tareas son visibles sí pertenece a la feature.

### Acción y checkpoint

Dibuja el flujo de un cambio de estado desde el botón hasta el rebuild. Señala en qué clase se decide el icono y en cuál se decide el conjunto visible. Cierra cuando ambas decisiones tienen una razón distinta.

## 9. Repository, Service e inyección

### Problema

Crear `Service`, `Manager`, `UseCase` y `Utils` alrededor de tres fixtures no separa una variación real; añade saltos.

### Decisión

El mapa de referencia es:

```text
View → ViewModel → Repository → Service
```

Pero PM3 solo necesita:

```text
View → TasksViewModel → TaskRepository ← InMemoryTaskRepository
```

El repositorio oculta la fuente de modelos. Un Service aparecerá cuando exista una fuente externa o plataforma que envolver, no antes. Inyecta la interfaz por constructor para sustituirla por un fake sin cambiar el ViewModel.

### Acción y checkpoint

Trabaja K11–K12. Cierra cuando puedes provocar un fallo con otra implementación y explicar al menos una clase que decidiste no crear.

## 10. Accesibilidad operativa

No escribas «es accesible» sin comprobar:

- texto grande sin perder acciones;
- ancho estrecho sin overflow;
- teclado y foco visible cuando el destino lo permite;
- `tooltip` o etiqueta para iconos;
- estado con texto/icono, no solo color;
- orden lógico y mensajes que indiquen cómo continuar.

Muchos widgets Material ya ofrecen semántica si tienen etiquetas. `Semantics` se añade cuando el significado no emerge del control; duplicarla puede hacer que un lector repita texto.

### Acción y checkpoint

Ejecuta las pruebas de la Ruta y completa el registro de accesibilidad. Indica exactamente qué observaste y con qué herramienta; no conviertas una prueba local en una afirmación institucional.

## 11. Mapa rápido de rescate

| Síntoma | Primera comprobación | Cambio mínimo | Regresión |
|---|---|---|---|
| overflow | padre, constraint e hijo | flexibilidad/layout | 390 px + texto grande |
| SnackBar no aparece | contexto y messenger ancestro | usar contexto del ámbito correcto | cancelar/confirmar |
| carga en bucle | llamada desde `build` | comando/init controlado | redibujar sin nueva carga |
| filtro se pierde | vida del estado | subir al ViewModel si el requisito lo exige | navegar y volver |
| detalle obsoleto | objeto mutable en ruta | id + consulta compartida | cambiar y reabrir |
| bar y rail divergen | destinos duplicados | descriptor compartido | comparar ambas anchuras |

La guía **Ayuda PM3** amplía estos síntomas. La práctica **Debugging PM3** te obliga a recorrer una reparación completa antes del laboratorio.

## 12. Frontera de la unidad

No necesitas REST, autenticación, persistencia, plugins de dispositivo, testing profesional, CI como contenido, SDD/agentes ni arquitectura global. Los tests suministrados son barandillas para comprobar el material. Los datos `DEMO-*` son ficticios.
