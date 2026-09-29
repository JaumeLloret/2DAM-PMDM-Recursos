# PM7 · Ayuda por síntomas y primer fallo

Cuando te bloquees, detente en el **primer** error. Anota archivo/carpeta, herramienta, comando, resultado esperado, resultado real y corte local o SHA. Cambia una causa cada vez y repite. D05 recoge lo ejecutado; una sugerencia sin ejecutar queda PROPUESTA.

| Síntoma | Qué comprobar | Qué hacer | Qué conservar |
|---|---|---|---|
| `flutter` no se encuentra | `flutter --version`, ubicación de `bin` y PATH | Sigue [Entorno](../Alumnado/02_ENTORNO_Y_FUENTES_PM7.md); reabre terminal e IDE. | Primer error y versión posterior, sin ruta personal. |
| Dart/Flutter distinto | `flutter --version` y `command -v flutter` o `where.exe flutter` | Selecciona SDK Flutter 3.47.2 y Dart 3.13.2; no cambies lock para ocultarlo. | Versiones y acción. |
| `pub get` falla | Estás en `spec_search` con `pubspec.yaml`; primer error de red/dependencia | Corrige carpeta o conexión; repite `flutter pub get`. | Error y reintento. |
| El starter tiene humo verde pero no busca | `test/smoke_test.dart` solo cuenta cuatro entradas | Escribe spec y prueba discriminante S3 antes de implementar. | Predicción y límite del humo. |
| La prueba S3 no compila | Firma/import de `selectEntries`, `test/search_test.dart` | Alinea la API de tu tarea; separa error de montaje de aserción roja. | Primer error, corrección y comando. |
| S3 devuelve A, C, D | `||` frente a `&&` y datos DEMO | Contrasta C3 y test cámara + pendientes; aplica cambio mínimo. | Expected DEMO-A, actual, diff y nueva prueba. |
| «REVISION» no encuentra A/C | `trim`, vocales acentuadas y minúsculas en `lib/catalog.dart` | Comprueba S2 con un caso mínimo; no conviertas ñ en n. | Entrada/IDs antes y después. |
| Al limpiar cambia también estado | Callback en `lib/main.dart` y C5/S7 | Borra texto manteniendo selección de estado; prueba interacción. | Diff y contador 2 de 4. |
| `dart format` altera muchos archivos | `git diff --stat` tras formato | Formatea solo `lib test`, revisa alcance y revierte cambios ajenos autorizadamente. | Lista de archivos y decisión. |
| Analyzer/test falla | Primer archivo/línea, expected/actual | Reduce a un criterio; corrige causa, no silencios globales ni test maquillado. | Fallo y regresión. |
| Agente propone paquetes, red o archivos ajenos | D03/D04 y lista de archivos permitidos | Detén ese incremento, rechaza exceso y trabaja MANUAL si hace falta. | Propuesta, decisión y diff real. |
| No hay proveedor autorizado | D03 indica modo MANUAL | Ejecuta tú las mismas tareas, pruebas y revisión; no inventes prompts. | D04–D06 equivalentes. |
| Git/PR no disponible | `git status --short` y permisos del repositorio de práctica | Conserva corte y borrador D07; pide acceso autorizado. | `PENDIENTE_PUBLICACION_PR`, no enlace ficticio. |
| AVD no arranca o falta RAM | `flutter doctor -v`, virtualización, RAM/espacio, primer error | Sigue host y solicita equipo/turno; no atribuyas emulador a un widget test. | `PENDIENTE_EMULADOR` y diagnóstico saneado. |
| Gradle/Android falla | JDK 17, Android SDK/licencias, primer error | Corrige la causa con apoyo; no alteres spec para pasar build. | `PENDIENTE_BUILD` o salida real. |
| I3 no fue observado | Cita solicitada, corte propio y variante aún reservada | Concerta tutoría individual; docente comunica cambio al iniciar supervisión. | `PENDIENTE_SUPERVISION`; no declares aprobado. |
| CI verde sobre SHA anterior | SHA de run y corte final | Repite validación del nuevo corte si cambió entrada/código. | Ambos SHA y límite del histórico. |

Si necesitas ayuda, comunica al docente fase, SO/editor, carpeta relativa, primer error, predicción y qué intentaste. Elimina cuentas, tokens, seriales, rutas personales y mensajes ajenos. La issue #58 conserva la QA real de agente, emulador, supervisión y AULES institucional; una CI verde no la cierra.
