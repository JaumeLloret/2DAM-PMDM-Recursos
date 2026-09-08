# Contenidos autosuficientes · PM5

## 1. Capacidad no equivale a llamada de API

Una app móvil vive dentro de un sistema operativo que protege hardware, batería, privacidad y procesos. Por eso «abrir cámara» no es una operación aislada. Antes hay que saber si la plataforma ofrece la capacidad, si la app la declaró, si la persona la autoriza ahora y qué ocurre si la actividad pasa a segundo plano. La forma útil de modelarlo es un estado:

`noComprobada → disponibleSinPermiso → solicitando → lista | denegada | denegadaPermanente | restringida | noDisponible | error`

No todos los estados proceden del mismo sitio. El manifiesto declara capacidades potenciales; el permiso runtime expresa una decisión; Bluetooth puede estar apagado; un sensor puede no existir; una cámara puede ser ocupada por otra app. El ViewModel integra señales, pero no debe inventar certeza.

Un **puerto** es una interfaz propia que expresa lo que necesita la feature. Un **adaptador** traduce esa interfaz a un plugin concreto. Así los widgets dependen de conceptos del producto (`scan`, `connect`, `captureDemoImage`) y no de tipos de plataforma. Un fake implementa el mismo puerto con una secuencia determinista. Sirve para aprender, desarrollar y probar errores; no acredita hardware.

## 2. Permisos mínimos y oportunos

Android combina permisos declarados y runtime. Declarar un permiso no lo concede. Solicitarlo al arrancar, antes de que la persona entienda para qué se usa, empeora la comprensión y puede bloquear funciones independientes. La regla PM5 es **just in time**: se solicita cámara al elegir «capturar», Bluetooth al iniciar descubrimiento y nunca una batería de permisos global.

Estados relevantes:

- `granted`: la feature puede continuar, aunque aún debe comprobar capacidad/servicio;
- `denied`: la operación no continúa; se explica el beneficio y puede reintentarse;
- `permanentlyDenied`: repetir el diálogo no sirve; se ofrece abrir ajustes sin forzar;
- `restricted`: una política de sistema impide el acceso;
- `limited`: acceso parcial en plataformas que lo soportan;
- `unavailable`: no hay hardware o la plataforma no ofrece la capacidad.

En Android moderno, Bluetooth cercano usa `BLUETOOTH_SCAN` y `BLUETOOTH_CONNECT`. Para compatibilidad hasta Android 11, la biblioteca BLE recomienda ubicación con `maxSdkVersion="30"`. Si el escaneo no deriva ubicación, `BLUETOOTH_SCAN` lleva `neverForLocation`. PM5 no usa `MANAGE_EXTERNAL_STORAGE`, ubicación en background ni permisos de micrófono: no son necesarios para la práctica.

Un permiso denegado solo desactiva su feature. Denegar cámara no debe apagar el panel de sensores. La UI debe responder con texto y acción: «Cámara denegada; puedes seleccionar un fixture» es mejor que un icono rojo sin salida.

## 3. Lifecycle y propiedad del recurso

`WidgetsBindingObserver` notifica transiciones como `resumed`, `inactive`, `paused` y `detached`. El controlador de la feature decide qué pausar o liberar. Al entrar en `paused` se cancelan escaneo y sensor, se pausa audio y se conserva solo estado serializable. Al volver a `resumed` no se reabre cámara ni se reconecta BLE sin contexto: se revalida y se ofrece reanudar.

Toda suscripción tiene propietario. Si un controlador crea un `StreamSubscription`, el mismo controlador debe cancelarla en `stop`, `suspend` o `dispose`. Guardar la suscripción permite impedir duplicados y limpiar aunque llegue un error. `cancel()` es asíncrono; una transición robusta espera su finalización cuando afecta al siguiente estado.

Los síntomas de fuga son concretos: eventos duplicados después de entrar/salir, logs tras cerrar pantalla, consumo continuo y excepciones sobre un objeto disposed. La solución no es ocultar el error con `mounted`; hay que corregir la propiedad del recurso.

