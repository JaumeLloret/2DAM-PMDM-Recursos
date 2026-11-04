# Contenidos autosuficientes · PM5

## Cómo estudiar este recurso

Imagina que adjuntas una fotografía de prueba a una tarea desde el móvil. Puedes denegar cámara, cancelar el selector o recibir una llamada. La app debe conservar lo que ya estaba bien y ofrecer un siguiente paso. Ese es el problema que vamos a resolver con Flutter.

El resultado de PM5 tiene cuatro paneles: permiso/BLE, movimiento, imagen y audio. Primero estudias piezas pequeñas en el **ejemplo guiado**; después las integras en tu **starter**, el proyecto que entregarás. La demostración funciona desde casa en Chrome; Android añade la observación de las capacidades físicas disponibles.

| Palabra | Qué significa aquí | Ejemplo |
|---|---|---|
| capacidad | función que el dispositivo puede ofrecer | cámara, acelerómetro o Bluetooth |
| permiso | autorización de la persona para una operación | permitir capturar una foto |
| plugin | paquete que comunica Dart con la plataforma | image_picker |
| puerto | interfaz Dart que define lo que necesita tu app | SensorPort.samples() |
| adaptador | implementación de ese puerto para un entorno | plugin Android o simulación |
| fake | implementación controlada que simula respuestas | un periférico DEMO repetible |
| fixture | dato fijo preparado para practicar | una imagen PNG válida |
| stream | secuencia de eventos que llegan con el tiempo | muestras x, y, z del sensor |
| lifecycle | cambios de actividad y visibilidad de la app | pasar a segundo plano |
| cleanup | cancelar y liberar los recursos propios | detener una suscripción |

**Cómo avanzar:** estudia solo el capítulo indicado por la ruta, ejecuta su ejemplo y completa sus katas. No leas los trece capítulos antes de tocar código. Los fragmentos de este libro explican una idea: el código completo y ejecutable está en `Practica/Ejemplos/pm5_capacidades_guiadas/`. Las modificaciones evaluables se aplican a `Practica/Starter/aulaflow_device_media_starter/`.

| Bloque | Lee | Practica después | Resultado visible |
|---|---|---|---|
| permisos y ciclo de vida | 1–3 | E1–E3; K1–K3 | denegar cámara permite seguir usando sensor |
| Bluetooth | 4 | E4–E6; K4–K5 | descubrir, conectar, intercambiar y terminar |
| sensores | 5 | E7–E8; K6–K7 | muestras sin duplicados ni actividad tras parar |
| imagen | 6 | E9–E12; K8–K11 | PNG 1280×720 convertido a JPEG 1024×576 |
| audio, animación y depuración | 7–10 | E13–E15; K12–K15 | estados, pausa, error y corrección explicados |
| cierre | 11–12 | integración y entrega | borrador local y límites claros |

Una ejecución **DEMO/FAKE** demuestra la lógica. **ANDROID REAL/HARDWARE** permite observar una capacidad física concreta. Anota esa diferencia una vez en el registro; no redactes una explicación idéntica en cada página.

## 1. Capacidad no equivale a llamada de API

Una app móvil vive dentro de un sistema operativo que protege hardware, batería, privacidad y procesos. Por eso «abrir cámara» no es una operación aislada. Antes hay que saber si la plataforma ofrece la capacidad, si la app la declaró, si la persona la autoriza ahora y qué ocurre si la actividad pasa a segundo plano. La forma útil de modelarlo es un estado:

`noComprobada → disponibleSinPermiso → solicitando → lista | denegada | denegadaPermanente | restringida | noDisponible | error`

No todos los estados proceden del mismo sitio. El manifiesto declara capacidades potenciales; el permiso runtime expresa una decisión; Bluetooth puede estar apagado; un sensor puede no existir; una cámara puede ser ocupada por otra app. El ViewModel integra señales, pero no debe inventar certeza.

Un **puerto** es una interfaz propia que expresa lo que necesita la feature. Un **adaptador** traduce esa interfaz a un plugin concreto. Así los widgets dependen de conceptos del producto (`scan`, `connect`, `captureDemoImage`) y no de tipos de plataforma. Un fake implementa el mismo puerto con una secuencia determinista. Sirve para aprender, desarrollar y probar errores; no acredita hardware.

