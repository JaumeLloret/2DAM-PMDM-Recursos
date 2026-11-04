# PM5 · Ejemplos guiados reproducibles

Estudia el proyecto **ejemplo** por separado y aplica después cada cambio a tu **starter**. Conserva una copia limpia de `lib/`. Cada ejemplo usa el mismo método:

**LOCALIZA → PREDICE → EJECUTA → OBSERVA → MODIFICA → VERIFICA → EXPLICA → CLASIFICA EVIDENCIA**

Los ejemplos no son quince entregas. Son pasos sobre el mismo cuaderno y proyecto. Empieza en DEMO; añade Android real cuando se indique y tengas el entorno.

## Archivos y pruebas disponibles

El ZIP incluye `Practica/Ejemplos/pm5_capacidades_guiadas/`. Su README relaciona cada ejemplo y kata con clases reales y `test/lecciones_test.dart`. `lecciones.dart` contiene `BleLesson`, `ScriptedBle`, `SensorLesson`, `processImage`, `MemoryDraftStore` y `DemoPlayer`; `android_lab.dart` muestra los plugins y el almacenamiento privado. El starter sigue siendo tu proyecto evaluable.


### Qué proyecto y archivo abres

Los nombres de archivo de la tabla parten de `lib/`. Ejecuta los comandos desde la carpeta que contiene el `pubspec.yaml` del **ejemplo**, salvo la modificación indicada expresamente en el starter. Los tests suministrados son ejemplos de comprobación; las katas no son quince aplicaciones nuevas.

| Actividades | Proyecto | Archivo y símbolo | Acción concreta | Filtro de test existente |
|---|---|---|---|---|
| E1–E2 / K1–K2 | starter | device_controller.dart y demo_fakes.dart | configura DemoPermissionPort.next; pulsa Pedir cámara en contexto | denegaciones ofrecen salidas diferentes |
| E3 / K3 | ejemplo | lecciones.dart · SensorLesson | inicia, suspende y repite inicio | sensor cancela al suspender |
| E4–E6 / K4–K5 | ejemplo | lecciones.dart · BleLesson y ScriptedBle | usa normal, timeout, disconnected y unavailable | BLE deduplica |
| E7–E8 / K6–K7 | ejemplo | lecciones.dart · SensorLesson | modifica traza y límite de presentación | sensor separa última muestra |
| E9–E12 / K8–K11 | ejemplo | lecciones.dart · processImage y MemoryDraftStore; android_lab.dart · pick/recoverLost | procesa el fixture; cambia una regla y después transfiérela al starter | PNG válido se recodifica |
| E13–E15 / K12–K15 | ejemplo | lecciones.dart · DemoPlayer; main.dart; android_lab.dart | prueba orden de audio, animación y una reparación ya elegida | play antes de load |

Por ejemplo, `flutter test --plain-name "BLE deduplica"` ejecuta el test cuyo nombre contiene ese texto. `flutter test` ejecuta todos. Para Android usa `lib/main_android.dart`; para DEMO web usa `lib/main.dart`.

## 1. E1 · pedir permiso cuando existe intención

- **Carril:** A · DEMO; B opcional para diálogo runtime.
- **LOCALIZA:** `requestCamera()` y el botón de cámara.
- **PREDICE:** cuántos permisos deberían aparecer al abrir la app: cero.
- **EJECUTA:** inicia la app sin pulsar ninguna feature.
- **OBSERVA:** estado «Listo» y ninguna solicitud.
- **MODIFICA:** mueve cualquier `request(camera)` que esté en arranque al callback del botón.
- **VERIFICA:** una solicitud solo tras pulsar; el resto de paneles sigue activo.
- **EXPLICA:** el sistema protege una captura y la persona entiende el motivo justo antes de decidir.
- **CLASIFICA:** `OBSERVADA_FAKE_TEST` con el puerto fake; `OBSERVADA_REAL` solo si observaste el diálogo Android.

## 2. E2 · denegación no destruye la app

- **Carril:** A primero.
- **LOCALIZA:** `DemoPermissionPort.next` y `requestCamera()`.
- **PREDICE:** resultado con `denied` y con `permanentlyDenied`.
- **EJECUTA:** configura cada estado por separado y pulsa cámara.
- **OBSERVA:** denied permite explicar/reintentar; permanentemente denegado ofrece Ajustes o fixture.
- **MODIFICA:** añade mensajes distintos sin desactivar sensor/BLE.
- **VERIFICA:** inicia sensor después de denegar cámara.
- **EXPLICA:** permiso y disponibilidad son estados distintos; una feature no gobierna a las demás.
- **CLASIFICA:** fake; en Android real anota el estado que realmente devolvió el SO.

## 3. E3 · quién crea, posee y cancela

- **Carril:** A.
- **LOCALIZA:** `_sensorSubscription`, `_scanSubscription`, `suspend()` y `dispose()`.
- **PREDICE:** qué eventos llegarían si `suspend()` no cancela.
- **EJECUTA:** inicia scan y sensor.
- **OBSERVA:** ambos recursos tienen una referencia propietaria en el controller.
- **MODIFICA:** implementa cancelación esperada en `suspend()` e impide duplicados.
- **VERIFICA:** tras suspender no llegan dispositivos/muestras; reiniciar crea una única suscripción.
- **EXPLICA:** quien guarda la suscripción puede cancelarla incluso tras error.
- **CLASIFICA:** fake; lifecycle físico queda pendiente hasta observar background/resume real.