## 4. BLE como protocolo de estados

Bluetooth Low Energy se organiza en periféricos, servicios y características GATT. El móvil central escanea anuncios, elige un dispositivo, conecta y lee/escribe una característica. BLE no es HTTP: escribir con confirmación indica que la pila recibió la escritura, no que exista una respuesta de negocio. Si se necesita petición–respuesta, el protocolo debe definirla sobre una característica de control/notificación.

Secuencia mínima PM5:

1. comprobar estado BLE y permiso;
2. escanear con tiempo limitado y filtro de servicio cuando exista;
3. mostrar nombre seguro y un id redactado en la UI/log;
4. conectar con timeout;
5. crear una `QualifiedCharacteristic` con UUID docente configurable;
6. escribir `DEMO-PING` y leer/recibir una respuesta mínima;
7. representar conexión, desconexión y error;
8. cancelar scan/conexión al terminar.

No se versiona una MAC. Los UUID `DEMO` de la solución describen el protocolo de aula, no identifican un dispositivo personal. El adaptador recibe configuración para que la prepublicación pueda sustituirlos.

Estados útiles: `idle`, `scanning`, `deviceFound`, `connecting`, `connected`, `exchanging`, `disconnected`, `timeout`, `unavailable`, `error`. Evita booleanos independientes como `isLoading`, `isConnected`, `hasError`: permiten combinaciones imposibles. Una transición nueva debe decidir qué pasa con la suscripción anterior.

## 5. Sensores y streams

Un acelerómetro produce muestras, no «una inclinación perfecta». `AccelerometerEvent` incluye gravedad; `UserAccelerometerEvent` intenta retirarla y describe aceleración debida al movimiento. PM5 usa este último para un indicador de movimiento. Cada muestra tiene ejes y tiempo lógico.

El hardware puede emitir decenas o cientos de eventos por segundo. Reconstruir toda la UI en cada evento desperdicia trabajo. Se puede pedir un periodo de muestreo razonable y, además, aplicar throttling de presentación: conservar la última muestra y notificar como máximo cada 100–200 ms. No se presenta como tratamiento científico; es una decisión de UI y recursos.

Errores a manejar: stream no soportado, permiso/política, excepción de plataforma y final inesperado. El fake debe poder emitir muestra → error → fin para ensayar estas rutas. Al pasar a background se cancela; al volver se espera acción explícita o política documentada.

## 6. Pipeline multimedia

El pipeline de la unidad es deliberadamente pequeño pero completo:

`capturar/seleccionar → validar metadatos y bytes → decodificar → transformar → codificar → almacenar → presentar → depurar`

### Captura y selección

`image_picker` devuelve un `XFile`. La cámara requiere contexto y permiso; la galería moderna puede funcionar mediante selector del sistema. Android puede destruir la actividad mientras otro intent está abierto, por lo que el adaptador contempla `retrieveLostData()`. La app no asume que una ruta temporal durará: lee bytes y copia el resultado aceptado a un directorio propio.

### Validación

La extensión es una pista, no una garantía. Se limita tamaño (5 MiB en el caso ordinario), tipos admitidos (`image/png`, `image/jpeg`) y se intenta decodificar. Si el decodificador devuelve `null`, el medio es corrupto o no soportado. Solo después se procesa.

### Procesamiento y conversión real

Procesar significa cambiar contenido. La solución reduce ancho máximo a 1024 px manteniendo proporción y codifica JPEG con calidad 85. Si el origen era PNG, cambia realmente el formato; si era JPEG, al menos cambia dimensiones/compresión. Renombrar `.png` a `.jpg` sin decodificar/codificar es falso y suele crear archivos incompatibles.

El procesamiento se hace sobre bytes, conserva el original en memoria solo lo necesario y devuelve metadatos: ancho, alto, bytes, MIME y operación. Para imágenes grandes, una ampliación movería trabajo a isolate; no es núcleo.

### Almacenamiento controlado

