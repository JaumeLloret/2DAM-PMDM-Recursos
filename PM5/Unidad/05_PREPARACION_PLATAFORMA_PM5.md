# Preparación de plataforma · PM5

## Baseline reproducible

- Flutter **3.47.2 stable** / Dart **3.13.2**.
- Android como carril físico obligatorio; API mínima efectiva de la app 24.
- **BLE físico obligatorio: Android 12+ / API 31+**. En API 24–30 no se promete el scan real de esta unidad porque la política legacy exige además ubicación runtime; se usa DEMO para BLE salvo extensión revalidada.
- JDK y Gradle se materializan desde la plantilla del Flutter fijado.
- Dependencias exactas documentadas en [10_REFERENCIAS_Y_ACTUALIZACION_PM5.md](10_REFERENCIAS_Y_ACTUALIZACION_PM5.md).

## Arranque del starter público

El starter solo incluye Flutter y fakes DEMO. Sigue su [README de arranque](../Practica/Starter/aulaflow_device_media_starter/README.md). Sus tests comprueban la lógica de entrada; no solicitan permisos ni acreditan cámara, sensores o BLE reales.

## Preparación de tu integración Android

La tabla de dependencias de las referencias describe la integración que desarrollarás. No todas están añadidas al starter. Materializa Android en una copia de trabajo, conserva tus archivos [lib/](../Practica/Starter/aulaflow_device_media_starter/lib), [test/](../Practica/Starter/aulaflow_device_media_starter/test) y [pubspec.yaml](../Practica/Starter/aulaflow_device_media_starter/pubspec.yaml), declara los permisos necesarios y verifica cada capacidad por separado.

Para la combinación fijada de `reactive_ble_mobile 5.5.0` y compileSdk 36 existe un [puente de compatibilidad](../Recursos/Android/README.md). Se aplica después de resolver esa dependencia; no es necesario para ejecutar el starter DEMO. La imagen de referencia de Android y el periférico se confirman con el docente antes de la prueba física.

## Matriz de capacidades

| Feature | Android real | AVD | CI Linux | Fake |
|---|---:|---:|---:|---:|
| permisos runtime | sí | parcial | no | transición |
| BLE scan/GATT | **sí en API 31+ + periférico** | no fiable | no | determinista |
| acelerómetro | sí | controles AVD variables | no | traza |
| selector/cámara | sí | parcial | no | fixture |
| conversión imagen | sí | sí | sí | fixture real |
| audio WAV | sí | parcial | build/tests | estado |

La integración real debe comprobar que el stack BLE alcance `BleStatus.ready`, limita el scan a 8 s, permite cancelarlo, detiene el scan antes de conectar y propaga una desconexión posterior a la UI. Al pausar/inactivar la app libera scan, sensor y conexión BLE.

## Manifiesto Android

La lista deliberada es:

```xml
<uses-feature android:name="android.hardware.bluetooth_le" android:required="false" />
<uses-feature android:name="android.hardware.sensor.accelerometer" android:required="false" />
<uses-feature android:name="android.hardware.camera.any" android:required="false" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN"
    android:usesPermissionFlags="neverForLocation" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"
    android:maxSdkVersion="30" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"
    android:maxSdkVersion="30" />
<uses-permission android:name="android.permission.CAMERA" />
```

No se declara `MANAGE_EXTERNAL_STORAGE`, acceso a ubicación en segundo plano, micrófono ni Internet. Las features son `required=false` para que la instalación no simule disponibilidad; la app representa el estado ausente. Los permisos de ubicación limitados a API 30 son compatibilidad declarativa legacy: **PM5 no presenta el BLE físico API 24–30 como carril soportado sin una ampliación específica que implemente y revalide ese permiso runtime.**

## Periférico BLE de aula

El adaptador recibe `serviceUuid` y `characteristicUuid`. Los valores `DEMO` incluidos son un contrato didáctico y deben sustituirse por el periférico de prepublicación. No guardes MAC/UUID de instancia en Git, AULES o capturas. El protocolo mínimo acepta `DEMO-PING` y ofrece lectura/confirmación observable. Si el periférico no soporta ese intercambio, documenta el protocolo equivalente sin inventar respuesta.

## Fixtures y recuperación Android

- `DEMO-PNG-01`: imagen sintética generada por test.
- `DEMO-CORRUPT-01`: bytes que no decodifican.
- `DEMO-TOO-LARGE-01`: tamaño lógico >5 MiB.
- `DEMO-TONE.wav`: WAV PCM sintético generado localmente.
- traza sensor: tres muestras predecibles y un error opcional.

`image_picker` puede perder la respuesta si Android destruye la Activity mientras el selector/cámara está abierto. La integración real debe llamar `retrieveLostData()` al iniciar/reanudar y, si recupera un fichero, lo procesa y guarda por el mismo pipeline que una selección ordinaria. La verificación con el docente debe observar este caso cuando sea reproducible; un test fake solo certifica la lógica de recuperación.

No uses fotos personales. Para cámara real, enfoca una tarjeta con el texto `DEMO-OBJECT` y elimina el archivo tras la verificación si la política de aula lo exige.

## Diagnóstico de entrada

1. ¿Qué puede demostrar hoy tu entorno?
2. ¿Qué permiso pide cada acción?
3. ¿Quién cancelará cada stream/scan/conexión?
4. ¿Cómo probarás conversión sin mirar la extensión?
5. ¿Qué evidencia quedará pendiente de hardware?
6. ¿Tu dispositivo BLE físico es API 31+ y el stack llega a `ready`?

