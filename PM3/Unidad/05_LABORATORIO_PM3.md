# Laboratorio evaluable · AulaFlow Flutter UI Shell

## Situación

Un prototipo local necesita demostrar una interfaz gráfica sencilla antes de
conectar ningún servicio. El starter funciona, pero está acoplado a fixtures,
solo ofrece navegación compacta, guarda estado de feature en la vista y pasa un
mapa mutable al detalle. Todos los elementos `DEMO-*` son ficticios y no fijan el
contrato de AulaFlow 2.0.

## Producto mínimo

Entrega una app Flutter ejecutable con:

1. lista de tareas y tablero/resumen;
2. tercera sección de ajustes;
3. detalle mediante `/tasks/:id`;
4. `NavigationBar` compacta y `NavigationRail` ancha;
5. filtro y orden observables;
6. ViewModel de feature con `ChangeNotifier`/`Listenable`;
7. `TaskRepository` abstracto e implementación local inyectada;
8. control que abre confirmación, cambia estado y muestra feedback;
9. estados de carga, vacío y error explicables;
10. texto ampliado, teclado y etiquetas sin pérdida funcional.

No copies una estructura por número de archivos. Puedes nombrar distinto si
mantienes responsabilidades y explicas la equivalencia.

## Arranque reproducible

```bash
cd Alumnado/Starter/aulaflow_flutter_ui_shell
flutter create . --platforms=android --project-name aulaflow_flutter_ui_shell_starter
flutter pub get
flutter analyze
flutter test
flutter run
```

Registra versión, dispositivo/ventana y resultado. No entregues `build/`.

## Iteración A · observa la deuda

- Ejecuta a 390×800 y 900×700.
- Activa filtro, navega a detalle y vuelve.
- Dibuja dónde viven datos, filtro, selección y navegación.
- Identifica al menos cuatro deudas y una decisión que sí conservarías.

## Iteración B · navegación adaptable

- Extrae destinos compartidos.
- Usa `LayoutBuilder` en el shell.
- Elige y justifica un breakpoint; 600 es el caso de referencia.
- Mantén cuerpo expandido y una única navegación visible.
- Sustituye objeto mutable por id de ruta.

## Iteración C · estado de feature

- Crea ViewModel con fase, tareas, filtro y orden.
- Mueve filtrado/orden fuera de `build`.
- Expón colecciones no modificables.
- La View observa estado y envía callbacks.
- Conserva `setState` solo para una preferencia local si la necesitas.

## Iteración D · repositorio e interacción

- Define interfaz de repositorio e implementación en memoria.
- Inyecta por constructor; el ViewModel no hace `new` de su fuente.
- Carga con `Future` local y representa fallo mediante fake, no red.
- Añade diálogo, cancelar/confirmar y SnackBar.
- No crees `Service` sin fuente externa.

## Iteración E · pruebas manuales

| Caso | Resultado esperado |
|---|---|
| 390 px | bar inferior, contenido desplazable, sin overflow |
| 900 px | rail lateral, cuerpo ocupa resto |
| texto 200 % | etiquetas/acciones siguen disponibles |
| ruta id válido | detalle coherente |
| ruta id inválido | salida comprensible |
| filtro sin resultados | vacío, no error |
| repo falla | error y reintento |
| cancelar diálogo | no cambia estado |
| confirmar | cambia estado y muestra feedback |
| teclado | destinos, control y diálogo alcanzables |

## Evidencias I2

- código fuente y [pubspec.yaml](../Alumnado/Starter/aulaflow_flutter_ui_shell/pubspec.yaml);
- registro de ejecución/analyze/test;
- mapa antes/después;
- tabla de decisiones completada;
- dos capturas sin datos personales: compacta y ancha;
- explicación de un rebuild observado;
- resultado de accesibilidad.

## I3 · microvariación simultánea sin agente

El docente asigna una variación: nuevo filtro, cambio de orden, destino adicional
local, breakpoint razonado, error fake o cambio de feedback. La referencia es
**23 min de microvariación simultánea** dentro del taller 2, encajada en la franja
5–28 min de la guía docente y dentro del margen 20–25 min del prompt. En ese tiempo:

1. predice archivos/estado afectados;
2. implementa y ejecuta;
3. explica durante 60–90 s evento → estado → rebuild;
4. responde una pregunta de límites.

La variación no se entrega preparada. Si no hay evidencia suficiente queda
pendiente y se completa focalizadamente, sin inventar observación.

## Condición de parada

No añadas API, login, almacenamiento, sensores, multimedia, suite profesional,
pipeline ni agentes. Cuando el producto mínimo y la evidencia funcionan, cierra.

