# Ejemplos guiados · PM5

Cada ejemplo indica una predicción, un cambio y un resultado observable. Los fragmentos usan puertos propios; aplica el fragmento a tu implementación, apoyándote en los puertos y fakes del starter público.

Estos son fragmentos de diseño para completar y adaptar durante las katas. No se ejecutan de forma aislada ni representan APIs ya implementadas en el starter: los puertos de captura, almacenamiento y reproducción, el borrador multimedia y el timestamp de muestra forman parte de la ampliación que desarrollarás.

## 1. Permiso como resultado, no booleano

```dart
final state = await permissions.request(Capability.camera);
switch (state) {
  case PermissionState.granted:
    await capture.captureDemoImage();
  case PermissionState.permanentlyDenied:
    message = 'Activa Cámara en Ajustes o usa un fixture DEMO.';
  default:
    message = 'Cámara no disponible para esta acción.';
}
```

Esperado: denegar cámara no desactiva sensores ni BLE.

## 2. Solicitud en contexto

Mueve `request(camera)` desde `initState` al callback «Capturar». Predice cuántos diálogos aparecen al abrir la app. Esperado: cero al abrir, uno al expresar intención.

## 3. Lifecycle

```dart
Future<void> suspend() async {
  await stopScan();
  await stopSensor();
  await player.pause();
}
```

Esperado: no llegan muestras después de `paused` y la UI conserva un estado reanudable.

## 4. Scan acotado

```dart
await for (final device in ble.scan().timeout(const Duration(seconds: 8))) {
  devices[device.id] = device;
}
```

Mantén además una suscripción cancelable en tu adaptación real. Esperado: no hay dos scans simultáneos.

## 5. Identidad redactada

```dart
String safeDevice(String id) =>
    id.length <= 4 ? 'DEMO-device' : '…${id.substring(id.length - 4)}';
```

Solo se usa para UI temporal. Nunca se copia el id completo a evidencias o logs.

## 6. Conexión y timeout

El adaptador conserva la suscripción a `connectToDevice`; completa el `Future` al estado conectado y cancela al desconectar. Esperado: un timeout produce `WirelessFailure.timeout`, no un spinner infinito.

## 7. Intercambio GATT mínimo

```dart
await ble.exchange(const [0x44, 0x45, 0x4d, 0x4f]); // DEMO
```

Esperado: la respuesta se representa como bytes/texto saneado. Una confirmación de escritura no se describe como respuesta HTTP.

## 8. Sensor con throttling

```dart
if (sample.at.difference(lastPaint) >= const Duration(milliseconds: 120)) {
  latest = sample;
  lastPaint = sample.at;
  notifyListeners();
}
```

Esperado: el stream puede emitir más deprisa que la UI sin perder la última muestra útil.

## 9. Error de sensor

El fake emite dos muestras y luego `CapabilityUnavailable('sensor')`. Esperado: estado `unavailable`, suscripción limpia y botón «Reintentar».

## 10. Validación antes de decodificar

```dart
if (bytes.length > 5 * 1024 * 1024) {
  throw const MediaValidationFailure('too_large');
}
if (!{'image/png', 'image/jpeg'}.contains(mime)) {
  throw const MediaValidationFailure('unsupported_type');
}
```

Esperado: un PDF renombrado a `.jpg` falla al decodificar.

## 11. Conversión auténtica

Decodifica PNG, reduce a 1024 px y ejecuta `encodeJpg`. Verifica los bytes mágicos JPEG `FF D8`; no basta cambiar el nombre.

## 12. Ruta privada

`StorePort.save()` recibe bytes y un nombre generado `DEMO-*`. Esperado: no usa `/sdcard/`, no solicita almacenamiento global y devuelve una ruta controlada.

## 13. Player con contrato

```dart
await player.loadDemoTone();
await player.play();
await player.pause();
await player.dispose();
```

Esperado: `play` sin carga produce un error útil; `dispose` es idempotente.

## 14. Animación y movimiento reducido

`AnimatedScale(scale: active && !disableAnimations ? 1.08 : 1.0, ...)`. Esperado: el pulso refleja reproducción/sensor y se desactiva si el sistema reduce animaciones.

## 15. Borrador sin backend

Construye `AttachmentDraft` con id `DEMO-ATT-*`, MIME, bytes y ruta local. La UI dice «listo localmente; subida depende de PROD-01». No aparece cliente HTTP.