`path_provider` obtiene un directorio privado de documentos. La app genera nombres `DEMO-<timestamp>-original.bin` y `DEMO-<timestamp>-thumb.jpg`, sanea entradas y no usa almacenamiento compartido global. El original puede conservarse para comparar o eliminarse según política explícita. PM5 no diseña bases de datos ni sincronización.

## 7. Presentación y reproducción

Una imagen procesada se previsualiza desde bytes o archivo. RA3.g exige además uso de clases de reproducción. La solución genera un WAV sintético `DEMO-TONE.wav` y lo reproduce con un puerto de audio. El adaptador controla `load`, `play`, `pause`, stream de estado, error y `dispose`. No hay descarga de red ni micrófono.

Los estados de player pueden simplificarse a `idle`, `loading`, `ready`, `playing`, `paused`, `completed`, `error`. Pulsar play antes de load no debe provocar crash: genera un fallo recuperable o carga explícita. Al pausar lifecycle se pausa; en dispose se liberan decodificador y streams.

## 8. Eventos, excepciones y tipos de media

No todo fallo es igual. La capa de dominio usa fallos tipados:

- `PermissionFailure`: denegado o permanente;
- `CapabilityUnavailable`: hardware/servicio ausente;
- `WirelessFailure`: scan, conexión, timeout o GATT;
- `MediaValidationFailure`: tipo/tamaño;
- `MediaDecodeFailure`: bytes corruptos;
- `MediaStoreFailure`: copia/escritura;
- `PlaybackFailure`: carga/decodificación/reproducción.

El adaptador captura excepciones del plugin y las traduce sin filtrar rutas o IDs en mensajes de UI. El controlador decide qué estado mostrar y qué reintento es válido. Un `catch (_) {}` silencioso pierde evidencia de depuración; un `catch (e) { print(e); }` puede filtrar datos. Se registra categoría, operación y código saneado.

## 9. Animación con intención

Una animación demuestra estado si su inicio, parada y reversión responden a eventos. La solución usa un pulso controlado cuando existe actividad de sensor o reproducción. Puede implementarse con `AnimatedContainer`/`AnimatedScale` o con `AnimationController` cuando se necesita control fino. Debe respetar `MediaQuery.disableAnimations`: si la persona reduce movimiento, se usa transición inmediata o discreta.

Una animación infinita que sigue en background es una fuga. `TickerProvider`, controller y suscripción también tienen lifecycle. No se evalúa diseño gráfico; se evalúa creación/control coherente.

## 10. Depuración y documentación multimedia

Un registro útil permite reproducir sin exponer datos:

| Campo | Ejemplo seguro |
|---|---|
| operación | `media.convert` |
| estado | `failed` |
| código | `unsupported_format` |
| fixture | `DEMO-CORRUPT-01` |
| entorno | `fake` / `android-real` |
| evidencia | `OBSERVADA_FAKE_TEST` |

Para un fallo real, anota pasos, esperado, observado, versión, lifecycle y recuperación. Redacta rutas e IDs. Un screenshot sin pasos no basta; un log con MAC tampoco es aceptable.

## 11. Qué puede certificar cada entorno

| Afirmación | CI/fake | Android físico/periférico |
|---|---:|---:|
| interfaces y transiciones | sí | sí |
| error determinista y cleanup | sí | sí |
| conversión real de fixture | sí | sí |
| APK y manifiesto | sí | sí |
| diálogo de permiso runtime | no | sí |
| lectura de acelerómetro físico | no | sí |
| scan/conexión/GATT BLE | no | sí |
| cámara/lost-data/lifecycle real | no | sí |

La columna «sí» de CI no transforma una simulación en evidencia física. El registro debe conservar esa diferencia.

## 12. Seam AulaFlow

El producto genera `AttachmentDraft(id, localPath, mimeType, size)`. Ese objeto podría asociarse a una evidencia cuando `PROD-01` ofrezca backend. PM5 no define endpoint, token, cola offline ni servidor. El botón «preparar adjunto» guarda solo un borrador local `DEMO-*` y muestra «subida pendiente de backend».


