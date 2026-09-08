# Contenidos autosuficientes · PM3

## 1. La interfaz Flutter es una descripción

Flutter construye una interfaz componiendo objetos `Widget`. Un widget es una
descripción inmutable de una parte de la UI: texto, separación, control o una
composición completa. `build` devuelve una nueva descripción cuando cambian las
entradas observadas. No «mueve píxeles» directamente.

Tres árboles ayudan a razonar, aunque en PM3 basta distinguir sus papeles:

- árbol de widgets: configuraciones inmutables que escribimos;
- árbol de elementos: instancias que relacionan widgets con posiciones y estado;
- árbol de render: medición, disposición y pintura.

Un rebuild no equivale a recrear toda la pantalla física. Flutter compara la
nueva descripción con la estructura existente. Por eso conviene construir
widgets pequeños por legibilidad y límites de responsabilidad, no por miedo
automático al rebuild.

`BuildContext` identifica una posición del árbol. Permite consultar ancestros
como tema, navegación o un ViewModel provisto. `ScaffoldMessenger.of(context)`
busca el `ScaffoldMessenger` ancestro más cercano; `MaterialApp` ya proporciona
uno raíz por defecto. Por tanto, un contexto puede estar por encima de un
`Scaffold` y seguir encontrando ese messenger si permanece debajo de
`MaterialApp`. El fallo aparece cuando el contexto está fuera del ámbito del
`ScaffoldMessenger` apropiado o pertenece a otro subárbol/navegador. No guardes
un `BuildContext` para usarlo mucho después. Tras un `await`, comprueba
`context.mounted` antes de actuar con él.

## 2. Stateless, Stateful y estado

Un `StatelessWidget` se describe solo con entradas. Un `StatefulWidget` conserva
un objeto `State` asociado a su posición mientras esa posición siga existiendo.
`setState` anuncia que cambió estado local y que debe ejecutarse de nuevo
`build`.

Usa `setState` cuando el dato:

- solo interesa a una vista o control;
- tiene vida corta y no es regla de la feature;
- no necesita compartirse ni sobrevivir al cambio de destino.

Ejemplos: expansión de un panel, pestaña local, ayuda visible. Si filtro, orden,
selección o datos afectan a varios widgets o deben verificarse sin UI, muévelos a
un ViewModel. `setState` no es «malo»; lo incorrecto es dispersar una misma fuente
de verdad.

## 3. Constraints: baja el límite, sube el tamaño

El layout se entiende con tres movimientos:

1. el padre envía `BoxConstraints` al hijo;
2. el hijo elige un tamaño dentro de esos límites;
3. el padre posiciona al hijo.

Un `Row` da a sus hijos no flexibles ancho horizontal sin acotar. Un texto largo
puede provocar overflow. `Expanded` permite que ese hijo reciba el espacio
restante; `Flexible` le da flexibilidad sin obligarlo a ocuparlo todo; `Wrap`
salta de línea; `ListView` aporta desplazamiento cuando la colección lo necesita.

Evita resolver overflow recortando texto o fijando anchuras mágicas antes de
entender la restricción. Prueba el contenido real, texto ampliado y ventana
estrecha.

`SafeArea` evita zonas del sistema; no adapta el contenido. `MediaQuery.sizeOf`
mide la ventana completa. `LayoutBuilder` entrega las restricciones locales del
punto exacto del árbol. Para decidir bar/rail en el shell, las constraints del
shell son una señal directa.

## 4. Responsive y adaptive

- responsive: el layout se reajusta al espacio disponible;
- adaptive: además puede elegir un patrón o control diferente según el contexto.

No preguntes «¿es tablet?». Pregunta «¿cuánto ancho tiene este contenedor?». En
el laboratorio, `<600` usa `NavigationBar` y `>=600` usa `NavigationRail`. Es una
decisión defendible para tres destinos cortos, no una ley universal. Si las
etiquetas fueran largas o el contenido diferente, mediríamos y cambiaríamos el
umbral.

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

Extrae una lista compartida de destinos para que icono, etiqueta, orden y ruta
no diverjan entre bar y rail.

## 5. Material 3: pantalla, menú, alerta y controles

`Scaffold` aporta la estructura visual básica: app bar, body, navegación y
mensajes. `AppBar` identifica la pantalla y ofrece acciones. Un
`PopupMenuButton` representa acciones secundarias, no destinos principales.
`NavigationBar`/`NavigationRail` cambian de sección. Un `ListTile` o `Card`
puede abrir detalle.

Controles habituales:

- `FilledButton` para acción principal;
- `TextButton` para acción de menor énfasis;
- `IconButton` con `tooltip` cuando no hay texto;
- `SwitchListTile` para preferencia booleana;
- `FilterChip` para filtros combinables;
- `DropdownButton` para una elección de lista;
- `TextField`/`TextFormField` y `Form` para entrada/validación.

`AlertDialog` interrumpe para una decisión que lo merece. `SnackBar` confirma un
resultado breve y no bloqueante. No muestres un diálogo para cualquier tap ni
uses un SnackBar como única forma de conservar un dato importante.

