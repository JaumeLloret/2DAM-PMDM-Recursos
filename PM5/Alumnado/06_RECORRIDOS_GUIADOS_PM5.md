# Aprende una capacidad antes de integrarlas todas

Descarga el paquete de materiales y conserva su carpeta **PM5/**. Contiene el starter, el ejemplo `Practica/Ejemplos/pm5_capacidades_guiadas/`, los tests, fixtures generados y las plantillas. Usa Flutter 3.47.8 / Dart 3.13.7.

## Arranca el starter

Desde PM5/:

```bash
dart run Alumnado/preparar_pm5.dart starter
cd Practica/Starter/aulaflow_device_media_starter
flutter analyze
flutter test
flutter run -d chrome
```

El preparador genera Android y web, conserva las fuentes y las pruebas del paquete y elimina solo el test del contador que Flutter añade si no existía. Abre la carpeta con `pubspec.yaml` en VS Code o Android Studio. El mensaje inicial es **PM5 · Starter DEMO**. El PNG es válido; la conversión inicial devuelve la entrada para que implementes el cambio de formato al llegar al bloque de imagen.

## Abre el ejemplo por separado

Desde otra terminal en PM5/:

```bash
dart run Alumnado/preparar_pm5.dart ejemplo
cd Practica/Ejemplos/pm5_capacidades_guiadas
flutter test
flutter run -d chrome
```

Su README relaciona E1–E15 y las katas con clases y pruebas concretas. Aprende una pieza en el ejemplo y aplícala al starter; no sustituyas todo el proyecto. Este trabajo ocupa el tiempo ya previsto de ejemplos/katas, sin añadir horas o entregas.

## Recorrido 1: botón → permiso → mensaje

En el starter, sigue el botón **Pedir cámara en contexto** hasta `DeviceController.requestCamera()` y `DemoPermissionPort.next`. Antes de pulsar, predice qué cambiará. Cambia `next` de `denied` a `granted` y reinicia. Después prueba `permanentlyDenied` y redacta un mensaje distinto que permita usar fixture o abrir Ajustes. Confirma que el sensor sigue funcionando. Consulta `Decision` y `permissionMessage` en el ejemplo; para el diálogo Android, localiza `AndroidLab.cameraPermission`.

## Recorrido 2: stream → muestra → pantalla → cancelación

En el starter, abre `DemoSensorPort.samples`, el listener de `startSensor` y el `Text` de `x=` en `main.dart`. Cambia el período de 250 a 30 ms y observa el efecto. Ejecuta los tests de `SensorLesson` del ejemplo para distinguir última muestra de repintado a 120 ms. Implementa en tu controller la cancelación antes de iniciar otra escucha y en `suspend()`. Añade un botón que invoque `suspend()` y comprueba que el valor deja de cambiar. La traza simula el sensor; el mismo principio se aplica al stream del adaptador Android.

## Recorrido 3: bytes PNG → procesador → JPEG visible

Abre `fixtures.dart`: genera un PNG de 1280×720, además de entradas corrupta y demasiado grande. En el ejemplo, pulsa **PNG válido → JPEG**, observa la imagen y lee `processImage` en este orden: límite de tamaño, MIME, decode, resize, encode. Ejecuta el test que comprueba firma `FF D8` y ancho de 1024. Cambia el máximo a 640 y modifica la expectativa: el test debe comprobar el nuevo tamaño real. Aplica ese procesamiento a `DemoMediaPort.convert` del starter. No basta con cambiar el texto MIME o la extensión.

## Recorrido 4: load → play → pausa → animación

En el ejemplo, pulsa Play antes de Load: debe aparecer `not_loaded`. Después carga, reproduce y pausa; observa `DemoPlayer.state` y `AnimatedContainer`. El ejemplo web muestra estados, sin reproducir sonido. En Android, `AndroidLab.loadAudio/playAudio` usa un WAV generado por `demoTone`, sin grabar audio. Sigue el archivo privado hasta `AudioPlayer.setFilePath`. Explica por qué no se necesita micrófono. En el producto, conecta esa frontera a `PlayerPort` y pausa por lifecycle.

## Conexión y errores BLE

`ScriptedBle` proporciona normal, timeout, desconexión y servicio no disponible. Ejecuta primero los tests de `BleLesson`; observa deduplicación, cancelación y desconexión final. Lleva esa política al `BlePort` de tu starter. La observación GATT real se hace en el punto de entrada Android con el protocolo de aula; sigue las condiciones del README. Sin periférico, conserva la evidencia de lógica y deja pendiente únicamente la capacidad física.

## Antes del laboratorio

Debes poder señalar, ejecutar y modificar una decisión en cada recorrido. El laboratorio de 75 minutos integra piezas ya trabajadas. `media_contracts.dart` aporta los contratos iniciales de captura, proceso, almacenamiento, player y borrador: implementa y conecta sus adaptadores tras estudiar los ejemplos. Si una pieza aún no funciona, vuelve a su test y a su bloque de estudio antes de intentar integrar todo.