## 4. E4 · scan BLE acotado

- **Carril:** A; B después.
- **LOCALIZA:** `BlePort.scan()` y `_scanSubscription`.
- **PREDICE:** qué ocurre al pulsar buscar dos veces o dejar scan indefinido.
- **EJECUTA:** recorre los dispositivos fake y registra su etiqueta segura.
- **OBSERVA:** el stream puede producir varios anuncios y repetir ids.
- **MODIFICA:** cancela el scan anterior, deduplica y añade una ventana de 8 s.
- **VERIFICA:** no existen dos scans simultáneos y `stopScan` deja estado estable.
- **EXPLICA:** scan escucha anuncios; no es una petición HTTP que devuelve una lista cerrada.
- **CLASIFICA:** fake; scan físico requiere API 31+, permiso, radio ready y periférico.

## 5. E5 · conectar antes de intercambiar

- **Carril:** A.
- **LOCALIZA:** `DemoBlePort.connected`, `connect` y `exchange`.
- **PREDICE:** salida de `exchange` antes y después de conectar.
- **EJECUTA:** prueba ambos órdenes con `DEMO-PING`.
- **OBSERVA:** antes falla `not_connected`; después llega una respuesta determinista.
- **MODIFICA:** representa `connecting/connected/exchanging/error` en un estado coherente.
- **VERIFICA:** detén scan antes de conectar y vuelve a `connected` tras el intercambio.
- **EXPLICA:** confirmación de write, read/notificación y respuesta de negocio son conceptos distintos.
- **CLASIFICA:** `OBSERVADA_FAKE_TEST`.

## 6. E6 · BLE apagado, timeout y desconexión

- **Carril:** A para errores deterministas; B para observación física.
- **LOCALIZA:** la traducción de fallos BLE del controller.
- **PREDICE:** estado final de no-ready, timeout y desconexión inesperada.
- **EJECUTA:** usa `ScriptedBle(BleCase.timeout)`, `disconnected` y `unavailable` en el ejemplo público.
- **OBSERVA:** `unavailable`, `timeout` y `disconnected` no son el mismo fallo.
- **MODIFICA:** añade mensaje/rescate: revisar radio/permisos, reintentar o volver a buscar.
- **VERIFICA:** cleanup se ejecuta y sensor/media siguen disponibles.
- **EXPLICA:** repetir un permiso no enciende la radio ni crea un periférico.
- **CLASIFICA:** fake; si reproduces el caso físico, registra solo la capacidad observada.

## 7. E7 · sensor rápido, UI más lenta

- **Carril:** A.
- **LOCALIZA:** `DemoSensorPort.samples()` y el listener.
- **PREDICE:** repintados si llegan muestras cada 100 ms y la UI acepta uno cada 120 ms.
- **EJECUTA:** cuenta muestras y notificaciones durante una traza corta.
- **OBSERVA:** el stream puede producir más datos que los repintados.
- **MODIFICA:** conserva la última muestra y aplica throttling de presentación.
- **VERIFICA:** la última muestra útil aparece y `dispose` cancela.
- **EXPLICA:** no estás haciendo análisis científico; controlas coste visual.
- **CLASIFICA:** fake; sensor físico se etiqueta aparte.

## 8. E8 · sensor ausente, error y final

- **Carril:** A.
- **LOCALIZA:** callbacks `onError` y `onDone`.
- **PREDICE:** diferencia entre error y final normal.
- **EJECUTA:** usa una traza muestra→muestra→error y otra que finaliza.
- **OBSERVA:** el error produce estado recuperable; el final no deja spinner/suscripción fantasma.
- **MODIFICA:** limpia la referencia y ofrece reintento.
- **VERIFICA:** una nueva activación crea una sola suscripción.
- **EXPLICA:** un stream es una secuencia con datos, error y final.
- **CLASIFICA:** `OBSERVADA_FAKE_TEST`.

## 9. E9 · selección cancelada y lost-data

- **Carril:** A; B para Android real.
- **LOCALIZA:** `AndroidLab.pick`, `recoverLost` y `_process`; después el `CapturePort` del starter.
- **PREDICE:** qué ocurre si la persona cancela o Android devuelve datos perdidos tras recrear la Activity.
- **EJECUTA:** simula `null` y un fixture `DEMO-RECOVERED`.
- **OBSERVA:** cancelar conserva el borrador anterior; recuperar reentra en el mismo pipeline.
- **MODIFICA:** añade `recoverLost()` y ejecútalo al iniciar/reanudar.
- **VERIFICA:** el medio recuperado también se valida, convierte y guarda.
- **EXPLICA:** `retrieveLostData()` resuelve una interrupción Android, no evita validar.
- **CLASIFICA:** fake; lost-data real solo si se observó la recreación/recuperación.

