# Referencias y baseline técnico · PM5

Revalidación: **07/09/2026**. La unidad fija versiones exactas para reproducibilidad; antes de impartir se vuelve a comprobar compatibilidad, seguridad y política de plataforma sin actualizar a ciegas.

| Componente | Versión | Licencia publicada | Uso y decisión |
|---|---:|---|---|
| Flutter / Dart | 3.47.2 / 3.13.2 | BSD-3-Clause | stable del curso; app Android API 24+, carril BLE físico API 31+ |
| `flutter_reactive_ble` | 5.5.0 | BSD-3-Clause | BLE: estado, scan, conexión y GATT; puente Android acotado y auditable |
| `permission_handler` | 12.0.3 | MIT | estados runtime y abrir ajustes; serie previa al salto de `compileSdk 37` |
| `sensors_plus` | 7.1.0 | BSD-3-Clause | acelerómetro/giroscopio por streams |
| `image_picker` | 1.2.3 | Apache-2.0/BSD-3-Clause | selector/cámara y `retrieveLostData()` Android |
| `image` | 4.9.2 | MIT | decode/resize/encode real y testeable |
| `path_provider` | 2.1.6 | BSD-3-Clause | directorio privado controlado |
| `just_audio` | 0.10.6 | Apache-2.0/MIT | load/play/pause/error/dispose de WAV DEMO |

La tabla describe las dependencias de la integración real que desarrollarás. El starter público inicial solo declara Flutter y sus tests.

Fuentes primarias:

- https://docs.flutter.dev/install/archive
- https://pub.dev/packages/flutter_reactive_ble
- https://pub.dev/packages/permission_handler
- https://pub.dev/packages/sensors_plus
- https://pub.dev/packages/image_picker
- https://pub.dev/packages/image
- https://pub.dev/packages/path_provider
- https://pub.dev/packages/just_audio
- https://developer.android.com/develop/connectivity/bluetooth/bt-permissions

## Límites revalidados

- `flutter_reactive_ble` expone `status`/`statusStream`; antes de scan/conexión el adaptador espera `BleStatus.ready` y falla de forma recuperable si el stack no queda listo.
- Android 12+ usa `BLUETOOTH_SCAN`/`BLUETOOTH_CONNECT`; en Android 11 o inferior el BLE scan está ligado además al permiso de ubicación runtime. Para no vender compatibilidad parcial, el **carril físico BLE obligatorio de PM5 se fija en Android 12+ (API 31+)**. La app puede instalarse desde API 24 y el resto de capacidades puede ensayarse, pero BLE físico en API 24–30 queda fuera del carril obligatorio salvo extensión específica revalidada.
- El manifiesto conserva ubicación limitada a API 30 como compatibilidad declarativa de la librería, pero PM5 no solicita ubicación al alumnado en el carril obligatorio API 31+.
- `image_picker` Android no necesita almacenamiento heredado y exige recuperar lost data si Android destruye la Activity. La integración real debe ejecutar `retrieveLostData()` al inicio/reanudación y vuelve a pasar el fichero recuperado por el mismo pipeline local.
- `sensors_plus` expone streams; la ausencia/error debe manejarse.
- `image` lee/escribe PNG/JPEG y permite comprobar conversión real.
- `path_provider` ofrece directorios privados; no se usa almacenamiento global.
- `just_audio` reproduce archivo local; el audio se genera sintéticamente.

