# PM5 · Laboratorio integrado · AulaFlow Device & Media Companion

## Encargo

Completa el starter para preparar localmente una evidencia multimedia `DEMO-*`. La app mantiene dos composiciones:

- **CARRIL A · DEMO/FAKE:** permite terminar el producto y los errores de forma reproducible;
- **CARRIL B · ANDROID REAL/HARDWARE:** añade observación física cuando el entorno está disponible.

No es el contrato de AulaFlow 2.0. `AttachmentDraft` sigue siendo local y la interfaz debe indicar «subida pendiente de PROD-01».

## Antes de empezar

Debes tener:

- starter DEMO ejecutado;
- K1–K15 trabajadas antes de la entrega del cuaderno;
- la incidencia ya resuelta en el entrenamiento, que puedes referenciar;
- copia limpia de `lib/`;
- `flutter analyze`/`flutter test` iniciales;
- fixtures `DEMO-*`;
- carril y hardware disponible anotados.

Consulta la tabla E1–E15 del README del ejemplo público. Los contratos de ampliación están en `lib/media_contracts.dart` del starter. Las piezas ya se han practicado. Los 75 minutos sirven para integrarlas, no para aprenderlas desde cero.

## Arquitectura mínima

| Pieza | Responsabilidad |
|---|---|
| UI | muestra estado y recibe acciones |
| DeviceMediaController | coordina el caso y conserva el estado de cada capacidad |
| PermissionPort | petición contextual y resultado |
| BlePort | scan, conexión, intercambio y desconexión |
| SensorPort | secuencia de muestras y cancelación |
| CapturePort / ProcessorPort | selección/recuperación y conversión de bytes |
| StorePort | almacenamiento y borrador |
| PlayerPort | carga, reproducción, pausa y liberación |

Los plugins solo aparecen en adaptadores de plataforma. El modo se elige en la composición raíz, no con `if (demo)` dispersos.

## Hitos · 75 minutos

### H0 · baseline visible · 8 min

- **Objetivo:** empezar desde un estado reproducible.
- **Carril:** A.
- **Estado inicial:** starter copiado, dependencias resueltas.
- **Acción:** ejecuta test/analyze/app y recorre los cuatro botones DEMO.
- **Mínimo verificable:** app viva, scan/sensor/fixture responden.
- **Error preparado:** destino Flutter vacío o test inicial fallido.
- **Checkpoint:** registra comando, resultado y `OBSERVADA_FAKE_TEST`.
- **Rescate:** Preparación/Ayuda; no edites features mientras falle el baseline.

### H1 · permisos y lifecycle · 10 min

- **Objetivo:** solicitar en contexto y definir propietario/cleanup.
- **Carril:** A; B solo si Android está preparado.
- **Estado inicial:** cero solicitudes al abrir.
- **Acción:** conecta permiso de cámara/BLE a su botón; implementa `suspend`.
- **Mínimo verificable:** denied/permanentlyDenied tienen salida distinta; una denegación no rompe otras features.
- **Error preparado:** permiso bloqueado.
- **Checkpoint:** mapa crea→posee→cancela para scan, sensor y player.
- **Rescate:** fixture/DEMO; marca permiso/entorno pendiente sin bloquear el producto.
- **Evidencia:** FAKE o REAL según el diálogo realmente observado.

### H2 · BLE con estados honestos · 12 min

- **Objetivo:** integrar scan, stop, connect, exchange y desconexión.
- **Carril:** A obligatorio; B opcional con API31+/periférico.
- **Estado inicial:** idle y sin ids persistidos.
- **Acción:** limita/deduplica scan, detén antes de conectar y ejecuta `DEMO-PING`.
- **Mínimo verificable:** éxito, timeout/no-ready y desconexión recuperable.
- **Error preparado:** timeout o desconexión durante intercambio.
- **Checkpoint:** no quedan dos scans; GATT no se explica como HTTP.
- **Rescate:** vuelve a idle, libera conexión y usa fake.
- **Evidencia:** fake; real solo si scan/conexión/GATT se observaron con hardware.

### H3 · sensor y stream · 10 min

