# Referencias y actualización técnica · PM1

## Corte de consulta

**Consultado: 05/09/2026 (UTC).**

Este documento distingue:

- **baseline observado**: dato comprobado en la fecha de consulta;
- **recomendación de aula**: canal/configuración que se usará;
- **mínimo del starter**: restricción declarada en [pubspec.yaml](../Alumnado/Starter/mobile_profile_lab/pubspec.yaml);
- **dato de prepublicación**: debe verificarse otra vez poco antes del taller.

## Baseline observado

| Elemento | Dato a 05/09/2026 | Uso |
|---|---|---|
| Flutter stable | **3.47.2**, publicada 27/08/2026 | referencia técnica actual |
| Dart incluido | **3.13.2** | no instalar Dart separado |
| Ref Flutter | `d3b14c876900e553bc736ca19295fc09e3853e8e` | trazabilidad del release |
| Starter | Flutter `>=3.47.0`; Dart `>=3.13.0 <4.0.0` | mínimo pedagógico declarado |
| Android soportado por Flutter 3.47.2 | API **24–37**; CI 24–36 | no confundir soportado con target elegido |
| SDK de aula propuesto | API **36** | coincide con setup oficial consultado |
| Canal | **stable** | recomendado; no beta/main para el grupo |

La versión recomendada para el taller será la **última `stable` validada por el docente** en prepublicación. Si cambia, se actualiza el anuncio sin reescribir la teoría.

## Fuentes oficiales

- Archivo de releases Flutter: https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json
- Archivo/ventanas de publicación: https://docs.flutter.dev/install/archive
- Instalación: https://docs.flutter.dev/install
- Configuración Android: https://docs.flutter.dev/platform-integration/android/setup
- Plataformas soportadas: https://docs.flutter.dev/reference/supported-platforms
- Hot reload: https://docs.flutter.dev/tools/hot-reload
- Aceleración Android Emulator: https://developer.android.com/studio/run/emulator-acceleration
- Jetpack Compose: https://developer.android.com/compose
- React Native: https://reactnative.dev/
- Kotlin Multiplatform: https://kotlinlang.org/docs/multiplatform.html
- PWA: https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps
- SwiftUI: https://developer.apple.com/xcode/swiftui/

Las fuentes de comparación describen sus propios productos; la decisión se somete a criterios y no reproduce marketing.

## Ruta común

1. Instalar Flutter `stable` desde la guía oficial.
2. Añadir `flutter/bin` al `PATH`.
3. Instalar la última Android Studio estable para SDK/Device Manager.
4. Instalar plataforma Android propuesta, Build-Tools, Command-line Tools, Emulator, Platform-Tools, CMake y NDK (Side by side), según el setup oficial consultado.
5. Aceptar licencias.
6. Crear AVD acorde a arquitectura del host.
7. Validar con `flutter doctor -v`, `flutter emulators` y `flutter devices`.

El plugin de Flutter de Android Studio **no sustituye** al SDK Flutter.

## Diferencias por host

### Windows

- usar una ruta de SDK escribible y sin privilegios especiales;
- verificar `PATH` en una terminal nueva;
- comprobar virtualización en firmware y el hipervisor compatible;
- instalar driver USB solo si se usa dispositivo físico.

### GNU/Linux

- instalar prerrequisitos que marque la guía oficial para la distribución;
- comprobar que CPU/firmware ofrecen virtualización;
- comprobar acceso a `/dev/kvm`;
- revisar grupos/permisos antes de ejecutar el emulador;
- en sistemas inmutables/Flatpak, evitar mezclar SDK del host y rutas aisladas sin comprenderlas.

### macOS

- escoger SDK/imagen de la arquitectura correcta;
- Android Studio/AVD permiten la ruta Android común;
- para compilar/ejecutar iOS se requieren macOS y Xcode;
- iOS no es requisito común de PM1.

## Perfil de AVD recomendado

- teléfono común, no un dispositivo exótico;
- API 36 para la referencia de aula;
- imagen x86_64 en host x64 o ARM64 en Apple Silicon/host ARM;
- aceleración hardware;
- recursos que no bloqueen el equipo;
- un segundo perfil compacto solo para ampliación o prueba.

No se fija un modelo comercial concreto como requisito.