## 10. E10 · validar antes de decodificar

- **Carril:** A.
- **LOCALIZA:** entrada de bytes y MIME.
- **PREDICE:** resultados para PNG válido, más de 5 MiB, MIME no permitido y bytes corruptos.
- **EJECUTA:** usa `DEMO-PNG-01`, `DEMO-TOO-LARGE-01` y `DEMO-CORRUPT-01`.
- **OBSERVA:** tamaño/MIME se rechazan pronto; corrupto falla al decodificar.
- **MODIFICA:** traduce a `MediaValidationFailure` o `MediaDecodeFailure`.
- **VERIFICA:** UI no muestra ruta ni excepción cruda; el PNG válido continúa.
- **EXPLICA:** extensión y MIME son pistas; la decodificación confirma que hay una imagen interpretable.
- **CLASIFICA:** fake con bytes reales de fixture.

## 11. E11 · PNG a JPEG de verdad

- **Carril:** A.
- **LOCALIZA:** `DemoMediaPort.convert()`, que inicialmente devuelve la entrada.
- **PREDICE:** por qué renombrar a `.jpg` conservaría bytes PNG.
- **EJECUTA:** anota MIME, dimensiones y primeros bytes del fixture.
- **MODIFICA:** decode → resize ≤1024 → `encodeJpg(q85)`.
- **VERIFICA:** MIME `image/jpeg`, ancho ≤1024 y firma `FF D8`.
- **EXPLICA:** la conversión cambia la codificación, no solo el nombre.
- **CLASIFICA:** `OBSERVADA_FAKE_TEST`; aquí el procesamiento sí es real aunque la captura sea fixture.

## 12. E12 · almacenamiento privado y borrador local

- **Carril:** A y B.
- **LOCALIZA:** `MemoryDraftStore` del ejemplo, `_process` del adaptador Android y `StorePort`/`AttachmentDraft` del starter.
- **PREDICE:** qué datos necesita el borrador sin backend.
- **EJECUTA:** guarda original/derivada con nombres `DEMO-*`.
- **OBSERVA:** se devuelve una ruta controlada de app, no galería global.
- **MODIFICA:** crea borrador con id, ruta, MIME y tamaño; muestra «subida pendiente de PROD-01».
- **VERIFICA:** no aparece HTTP, token o cola de sincronización.
- **EXPLICA:** almacenamiento privado reduce exposición; no equivale a subir.
- **CLASIFICA:** fake/real según el store ejecutado; ruta entregada siempre saneada.

## 13. E13 · audio DEMO y error de orden

- **Carril:** A; B opcional.
- **LOCALIZA:** contrato `load/play/pause/dispose`.
- **PREDICE:** resultado de pulsar play antes de load.
- **EJECUTA:** provoca `not_loaded`; después load→play→pause.
- **OBSERVA:** `idle→loading→ready→playing→paused`.
- **MODIFICA:** representa fallo de carga y libera en lifecycle.
- **VERIFICA:** `dispose` puede llamarse con seguridad y no quedan eventos.
- **EXPLICA:** se reproduce un WAV sintético; no se solicita micrófono.
- **CLASIFICA:** fake para estados; real solo si se oyó/observó el player en Android.

## 14. E14 · animación que significa algo

- **Carril:** A.
- **LOCALIZA:** estado de player/sensor y `MediaQuery.disableAnimations`.
- **PREDICE:** escala en reposo, actividad y movimiento reducido.
- **EJECUTA:** activa reproducción o una muestra de movimiento.
- **OBSERVA:** el pulso sigue el estado.
- **MODIFICA:** desactiva/reduce transición cuando el sistema reduce movimiento.
- **VERIFICA:** al pausar o terminar, la animación se detiene.
- **EXPLICA:** se evalúa control por eventos, no decoración.
- **CLASIFICA:** `OBSERVADA_FAKE_TEST`.

## 15. E15 · cierre de lifecycle completo

- **Carril:** A antes de B.
- **LOCALIZA:** scan, conexión BLE, sensor, picker/recovery, player y animación.
- **PREDICE:** qué debe quedar activo después de `paused` y `dispose`.
- **EJECUTA:** inicia varios recursos y llama a `suspend()`.
- **OBSERVA:** scan/sensor/conexión se cancelan, player se pausa y no se reabre nada automáticamente.
- **MODIFICA:** corrige una fuga preparada o suscripción duplicada.
- **VERIFICA:** repite un caso normal y comprueba que `dispose` es seguro tras un fallo.
- **EXPLICA:** reanudar significa revalidar estado, no repetir acciones sensibles sin contexto.
- **CLASIFICA:** fake; repite en Android real cuando proceda y etiqueta solo lo observado.

## Cierre de los ejemplos

Puedes continuar al Gimnasio cuando hayas:

- ejecutado al menos un éxito y un error en permiso, BLE, sensor, media y player;
- demostrado una conversión JPEG real con tres comprobaciones;
- explicado propietario y cleanup de cada recurso;
- clasificado cada evidencia como FAKE, REAL o pendiente;
- conservado un único cuaderno, no quince entregas aisladas.