- **Objetivo:** mostrar última muestra sin repintar cada evento.
- **Carril:** A; B si existe sensor.
- **Estado inicial:** ninguna suscripción.
- **Acción:** escucha, limita UI a 120 ms, trata error/fin y cancela.
- **Mínimo verificable:** muestra visible, error recuperable y cero eventos tras suspend.
- **Error preparado:** sensor ausente/stream error.
- **Checkpoint:** iniciar dos veces no duplica suscripciones.
- **Rescate:** traza fake determinista.
- **Evidencia:** fake o real por separado.

### H4 · pipeline multimedia · 18 min

- **Objetivo:** obtener una derivada JPEG real y privada.
- **Carril:** A con fixture; B opcional con selector/cámara neutra.
- **Estado inicial:** `DEMO-PNG-01` y borrador vacío.
- **Acción:** seleccionar/recuperar → validar → decodificar → resize → JPEG → guardar → previsualizar.
- **Mínimo verificable:** MIME JPEG, ancho ≤1024, firma `FF D8`, nombre `DEMO-*` y `AttachmentDraft` local.
- **Error preparado:** cancelación, >5 MiB, MIME inválido o `DEMO-CORRUPT-01`.
- **Checkpoint:** el error no destruye el borrador válido anterior y no expone rutas.
- **Rescate:** vuelve a fixture válido y repite el mismo pipeline.
- **Evidencia:** procesamiento real de fixture = FAKE_TEST respecto a captura/hardware; no se etiqueta como cámara real.

### H5 · player y animación · 10 min

- **Objetivo:** integrar audio sintético y estado visual accesible.
- **Carril:** A; B opcional.
- **Estado inicial:** player idle.
- **Acción:** load→play→pause; anima por player/sensor y respeta reducción de movimiento.
- **Mínimo verificable:** error `not_loaded`, flujo correcto y dispose seguro.
- **Error preparado:** play antes de load o carga fallida.
- **Checkpoint:** no se pide micrófono; al suspender se pausa.
- **Rescate:** restablece player y conserva el fallo tipado.
- **Evidencia:** estados fake o reproducción real observada.

### H6 · robustez, registro y cierre · 7 min

- **Objetivo:** demostrar que el producto es explicable.
- **Carril:** ambos, sin mezclar estados.
- **Estado inicial:** hitos anteriores integrados.
- **Acción:** ejecuta un caso normal y tres errores; pasa checklist rápido.
- **Mínimo verificable:** analyze/tests reales, registro saneado, decisiones y límites.
- **Error preparado:** una regresión causada por integración.
- **Checkpoint:** corrige un único fallo o registra el bloqueo exacto; no inventes PASS.
- **Rescate:** vuelve al último hito verde.
- **Evidencia:** cada feature con su propio estado.

Total: `8 + 10 + 12 + 10 + 18 + 10 + 7 = 75 min`.

## Definition of Done de I2

- permisos solo desde su acción; estados y rescate visibles;
- scan limitado/cancelable, stop antes de conexión y desconexión observable;
- sensor con throttling, error/fin y cleanup;
- lost-data vuelve al mismo pipeline;
- tamaño/MIME/decode y conversión JPEG real comprobados;
- almacenamiento privado y borrador local, sin backend;
- player/animación controlados y liberados;
- `paused/resumed/dispose` coherentes;
- privacidad `DEMO-*` e ids/rutas saneados;
- evidencia FAKE/REAL correctamente etiquetada.

## Entrega I2

- código/diff respecto al starter;
- comandos/resultados de analyze y tests;
- `02_DECISIONES_PM5.md` con tres decisiones;
- `04_REGISTRO_EVIDENCIAS_PM5.md`;
- registro de una incidencia con regresión;
- demostración breve solo con fixtures/escena neutra;
- lista de observaciones físicas realizadas y pendientes;
- límite `PROD-01` visible.

## I3

La variante exacta permanece reservada. En fase 10, vía presencial o autónoma, dispones de 23 minutos sin agente para predecir y realizar un microcambio. Después ejecutas, compruebas una regresión y explicas capa, decisión y límite.

I3 demuestra comprensión individual. No convierte por sí sola una ejecución fake en evidencia de hardware físico.