### Un botón, tres responsabilidades

El widget recibe la pulsación; el controlador decide qué operación tiene sentido; el adaptador habla con el plugin. Si cambias el fake por Android, los widgets conservan la misma intención. No necesitas crear una capa por cada línea: agrupa lo que tiene la misma responsabilidad.

En el starter sigue `main.dart → DeviceController.requestCamera() → PermissionPort.request()`. Abre los tres archivos y localiza esa llamada. `await` espera la respuesta sin bloquear el hilo de interfaz; no convierte una operación en instantánea ni impide una segunda pulsación.

**Comprobación:** explica qué archivo modificarías para cambiar el texto del botón, la política ante denegación y el plugin de cámara. Son tres cambios diferentes.

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

### Flujo que debes poder narrar

| Paso | Pregunta | Ejemplo cámara |
|---|---|---|
| Problema | ¿qué protege el SO? | una captura puede exponer el entorno |
| Motivo | ¿por qué lo necesita esta acción? | la persona ha pulsado «Capturar DEMO-OBJECT» |
| Momento | ¿cuándo se solicita? | justo después de esa intención, no al abrir |
| Estado | ¿qué devuelve el permiso? | granted, denied, permanentlyDenied, restricted o limited |
| Acción | ¿qué puede decidir la persona? | continuar, cancelar, abrir Ajustes o usar fixture |
| Resultado | ¿qué cambia en la app? | solo cámara; sensor y BLE siguen disponibles |
| Rescate | ¿cómo se puede continuar? | selección/fixture DEMO o reintento razonado |

`unavailable` pertenece a la **capacidad**: hardware o servicio ausente/no listo. No es una nueva forma de `denied`. Mantener esa separación evita pedir el mismo permiso en bucle cuando el problema real es, por ejemplo, Bluetooth apagado.

### Parada 1 · permiso y feature independiente

- **Predice:** cuántos diálogos aparecen al abrir la app.
- **Ejecuta:** arranca en DEMO y después solicita cámara desde el botón.
- **Observa:** cero peticiones al inicio; una decisión contextual.
- **Rescata:** deniega cámara y comprueba que sensor/BLE pueden continuar.
- **Clasifica:** fake en DEMO; real solo si viste el diálogo runtime en Android.

### Código explicado: declaración y petición son distintas

Este fragmento pertenece al manifiesto Android, no a un archivo Dart:

```xml
<uses-permission android:name="android.permission.CAMERA" />
```

La petición se realiza desde el adaptador al pulsar el botón:

```dart
final result = await ph.Permission.camera.request();
if (!result.isGranted) {
  message = 'Cámara no autorizada; puedes seleccionar un archivo DEMO.';
  return;
}
```

Localízalo en `lib/android_lab.dart`, método `pick`, del ejemplo. La declaración habilita solicitar; la respuesta decide si continúa **esta captura**. Cancelar o denegar no borra una imagen anterior. `limited` y `restricted` son estados que pueden existir en otras plataformas: no se exige provocarlos en un Android que no los ofrece.

En Android 12+, consultar ciertas propiedades Bluetooth también requiere CONNECT. Por eso el adaptador solicita SCAN y CONNECT desde Buscar antes de consultar la radio. Esto explica por qué no basta con trasladar todos los permisos al botón Conectar.

**Ejercicio existente:** E2/K2. Cambia el fake a denegación permanente, explica el mensaje y arranca el sensor sin volver a abrir la app.

## 3. Lifecycle y propiedad del recurso

`WidgetsBindingObserver` notifica transiciones como `resumed`, `inactive`, `hidden`, `paused` y `detached`. El controlador de la feature decide qué pausar o liberar. Al entrar en `paused` se cancelan escaneo y sensor, se pausa audio y se conserva solo estado serializable. Al volver a `resumed` no se reabre cámara ni se reconecta BLE sin contexto: se revalida y se ofrece reanudar.

Toda suscripción tiene propietario. Si un controlador crea un `StreamSubscription`, el mismo controlador debe cancelarla en `stop`, `suspend` o `dispose`. Guardar la suscripción permite impedir duplicados y limpiar aunque llegue un error. `cancel()` es asíncrono; una transición robusta espera su finalización cuando afecta al siguiente estado.