```dart
final accepted = await showDialog<bool>(...);
if (accepted == true && context.mounted) {
  await viewModel.changeStatus(id);
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(...);
  }
}
```

## 6. Navegación declarativa

Navegar es representar ubicación y parámetros, no esconder pantallas en una
pila improvisada. `go_router` define patrones como `/tasks/:id` y crea la vista
desde `state.pathParameters`.

```dart
GoRoute(
  path: '/tasks/:id',
  builder: (_, state) => DetailView(id: state.pathParameters['id']!),
)
```

Pasa un id estable y pequeño. La pantalla de detalle consulta la fuente de
verdad. Pasar un mapa mutable enorme en `extra` acopla origen y destino, dificulta
deep links y puede enseñar datos obsoletos. `extra` puede ser razonable para un
objeto efímero concreto, pero no es el contrato principal del laboratorio.

La navegación del shell usa `context.go` porque selecciona ubicación. No se
introducen redirecciones de autenticación, shell routers complejos ni deep links
de producción: pertenecen a problemas posteriores.

## 7. UI = función del estado

Una vista debe poder derivarse de estado observable:

```text
UI = f(phase, tasks, filter, order, selection)
```

El evento fluye en sentido contrario:

```text
tap → callback del ViewModel → cambia estado → notifyListeners → rebuild
```

`ChangeNotifier` implementa `Listenable`. Mantiene campos privados, expone
lecturas seguras, ejecuta comandos y llama `notifyListeners` después de un
cambio. `provider` coloca la instancia en el árbol y ofrece `watch` para observar
y `read` para ejecutar sin suscribirse.

Estados mínimos de carga:

- `idle/loading`: esperando;
- `ready`: lista visible, incluso vacía;
- `failed`: error comprensible y reintento.

No mezcles una lista vacía con un error. No llames al repositorio desde `build`:
cada rebuild podría relanzar la operación.

## 8. View y ViewModel

La View:

- compone widgets;
- adapta layout usando información visual;
- observa estado;
- envía eventos;
- navega de forma simple.

El ViewModel:

- recupera datos del repositorio;
- mantiene estado de feature;
- filtra, ordena o combina para la presentación;
- expone comandos;
- representa errores.

Mover `if (task.done...)` de color a ViewModel no siempre mejora nada: decidir
un icono por estado puede ser lógica visual legítima. Mover el filtrado completo
sí ayuda porque define qué datos presenta la feature y se prueba sin widgets.

## 9. Repository, Service e inyección

Mapa de referencia:

```text
View → ViewModel → Repository → Service
```

Un Repository es la fuente de verdad de modelos de aplicación y oculta cómo se
obtienen. Un Service envuelve una fuente externa o plataforma. En PM3 solo hay
fixtures en memoria, por lo que implementamos:

```text
View → TasksViewModel → TaskRepository ← InMemoryTaskRepository
```

No creamos un `Service` vacío. Aparecerá cuando PM4/PM5 introduzcan una fuente
que lo justifique. La interfaz se inyecta por constructor; así el ViewModel no
crea su dependencia y puede recibir otra fake en una prueba.

Evita `Manager`, `Utils`, casos de uso de una sola línea o un fichero por cada
detalle si no reducen una complejidad observable. La arquitectura es una
respuesta al cambio, no una colección de nombres.

## 10. Accesibilidad operativa

Comprueba, no declares:

- texto al 200 % sin perder acciones;
- orientación/ventana estrecha sin overflow;
- recorrido por teclado y foco visible;
- etiquetas para iconos y controles;
- estado expresado con texto/icono, no solo color;
- targets táctiles adecuados y orden lógico;
- mensajes que indican qué pasó y cómo continuar.

`Semantics` sirve cuando el significado no emerge del widget. Muchos controles
Material ya aportan semántica si tienen etiqueta/tooltip. Duplicarla puede hacer
que el lector repita texto.

## 11. Diagnóstico por síntomas

| Síntoma | Hipótesis | Acción | Verificación |
|---|---|---|---|
| franja amarilla/negra | hijo excede constraints | inspeccionar Row/Expanded/Wrap | 390 px + texto grande |
| menú no muestra SnackBar | contexto sin Messenger adecuado | revisar el `ScaffoldMessenger` ancestro y el subárbol de navegación | activar acción y leer mensaje |
| lista se recarga en bucle | Future lanzado desde build | mover a ViewModel/load | contar invocaciones |
| filtro se pierde al navegar | estado vive en pantalla efímera | subir a ViewModel de feature | volver y observar |
| detalle obsoleto | se pasó mapa mutable | navegar por id y consultar VM | cambiar estado y reabrir |
| bar y rail difieren | destinos duplicados | compartir descriptor | comparar ambas anchuras |

## 12. Qué queda fuera

PM3 no enseña REST, auth, persistencia, plugins de dispositivo, testing
profesional, CI, SDD/agentes o arquitectura global. Los tests suministrados son
barandillas del material. El proyecto `AulaFlow` es una ficción `DEMO-*` sin
contrato ni datos reales.

