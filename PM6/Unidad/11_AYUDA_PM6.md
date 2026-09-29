# PM6 · Ayuda por síntomas

Busca el **primer** fallo, anota comando/acción, expected/actual y capa A host, B emulador/DevTools, C CI/build o D dispositivo. Haz una comprobación pequeña, cambia una causa, repite y guarda evidencia saneada. El [guion de Debugging](05_DEBUGGING_PM6.md) explica cómo formular la hipótesis.

| Síntoma | Qué comprobar | Qué hacer | Qué guardar |
|---|---|---|---|
| `flutter` no se encuentra | `flutter --version`, SDK `bin` en PATH | Corrige PATH; terminal nueva. | Versión/primer error, sin ruta personal. |
| `pub get` falla | Estás en `quality_gate` con `pubspec.yaml`; primer error | Recupera dependencias con SDK fijado; revisa conexión. | Primer diagnóstico y reintento. |
| `analyze` falla | Archivo/línea del primer diagnóstico | Corrige la causa, no silencios globales. | Antes/después del comando. |
| Formato falla | `dart format --output=none --set-exit-if-changed lib test integration_test` | Formatea, revisa diff y repite. | Diff y resultado. |
| Import/package no existe | `name: quality_gate`, ruta de test, `pub get` | Corrige nombre/ruta, no el expected del bug. | Primer error y salida corregida. |
| Test no compila | Primer archivo/línea, firma `TaskStore` | Aísla ese test y arregla montaje. | Comando y primer error. |
| Test que debía salir rojo está verde | Starter/corte, entradas A/B/C, `expect(...,2)` | Ejecuta archivo correcto y verifica discriminación. | Código de aserción y resultado. |
| Rojo distinto al previsto | Diferencia, datos, orden de completado | Reproduce un caso mínimo antes de cambiar la app. | Expected/actual real. |
| `pumpAndSettle` agota tiempo | Spinner/loading tras error | Usa `pump` controlado, observa estado y corrige loading vigente. | Primer timeout y estado. |
| Future colgado | Orden de `load`, `complete`, `await` | Completa antes de esperar; verifica `requests.length`. | Secuencia mínima. |
| Widget no encontrado | Key/texto, montaje, `pump` | Asegura estado visible y usa selector estable. | Selector y árbol/resultado. |
| Notificación tras dispose | Completar petición después de liberar | Invalida generación, repite test de lifecycle. | Test/diff/regresión. |
| DevTools no conecta | App viva, proceso/destino correcto, enlace del IDE/terminal | Reinicia app, abre DevTools para ese proceso; solicita turno si sigue bloqueado. | Primer error o `PENDIENTE_DEVTOOLS`. |
| Gráfica en debug no comparable | Modo y destino | Reinicia en profile, misma carga y recorrido. | Protocolo, no porcentaje inventado. |
| AVD no arranca | Virtualización, RAM/espacio, SDK, primer error | Corrige causa o solicita equipo del centro. | `PENDIENTE_EMULADOR` y error saneado. |
| `flutter devices` no muestra destino | AVD encendido/USB autorizado/cable datos | Revisa destino; sigue host sin atribuir Android. | Tipos de destino, sin serial. |
| Gradle/build falla | Java 17, SDK/licencias, espacio y primer error | Corrige primero esa causa; repite build. | Resultado o `PENDIENTE_BUILD`. |
| APK no aparece | Final de build y `build/app/outputs/flutter-apk/app-debug.apk` | Repite build tras corregir primer error. | Archivo/hash si existe. |
| Móvil no detectado | USB y autorización del propietario | Revisa `flutter devices`, solicita acceso autorizado. | `PENDIENTE_DISPOSITIVO`, sin serial. |
| Firma incompatible | ID de app y **esa** instalación previa | Consulta retirada/reinstalación segura; no borres otras apps. | Primer error y solución autorizada. |
| Actions deshabilitado/CI no disponible | Permisos del repositorio de práctica | Guarda YAML y comandos locales; acuerda ejecución. | `PENDIENTE_CI`, no run inventado. |
| Run rojo | Job/primer step rojo/log | Corrige causa identificada y valida el nuevo commit. | Run, SHA, step y primer fallo. |
| Run verde, SHA equivocado | SHA del run y SHA entregado | Repite comprobaciones sobre el corte actual. | Ambos SHA y estado histórico. |

Si no tienes emulador, móvil o DevTools, **continúa host y CI** y pide un turno real al docente. Una APK construida, un widget test o una captura prestada no sustituyen esa observación. Para ayuda, comunica fase, sistema/editor, destino genérico, comando, primer error, predicción y qué probaste; elimina cuentas, tokens, seriales, rutas privadas y logs de otras apps.
