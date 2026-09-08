# Referencias y actualización técnica · PM4

Consulta: **06/09/2026**. Revalidar en prepublicación.

| Elemento | Baseline | Fuente oficial | Decisión |
|---|---|---|---|
| Flutter | 3.47.2 | https://docs.flutter.dev/install/archive | estable del curso; docs reflejan 3.47.2 |
| Android soportado por Flutter 3.47.2 | API 24–37; CI 24–36 | https://docs.flutter.dev/reference/supported-platforms | API 23 y anteriores quedan fuera de soporte de Flutter 3.47.2 |
| Dart incluido | 3.13.2 | `flutter --version` en CI | fijado por Flutter 3.47.2 |
| `http` | 1.6.0 | https://pub.dev/packages/http | cliente pequeño, mantenido e inyectable |
| `shared_preferences` | 2.5.5 | https://pub.dev/packages/shared_preferences | API `SharedPreferencesAsync`; solo datos pequeños/no críticos |
| `flutter_secure_storage` | 10.3.1 (pin CI) | https://pub.dev/packages/flutter_secure_storage/changelog | token; compatible con el proyecto de curso que compila con SDK 36; 11.0.0 exige compileSdk 37 |
| red Flutter | docs 3.47.2 | https://docs.flutter.dev/cookbook/networking/fetch-data | permiso INTERNET y `package:http` |
| HTTP local de laboratorio | debug-only | https://docs.flutter.dev/release/breaking-changes/network-policy-ios-android | si Android bloquea cleartext, usar Network Security Config solo en `src/debug`, nunca en release |
| red local Android 17 | target API 37+ | https://docs.flutter.dev/platform-integration/android/local-network-permission | si el curso migra a target 37, la LAN exige `ACCESS_LOCAL_NETWORK`; se trata como contingencia de plataforma/prepublicación, no como contenido PM4 |
| emulator networking | 2026-03-12 | https://developer.android.com/studio/run/emulator-networking | revalidar host/AVD en prepublicación |
| timeout | Dart API | https://api.dart.dev/dart-async/Future/timeout.html | `TimeoutException`; la fuente puede completar después |
| servidor didáctico | `dart:io` | https://dart.dev/libraries/dart-io | infraestructura VM no web |

## Notas de decisión

`SharedPreferencesAsync` evita una cache API implícita y ofrece el valor más reciente del backend, pero las escrituras no son almacenamiento crítico. Se fija `flutter_secure_storage` **10.3.1** porque la rama 11.0.0 eleva `compileSdk` a 37, mientras el proyecto materializado con Flutter 3.47.2 en esta unidad usa `compileSdk 36`. La justificación **no** es conservar Android 23: Flutter 3.47.2 soporta Android API 24–37 y considera 23 o anterior no soportado.

La API local HTTP existe para reproducibilidad. Si la política Android impide cleartext, la excepción se configura únicamente para el build **debug** con Network Security Config; no se relaja la política de release ni se acepta cualquier certificado. La comprobación HTTPS controlada sigue siendo obligatoria antes de impartir.

Android 17/API 37 introduce permiso runtime de red local para apps que apunten a 37 o superior. El baseline actual de PM4 no obliga a incorporarlo. Si el target cambia antes de clase, se coordina como contingencia técnica/prepublicación y con la propiedad curricular de PM5, en lugar de introducir silenciosamente `permission_handler` en PM4.

