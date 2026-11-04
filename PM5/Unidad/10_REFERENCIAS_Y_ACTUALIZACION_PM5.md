# Referencias y baseline técnico · PM5

Revisión de enlaces y mantenimiento: **02/11/2026**. La unidad fija versiones exactas para reproducibilidad; antes de impartir se vuelve a comprobar compatibilidad, seguridad y política de plataforma sin actualizar a ciegas.

| Componente | Versión | Licencia publicada | Uso y decisión |
|---|---:|---|---|
| Flutter / Dart | 3.47.8 / 3.13.7 | BSD-3-Clause | stable del curso; app Android API 24+, carril BLE físico API 31+ |
| `flutter_reactive_ble` | 5.5.0 | BSD-3-Clause | BLE: estado, scan, conexión y GATT; puente Android acotado y auditable |
| `permission_handler` | 12.0.3 | MIT | estados runtime y abrir ajustes; serie previa al salto de `compileSdk 37` |
| `sensors_plus` | 7.1.0 | BSD-3-Clause | acelerómetro/giroscopio por streams |
| `image_picker` | 1.2.3 | Apache-2.0/BSD-3-Clause | selector/cámara y `retrieveLostData()` Android |
| `image` | 4.9.2 | MIT | decode/resize/encode real y testeable |
| `path_provider` | 2.1.6 | BSD-3-Clause | directorio privado controlado |
| `just_audio` | 0.10.6 | Apache-2.0/MIT | load/play/pause/error/dispose de WAV DEMO |

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
- `image_picker` Android no necesita almacenamiento heredado y exige recuperar lost data si Android destruye la Activity. La solución ejecuta `retrieveLostData()` al inicio/reanudación y vuelve a pasar el fichero recuperado por el mismo pipeline local.
- `sensors_plus` expone streams; la ausencia/error debe manejarse.
- `image` lee/escribe PNG/JPEG y permite comprobar conversión real.
- `path_provider` ofrece directorios privados; no se usa almacenamiento global.
- `just_audio` reproduce archivo local; el audio se genera sintéticamente.

## Política de actualización

1. abrir una rama de mantenimiento, nunca actualizar durante clase;
2. leer changelog, requisitos Android/Gradle/Kotlin y licencia;
3. ejecutar pub get, formato, analyzer, tests y dos APK;
4. repetir QA física de permisos, BLE, sensor, cámara/lost-data, audio y lifecycle;
5. actualizar esta tabla y la issue de prepublicación con SHA/run.

Una versión «más nueva» no sustituye la validación del conjunto.

### Decisión de compatibilidad de permisos

El 07/09/2026 se revalidó `permission_handler`. La serie 13 cambia a `compileSdk 37`, mientras que la plantilla estable de Flutter 3.47.8 usa `compileSdk 36`. PM5 fija por ello `12.0.3`, última versión anterior a ese cambio mayor, hasta que el baseline del curso migre de forma explícita. No se silencia el control de metadatos AAR ni se fuerza un SDK fuera del rango validado.

El baseline del curso mantiene `flutter_reactive_ble 5.5.0`; no se adopta automáticamente una versión posterior publicada. Para impedir que `pub get` resuelva una implementación móvil transitiva más nueva sin revisión, las dos soluciones fijan además `reactive_ble_mobile 5.5.0` mediante `dependency_overrides`. Esa versión conserva `compileSdkVersion 33`; AndroidX requiere 34 o superior. `tools/patch_reactive_ble_android.py` verifica paquete y versión y eleva solo ese valor a 36 durante la materialización. El puente queda visible, idempotente y con fallo cerrado. Cualquier retirada del override o salto de versión obliga a revalidar el conjunto antes de publicar.

## Actualización de seguridad del SDK · 02/11/2026

PM5 utiliza ahora **Flutter 3.47.8 / Dart 3.13.7**. Es una actualización de mantenimiento del SDK, no una actualización general de plugins. El aviso oficial GHSA-frr6-h895-5pxp corrige la validación TLS en aplicaciones nativas afectadas; las aplicaciones distribuidas deben reconstruirse con el SDK corregido. El laboratorio local DEMO no realiza subidas ni necesita un backend.

Fuentes: [aviso oficial de Dart](https://github.com/dart-lang/sdk/security/advisories/GHSA-frr6-h895-5pxp) y [archivo oficial de Flutter](https://docs.flutter.dev/install/archive).

Si vienes de 3.47.2, instala 3.47.8 desde ese archivo en una carpeta estable, selecciona su `bin` en PATH y en el editor, abre una terminal nueva y comprueba `flutter --version` y `dart --version`. No instales Dart por separado. Conserva tus proyectos y sus dependencias; después ejecuta `flutter pub get`, `flutter analyze` y `flutter test`. Evita `flutter upgrade` sin versión controlada o `pub upgrade` durante la práctica. La documentación de los paquetes puede mostrar versiones más nuevas: la tabla indica las utilizadas en PM5.

La comprobación de compilación no acredita hardware físico. Los resultados exactos de la campaña de revisión acompañan al MBZ.