Los síntomas de fuga son concretos: eventos duplicados después de entrar/salir, logs tras cerrar pantalla, consumo continuo y excepciones sobre un objeto disposed. La solución no es ocultar el error con `mounted`; hay que corregir la propiedad del recurso.

| Recurso | Quién lo crea/posee | `paused/inactive` | `resumed` | `dispose` |
|---|---|---|---|---|
| scan BLE | controller/adaptador | cancelar scan | revalidar antes de reiniciar | cancelar y cerrar stream |
| conexión BLE | adaptador BLE | desconectar | no reconectar sin contexto | desconectar y liberar |
| sensor stream | controller | cancelar suscripción | esperar acción/política explícita | cancelar |
| picker/cámara | adaptador de captura | no duplicar intents | ejecutar recuperación lost-data | descartar referencias |
| player | adaptador de audio | pausar | revalidar estado | liberar player/streams |
| animación | widget/controller | detener actividad innecesaria | reflejar el estado actual | liberar ticker/controller |

Referencia: [estados de ciclo de vida de Flutter](https://api.flutter.dev/flutter/dart-ui/AppLifecycleState.html).

### Parada 2 · propiedad visible

Dibuja una flecha `crea → posee → cancela` para scan, sensor y player. Si no puedes nombrar al propietario, todavía no conectes el plugin real.

### Código explicado: cancelar antes de reemplazar

Fragmento de `SensorLesson.stop()` en `lib/lecciones.dart` del ejemplo:

```dart
final old = _subscription;
_subscription = null;
await old?.cancel();
```

Primero retiras tu referencia para que otra acción no reutilice un recurso que estás cerrando. Después esperas su cancelación. `?.` permite que detener dos veces sea seguro. Como `dispose()` no devuelve un Future, la liberación asíncrona se inicia con `unawaited`; eso no elimina la obligación de gestionar errores y detener eventos.

`inactive` puede aparecer al abrir un diálogo o selector: no significa que Android haya destruido la app. La política pequeña del ejemplo pausa sensor/BLE/audio al perder actividad y deja que la captura pendiente termine o se recupere. `hidden` describe que ya no es visible. Tampoco se garantiza recibir una última notificación antes de que el sistema mate el proceso: guardar trabajo no debe depender solo de `dispose()`.

**Visión profesional:** dos pulsaciones pueden entrelazarse en un `await`. El ejemplo usa una revisión de operación en `SensorLesson`: si se ha suspendido o cerrado mientras esperaba, la operación antigua no crea una suscripción nueva. Lee los tests de inicio pendiente y suspensión; aplícalo a K3/K7, dentro de los ejercicios existentes.

## 4. BLE como protocolo de estados

Bluetooth Low Energy se organiza en periféricos, servicios y características GATT. El móvil central escanea anuncios, elige un dispositivo, conecta y lee/escribe una característica. BLE no es HTTP: escribir con confirmación indica que la pila recibió la escritura, no que exista una respuesta de negocio. Si se necesita petición–respuesta, el protocolo debe definirla sobre una característica de control/notificación.

Secuencia mínima PM5:

1. solicitar los permisos necesarios desde la acción de buscar; después consultar el estado BLE;
2. escanear con tiempo limitado y filtro de servicio cuando exista;
3. mostrar nombre seguro y un id redactado en la UI/log;
4. conectar con timeout;
5. crear una `QualifiedCharacteristic` con UUID docente configurable;
6. escribir `DEMO-PING` y leer/recibir una respuesta mínima;
7. representar conexión, desconexión y error;
8. cancelar scan/conexión al terminar.

No se versiona una MAC. Los UUID `DEMO` de la solución describen el protocolo de aula, no identifican un dispositivo personal. El adaptador recibe configuración para que la prepublicación pueda sustituirlos.

Estados útiles: `idle`, `scanning`, `deviceFound`, `connecting`, `connected`, `exchanging`, `disconnected`, `timeout`, `unavailable`, `error`. Evita booleanos independientes como `isLoading`, `isConnected`, `hasError`: permiten combinaciones imposibles. Una transición nueva debe decidir qué pasa con la suscripción anterior.

BLE no es HTTP. Un anuncio no es una respuesta, scan no «descarga una lista cerrada», GATT no aporta por sí solo petición–respuesta de negocio y una escritura confirmada no equivale a recibir `DEMO-PONG`. El protocolo del periférico decide servicio, característica, read/write/notificación, framing y timeout.

### Parada 3 · misma lógica, distinta evidencia

- **DEMO:** recorre scan → connect → exchange → disconnect con `FakeBlePort`; provoca timeout y desconexión.
- **REAL:** antes de scan comprueba Android API 31+, permiso, radio, periférico y `BleStatus.ready`.
- **Cierre:** registra `OBSERVADA_FAKE_TEST` o `OBSERVADA_REAL`. Si falta periférico, `PENDIENTE_HARDWARE`.

Referencia: [permisos Bluetooth de Android](https://developer.android.com/develop/connectivity/bluetooth/bt-permissions).

### Un intercambio concreto

| Elemento | Analogía útil | En la práctica |
|---|---|---|
| central | quien busca y conecta | tu móvil |
| periférico | quien anuncia una capacidad | equipo BLE del aula |
| anuncio | aviso breve de presencia | aparece durante scan |
| servicio | grupo de funciones | protocolo configurado por el docente |
| característica | dato u operación concreta | escritura PING y lectura de respuesta |

El nombre visible no es una identidad fiable. Se deduplica internamente por identificador y se muestra una etiqueta segura. Una lista vacía al agotarse los 8 segundos es un resultado posible, no un fallo de formato.

En `BleLesson.ping()` observa el `try/finally`: aunque el intercambio falle, `finally` desconecta. `Future.timeout` limita la espera del cliente, pero no cancela por sí solo el trabajo subyacente; la cancelación de las suscripciones sigue siendo necesaria.

Para Android el docente debe proporcionar **servicio, característica, operaciones admitidas y respuesta esperada**. Un UUID de servicio describe el protocolo; no es una contraseña ni una MAC personal. Si faltan esos datos, conserva el caso fake y solicita la configuración, sin escanear dispositivos ajenos.

**Ejercicio existente:** E6/K5. Compara `BleCase.timeout` y `BleCase.disconnected`, y comprueba que ambos liberan la conexión.

## 5. Sensores y streams

Un acelerómetro produce muestras, no «una inclinación perfecta». `AccelerometerEvent` incluye gravedad; `UserAccelerometerEvent` intenta retirarla y describe aceleración debida al movimiento. PM5 usa este último para un indicador de movimiento. Cada muestra tiene ejes y tiempo lógico.

El hardware puede emitir decenas o cientos de eventos por segundo. Reconstruir toda la UI en cada evento desperdicia trabajo. Se puede pedir un periodo de muestreo razonable y, además, aplicar throttling de presentación: conservar la última muestra y notificar como máximo cada 100–200 ms. No se presenta como tratamiento científico; es una decisión de UI y recursos.

Errores a manejar: stream no soportado, permiso/política, excepción de plataforma y final inesperado. El fake debe poder emitir muestra → error → fin para ensayar estas rutas. Al pasar a background se cancela; al volver se espera acción explícita o política documentada.

### Parada 4 · el stream también termina

Predice cuántas veces debería repintarse la UI con muestras a 100 ms y límite visual de 120 ms. Ejecuta éxito y error con fake, observa `onError/onDone`, cancela y comprueba que no aparecen nuevas muestras. El sensor físico se clasifica aparte.

### Muestras y repintados con números

El adaptador solicita muestras cada 30 ms: aproximadamente 33 por segundo, sin garantizar esa frecuencia exacta. La interfaz presenta como máximo una actualización cada 120 ms. No es debounce: si no paras de mover el móvil, sigue actualizando periódicamente.

| Tiempo de muestra | Valor x | Última muestra | Valor mostrado |
|---|---:|---:|---:|
| 0 ms | 1 | 1 | 1 |
| 50 ms | 2 | 2 | 1 |
| 130 ms | 3 | 3 | 3 |

La muestra de 50 ms se conserva, aunque no dispara un repintado. Al finalizar una traza se muestra la última muestra pendiente. Un `listen` necesita decidir qué hacer con datos, error y final; no basta con el callback de datos.

Abre `SensorLesson.start()` y ejecuta desde la carpeta del ejemplo:

```bash
flutter test --plain-name 'sensor separa última muestra'
```

**Ejercicio existente:** K7. Cambia el límite visual, modifica la expectativa temporal y explica la diferencia. Una medición de UI no calibra un instrumento ni convierte aceleración en inclinación exacta.

## 6. Pipeline multimedia

El pipeline de la unidad es deliberadamente pequeño pero completo:

`capturar/seleccionar → validar metadatos y bytes → decodificar → transformar → codificar → almacenar → presentar → depurar`

Cada flecha es una decisión comprobable. Si saltas decodificación/codificación y solo cambias el nombre, no has convertido el formato.

### Captura y selección

`image_picker` devuelve un `XFile`. La cámara requiere contexto y permiso; la galería moderna puede funcionar mediante selector del sistema. Android puede destruir la actividad mientras otro intent está abierto, por lo que el adaptador contempla `retrieveLostData()`. La app no asume que una ruta temporal durará: lee bytes y copia el resultado aceptado a un directorio propio.

### Validación

La extensión es una pista, no una garantía. Se limita tamaño (5 MiB en el caso ordinario), tipos admitidos (`image/png`, `image/jpeg`) y se intenta decodificar. Si el decodificador devuelve `null`, el medio es corrupto o no soportado. Solo después se procesa.

### Procesamiento y conversión real

Procesar significa cambiar contenido. La solución reduce ancho máximo a 1024 px manteniendo proporción y codifica JPEG con calidad 85. Si el origen era PNG, cambia realmente el formato; si era JPEG, al menos cambia dimensiones/compresión. Renombrar `.png` a `.jpg` sin decodificar/codificar es falso y suele crear archivos incompatibles.

El procesamiento se hace sobre bytes, conserva el original en memoria solo lo necesario y devuelve metadatos: ancho, alto, bytes, MIME y operación. Para imágenes grandes, una ampliación movería trabajo a isolate; no es núcleo.

### Almacenamiento controlado

`path_provider` obtiene un directorio privado de documentos. La app genera nombres `DEMO-<timestamp>-original.bin` y `DEMO-<timestamp>-thumb.jpg`, sanea entradas y no usa almacenamiento compartido global. El original puede conservarse para comparar o eliminarse según política explícita. PM5 no diseña bases de datos ni sincronización.

### Parada 5 · demostrar una conversión real

1. selecciona `DEMO-PNG-01`;
2. comprueba MIME/tamaño antes de procesar;
3. decodifica y anota dimensiones;
4. redimensiona a un máximo de 1024 px;
5. codifica JPEG;
6. verifica MIME, dimensiones y bytes iniciales `FF D8`;
7. guarda en espacio privado y registra una ruta saneada;
8. repite con `DEMO-CORRUPT-01` y conserva el fallo tipado.

`retrieveLostData()` no es una segunda tubería: el medio recuperado vuelve a **validar → decodificar → transformar → codificar → guardar**. Un fake demuestra esta decisión; destruir/recuperar una Activity real queda como observación física.

Referencia: [image_picker 1.2.3 y recuperación de datos](https://pub.dev/packages/image_picker/versions/1.2.3).

### Ejemplo resuelto: qué cambia y qué se conserva

Con el fixture PNG 1280×720 y el máximo de 1024, la escala es `1024 / 1280 = 0,8`: la salida mide **1024×576**. Se conserva proporción; el contenido se recodifica con pérdida a JPEG, calidad 85. Esa cifra no significa «85 % del tamaño»: los bytes finales dependen de la imagen.

Fragmento explicativo de `processImage`, en `lib/lecciones.dart`:

```dart
final resized = decoded.width > maxWidth
    ? img.copyResize(decoded, width: maxWidth)
    : decoded;
final result = img.encodeJpg(resized, quality: 85);
```

`decoded` ya es una imagen validada por el decodificador. Un PNG con transparencia pierde ese canal al convertir a JPEG: en una aplicación de producción elegirías un fondo explícito o mantendrías PNG. Cambiar el MIME declarado tampoco demuestra conversión. La prueba decodifica el JPEG de salida y comprueba sus dimensiones además de FF D8.

**Cancelación no es error:** si el selector devuelve `null`, mantén el borrador anterior. **Fallo de escritura no es éxito:** actualiza el borrador y la previsualización solo después de guardar. Un archivo temporal del picker puede desaparecer; una copia aceptada en documentos de la app tiene otro ciclo de vida. Al desinstalar la app pueden perderse también esos documentos.

**Límite profesional:** 5 MiB comprimidos no limitan los píxeles decodificados. El laboratorio usa fixtures acotados; antes de aceptar archivos arbitrarios en producción habría que limitar dimensiones/memoria, revisar orientación y metadatos y estudiar un isolate. Esa ampliación no se añade como requisito del producto de 12 horas.

**Ejercicio existente:** E11/K10. Cambia el ancho a 640; predice 640×360 y comprueba los bytes reales. Vuelve a 1024 para el producto ordinario.

## 7. Presentación y reproducción

Una imagen procesada se previsualiza desde bytes o archivo. RA3.g exige además uso de clases de reproducción. La solución genera un WAV sintético `DEMO-TONE.wav` y lo reproduce con un puerto de audio. El adaptador controla `load`, `play`, `pause`, stream de estado, error y `dispose`. No hay descarga de red ni micrófono.

Los estados de player pueden simplificarse a `idle`, `loading`, `ready`, `playing`, `paused`, `completed`, `error`. Pulsar play antes de load no debe provocar crash: genera un fallo recuperable o carga explícita. Al pausar lifecycle se pausa; en dispose se liberan decodificador y streams.

### Parada 6 · audio sin micrófono

El tono `DEMO-TONE.wav` se genera localmente. Predice el estado de `play` antes de `load`, ejecuta load→play→pause, provoca un fallo de carga preparado y termina con `dispose`. Esta actividad no solicita micrófono ni graba a nadie.

Referencia: [just_audio 0.10.6](https://pub.dev/packages/just_audio/versions/0.10.6).

### Reproducir y esperar no significan lo mismo

En `AndroidLab.loadAudio()` se genera un WAV y se espera `setFilePath` antes de marcarlo como cargado. `play()` solicita empezar; el Future de `just_audio.play()` finaliza al terminar o interrumpirse la reproducción, no justo cuando comienza a sonar. No mantengas la interfaz bloqueada esperando que termine todo el audio para permitir Pausa. En `playAudio()` el ejemplo inicia ese Future con gestión explícita del error.

El reproductor distingue estar reproduciendo de estar cargando/procesando. El mensaje «reproducción solicitada» no prueba que se haya oído un tono. En Chrome el ejemplo solo enseña estados; el punto de entrada Android utiliza el player real.

**Ejercicio existente:** E13/K13. Play antes de Load debe producir `not_loaded`; Load → Play → Pause debe permitir continuar. Si falta audio físico, conserva la prueba de estados y registra esa observación como pendiente.

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

### Una interfaz que permite recuperarse

| Situación | Mensaje y acción útil | Dato técnico interno |
|---|---|---|
| selección cancelada | conserva la imagen anterior | operación cancelada |
| bytes corruptos | «No se puede leer esta imagen; elige otra» | decode_failed |
| permiso bloqueado | ofrece Ajustes o fixture | permanentlyDenied |
| desconexión BLE | informa y permite volver a buscar | disconnected |

No uses el mismo booleano de error para toda la app. Conserva datos válidos mientras falla otra acción. Evita reintentos automáticos infinitos y diálogos superpuestos: después de dos pulsaciones rápidas debe seguir existiendo una única operación de esa capacidad.

`LessonFailure` es el tipo pequeño del ejemplo; los puertos del producto pueden usar sus tipos de dominio. Traduce entre ellos al integrar. No copies un nombre de excepción de este libro si todavía no has declarado esa clase.

## 9. Animación con intención

Una animación demuestra estado si su inicio, parada y reversión responden a eventos. La solución usa un pulso controlado cuando existe actividad de sensor o reproducción. Puede implementarse con `AnimatedContainer`/`AnimatedScale` o con `AnimationController` cuando se necesita control fino. Debe respetar `MediaQuery.disableAnimations`: si la persona reduce movimiento, se usa transición inmediata o discreta.

Una animación infinita que sigue en background es una fuga. `TickerProvider`, controller y suscripción también tienen lifecycle. No se evalúa diseño gráfico; se evalúa creación/control coherente.

### Parada 7 · estado y accesibilidad

Activa el pulso con reproducción o movimiento, páralo al cesar el estado y repite con reducción de movimiento. El checkpoint no es «se ve bonito»: el estado controla la animación y la preferencia del sistema se respeta.

### Código explicado: estado y preferencia de la persona

En `lib/main.dart` del ejemplo, `AnimatedContainer` cambia según el estado de audio. El objetivo es reconocer actividad sin depender solo del color. El mensaje de texto sigue siendo comprensible con la animación desactivada.

```dart
final reduceMotion = MediaQuery.disableAnimationsOf(context);
final duration = reduceMotion ? Duration.zero : const Duration(milliseconds: 200);
```

Este fragmento ilustra cómo elegir duración; intégralo dentro de `build`, donde existe `context`. Una transición entre dos tamaños es una animación válida: no necesitas un ticker infinito. Si eliges `AnimationController`, serás responsable de detenerlo y liberarlo.

**Ejercicio existente:** E14/K14. Activa y pausa reproducción, prueba reducción de movimiento y conserva una explicación de lo que sigue comunicando la interfaz.

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

### Incidencia resuelta de ejemplo

**Situación didáctica, no resultado de tu proyecto:** después de iniciar sensor dos veces, al suspender siguen llegando muestras. Hipótesis A: la UI conserva texto antiguo. Hipótesis B: la segunda escucha reemplazó la referencia sin cancelar la primera. Cuenta eventos después de suspender: si siguen llegando, descarta A. Cancela antes de reemplazar la suscripción y repite inicio doble → suspensión y un inicio normal. Registra el cambio y el resultado que realmente observes.

En K15 puedes reutilizar la incidencia de imagen corrupta ya estudiada. Las tres correcciones del cuaderno pueden ser K5, K7 y K15; no se piden otras tres prácticas ni otra memoria. Referencia el mismo registro cuando vuelva a aparecer en el laboratorio.

**Práctica existente:** termina K15 en la fase 8, antes de la entrega del cuaderno del 10/12. La integración del 11–14/12 usa ese trabajo ya preparado.

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

Antes del laboratorio debes poder señalar, para cada fila, qué evidencia ya tienes y cuál sigue pendiente. No esperes al final para decidir si una captura era fake o real.

### Qué puedes terminar desde casa

Completa el producto DEMO, sus errores, tests y explicaciones aunque no tengas periférico. Si tienes Android compatible, utiliza el ejemplo real con escena y audio neutros. Registra cada capacidad por separado: oír el tono no demuestra conexión BLE.

Si solo falta una observación física, indica en el registro qué recurso necesitas y solicita al docente un turno de observación o préstamo por el canal habitual de dudas. No compres hardware por tu cuenta para desbloquear la unidad. El docente acuerda la observación pendiente; falta de equipo y falta de aprendizaje no son el mismo diagnóstico.

**Criterio profesional:** una compilación prueba que el código y las dependencias construyen; un test con fake prueba un comportamiento controlado; una prueba en dispositivo aporta evidencia de integración. Son comprobaciones complementarias.

## 12. Borrador local y conexión futura con AulaFlow

El producto genera `AttachmentDraft(id, localPath, mimeType, size)`. Ese objeto podría asociarse a una evidencia cuando `PROD-01` ofrezca backend. PM5 no define endpoint, token, cola offline ni servidor. El botón «preparar adjunto» guarda solo un borrador local `DEMO-*` y muestra «subida pendiente de backend».

### Criterio de entrega reproducible

Otro desarrollador debe poder abrir tu proyecto, resolver las dependencias y ejecutar el mismo caso. Tu README indica versión de Flutter, carpeta, comando, modo DEMO y limitaciones. Incluye `pubspec.lock` cuando exista y evita rutas absolutas de tu ordenador.

Tres decisiones bastan: permiso y salida alternativa; dueño y cancelación de recursos; validación, conversión y almacenamiento. En cada una escribe **decisión, motivo y consecuencia**, referenciando el código o la prueba. Esto se parece a una revisión profesional y evita repetir toda la teoría.

La siguiente integración con un backend tendría que definir autorización, errores de subida, ciclo de vida del adjunto y borrado. Aquí el borrador conserva id, ruta local, MIME y tamaño; la pantalla comunica **subida pendiente de backend**. «PROD-01» es la referencia de coordinación docente, no un archivo o servicio que tengas que encontrar para terminar PM5.
