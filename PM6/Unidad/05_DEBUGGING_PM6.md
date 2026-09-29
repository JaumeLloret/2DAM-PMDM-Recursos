# PM6 · Debugging antes de seguir al laboratorio

Cuando algo falla, copia el **primer síntoma** y decide a qué capa pertenece. No cambies SDK, test y código a la vez. Reproduce → nombra síntoma → elige capa → formula hipótesis → ejecuta prueba mínima → cambia una causa → repite caso y regresión → conserva evidencia. El [mapa por síntomas](11_AYUDA_PM6.md) sirve para buscar rápido; este guion explica el método.

## 1. ¿Es rojo esperado?

En `test/guided_example_test.dart`, el starter debería fallar porque **esperas 2 pendientes y obtienes 1**. Ese fallo de aserción es evidencia inicial. Si aparece `flutter: command not found`, import/package inexistente, error de sintaxis o un widget no encontrado antes de ejecutar el escenario, el test no ha demostrado el bug. Resuelve el montaje, conserva el mensaje inicial y repite.

Si la prueba pensada para fallar sale verde: comprueba que trabajas en el **starter sin corregir**, que ejecutaste ese archivo, que A/C están abiertas, B terminada y la aserción espera 2. Una aserción `expect(..., 1)` dejaría el defecto protegido por error. Si sigue verde, registra el corte/diff observado antes de atribuir causas.

## 2. Aísla el primer error

| Síntoma | Capa e hipótesis | Prueba mínima → cambio mínimo → repetición |
|---|---|---|
| `flutter` no existe | PATH/SDK, no lógica | `flutter --version` en terminal nueva; corrige ruta `bin`; repite versión. |
| `pub get` falla | carpeta/SDK/dependencias | Verifica `pubspec.yaml` y primera línea causal; comprueba conexión si la descarga es necesaria; repite sin actualizar versiones a ciegas. |
| `analyze` o formato falla | archivo/línea | Ejecuta comando exacto, lee primer diagnóstico, corrige esa línea; `dart format lib test integration_test` solo tras revisar diff. |
| Test no compila o import/package falla | paquete/nombre/ruta | Verifica `name: quality_gate`, `flutter pub get` y archivo `test/`; no cambies el expected funcional. |
| Rojo diferente o widget no encontrado | setup, Key/texto o estado | Imprime/inspecciona el estado mínimo, comprueba que completaste el `Completer`, usa `pump` y el selector estable; repite el caso. |
| `pumpAndSettle` agota tiempo | animación o loading persistente | En el starter el spinner tras error puede ser un defecto real. Sustituye la espera ciega por `pump` controlado y comprueba `loading`/error; no subas el timeout para ocultarlo. |
| Future queda colgado | orden de `await` | Inicia `load()`, completa la petición y **después** espera ese Future. Si esperas antes de completar, el test se bloquea. |
| Notificación tras `dispose` | lifecycle | Inicia petición, desmonta/libera, termina Future y comprueba que no publica estado ni avisa; añade regresión. |
| CI rojo o SHA distinto | workflow/corte | Actions → run → job → primer step rojo → log; compara `git rev-parse HEAD` del run con el corte entregado. Corrige causa y valida nuevo SHA. |

## 3. Infraestructura y destino

- **DevTools no conecta:** inicia primero la app con `flutter run` en un destino compatible; usa el enlace DevTools que imprime Flutter o *Open DevTools* desde tu IDE y confirma que seleccionaste el proceso de esta app. Para Performance, reinicia con `flutter run --profile -d <ID_LOCAL>`; debug sirve para Inspector, no para inferir tiempos de distribución. Si no hay acceso, deja `PENDIENTE_DEVTOOLS` y concierta observación.
- **AVD no arranca:** revisa virtualización, RAM/espacio, SDK y el primer error de Device Manager; `flutter devices` debe listar el emulador antes de ejecutar `integration_test`. Sigue con host y marca `PENDIENTE_EMULADOR` si se requiere equipo del centro.
- **Gradle/build falla:** conserva el primer diagnóstico de `flutter doctor -v` o `flutter build apk --debug`; verifica Java 17, SDK/licencias autorizadas y espacio. No atribuyas a tu código un fallo de descarga.
- **APK no aparece/instala:** comprueba que el build terminó, ruta `build/app/outputs/flutter-apk/app-debug.apk`, ID de esta app, destino en `flutter devices` y primer error de instalación. Una firma incompatible puede ser de una instalación anterior **de esta app**; acuerda retirada segura. Nunca borres otra app ni datos ajenos.
- **Móvil no detectado:** cable de datos, autorización de depuración del propietario y `flutter devices`; sanea el serial al registrar. Sin móvil, conserva build y solicita turno: `PENDIENTE_DISPOSITIVO`.

## 4. Ticket breve para pedir ayuda

«Estoy en A04/K5, Flutter 3.47.2, Linux + VS Code, host. Ejecuté `flutter test test/retry_test.dart`; esperaba que `loading` fuese false tras error y obtuve true. El test compila, el primer fallo está en la aserción. He descartado import y no he cambiado el timeout. Guardé el comando, diff y salida saneada». Incluye solo lo necesario; nunca tokens, serial, rutas personales ni logs completos de otras apps.
