# Laboratorio · AulaFlow Mobile Quality Gate

Recibes el [starter](../Practica/Starter/quality_gate/README.md), una app DEMO con `TaskStore` inyectable, lista de trabajos, contador, recarga y toggle por ID. Tu producto mejora su calidad con pruebas que distinguen errores reales. No se crea un backend ni una aceptación global de AulaFlow 2.0. Usa el [dossier único Q01–Q05](../Alumnado/01_REGISTRO_CALIDAD_PM6.md) y la [ruta de 480 min](../Alumnado/00_RUTA_PM6.md): cada hito consume minutos de A01–A08/T1–T2 ya previstos.

En cada hito trabaja así: **problema → predicción → test/acción → rojo esperado → corrección mínima → verde → regresión → límite**. Un error de entorno se resuelve con [Debugging](05_DEBUGGING_PM6.md) antes de atribuirlo a la app.

## Hito 1 · El verde que no detecta el contador (A01–A03, capa A)

**Entrada:** copia inicial, Flutter 3.47.2 y `pubspec.yaml`. Ejecuta `flutter pub get`, `flutter analyze --fatal-infos`, `flutter test test/smoke_test.dart`; ese verde solo verifica arranque. En `lib/quality.dart` lee `pendingCount`. Predice 2 para A abierta, B terminada, C abierta. Copia el [test guiado E1](03_EJEMPLOS_GUIADOS_PM6.md) y ejecútalo aislado. **Resultado esperado del starter:** aserción que esperaba 2 y obtiene 1. Corrige solo la selección de abiertas, repite y añade vacío/todos terminados. Conserva baseline, diferencia y regresión en Q01/Q02. Si no compila, revisa carpeta/imports; no «corrijas» expected a 1.

## Hito 2 · Dos Futures y una política (T1/A04, capa A)

**Entrada:** `ControlledStore` del ejemplo. Inicia dos `load()` sin esperar el primero, completa la respuesta nueva antes de la vieja. La política es «la última solicitud **iniciada** gobierna». **Rojo esperado del starter:** OLD sobrescribe NEW; también prueba que un error de la vigente no es borrado por el éxito antiguo. Identifica el lugar de publicación, usa un guard de generación en éxito, error y finalización; no lo confundas con cancelar la operación externa. Repite orden normal y orden inverso. Guarda test, diff, versión y límite: son Futures controlados en host, no latencia de red real.

## Hito 3 · Error, retry, identidad y dispose (A04, capa A)

Completa una solicitud con error. Predice `error` visible y `loading == false`; el starter deja loading activo. Ejecuta un widget test con `pump` controlado, pulsa *Reintentar*, completa con lista vacía y comprueba mensaje y acción disponible. No aumentes un timeout de `pumpAndSettle` para ocultar el spinner. Después alterna un trabajo por **ID**, no índice. Inicia una solicitud, libera el controlador y completa el Future: no debe avisar ni publicar estado tras dispose. Ejecuta un caso normal tras cada corrección. Conserva salidas y regresiones; el host no acredita Android.

## Hito 4 · Retención y observación (A04–A05, capas A y B)

Carga 25 snapshots de prueba con IDs distinguibles. La política de referencia conserva **20**: comprueba longitud y qué entrada antigua sale. Esto mide referencias lógicas. Sigue [Inspector, Performance y Memory](08_DEVTOOLS_Y_CI_PM6.md) con destino real de trabajo: mismo dataset/recorrido, calentamiento, tres repeticiones comparables de eager/builder en profile y cortes de memoria. Conserva Q03 con traza/protocolo y límite. Si DevTools no se ejecutó, `PENDIENTE_DEVTOOLS` y turno de observación; no calcules MB imaginarios.

## Hito 5 · Android, CI y cuatro capas (A06/T2, capas B, C y D)

Prepara Android en una copia, verifica `flutter devices`, ejecuta `integration_test/flow_test.dart` en un **emulador** y recorre visiblemente error → retry → lista → toggle. Registra entorno y mejora justificada para **RA2.g**; analiza el resultado real, pues el starter original puede agotar `pumpAndSettle`. Construye `app-debug.apk`, guarda SHA del código y hash del archivo, y lee el run de CI del **mismo commit** en Q05. Build y CI son capa C, no despliegue.

En un **móvil real autorizado** instala esa APK de práctica, arranca y ejecuta el mismo recorrido; registra resultado con destino saneado para **RA2.h**. Si falta AVD, móvil o Actions, continúa las capas disponibles y acuerda turno; marca cada pendiente distinto. En T2 (19/01/2027) realiza I3: 22 min de modificación no preparada sin agente + 10 min de explicación individual supervisada, dentro de **45 min efectivos**, en taller o por cita reprogramada de la vía desde casa. Nunca publiques la variante reservada.

## Hito 6 · Un corte defendible (A07–A08)

Repite formato, análisis y pruebas pertinentes sobre el corte final. Comprueba que el run y el SHA entregado coinciden; si el código cambió, el run anterior ya es histórico. Entrega fuente/tests, diff, **un** dossier Q01–Q05, evidencias reales disponibles y pendientes explícitos. Usa [¿Estoy listo?](12_AUTOEVALUACION_PM6.md). No publiques seriales, cuentas, keystores, logs crudos ni datos de terceros.

## Criterios conservados

Contador de abiertas; última solicitud iniciada gobierna datos/error/loading; error termina carga y permite retry; dispose invalida respuestas; history acotado a 20; vacío/error legibles y toggle por ID; controles sobre el corte; interacción de emulador; APK e instalación/recorrido físico. La cantidad de tests, cobertura, CI verde o APK aislada no asigna nota.
