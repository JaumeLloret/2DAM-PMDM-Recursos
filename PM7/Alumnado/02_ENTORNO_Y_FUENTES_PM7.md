# PM7 · Entorno, archivos y primera comprobación

**Objetivo:** abrir una copia del starter Consulta DEMO, ejecutar su baseline y saber qué hacer si no funciona. Usa **Flutter 3.47.2 / Dart 3.13.2** y el `pubspec.lock` incluido. PM7 reutiliza lo aprendido en PM6; el emulador y Android son destinos de comprobación, no una condición para redactar la spec. No necesitas cuenta de pago ni proveedor de agente. Si el centro no autoriza uno, escribe `MANUAL` en D03/D05 y sigue idénticas tareas, pruebas y revisión.

## 1. Carpeta e IDE

Obtén **la carpeta completa** `Practica/Starter/spec_search/` desde el recurso descargable de AULES o el repositorio autorizado y haz una copia de trabajo. No copies la carpeta `Solucion` ni abras solo `main.dart`. El archivo `pubspec.yaml` marca la raíz del proyecto; `lib/catalog.dart` contiene los cuatro datos DEMO, `lib/main.dart` la pantalla y `test/smoke_test.dart` el humo inicial. Conserva `pubspec.lock`.

- **VS Code:** instala las extensiones oficiales Flutter y Dart; usa «Archivo → Abrir carpeta» y selecciona `spec_search`. Abre «Terminal → Nuevo terminal» y comprueba que `pubspec.yaml` está en esa carpeta.
- **Android Studio:** instala los plugins Flutter y Dart y, si usarás emulador, Android SDK. Usa «Open» sobre `spec_search`; la terminal integrada debe apuntar a la carpeta con `pubspec.yaml`.
- Puedes editar con cualquiera de los dos en Windows, macOS o Linux. La herramienta de agente, si existe y está autorizada, no sustituye IDE, terminal, pruebas ni revisión propia.

Si ya tienes el SDK correcto por PM6, pasa al paso 2. Si falta, descarga **Flutter 3.47.2 stable** desde [instalación oficial Flutter](https://docs.flutter.dev/get-started/install) y colócalo en una carpeta tuya con permiso de escritura, sin espacios problemáticos ni privilegios de administrador para cada comando. El SDK trae Dart; no instales otra versión de Dart para este proyecto. Comprueba `flutter --version` antes de cambiar dependencias.

| Sistema | Añade al PATH de usuario la carpeta `bin` del SDK | Comprueba |
|---|---|---|
| Windows | Ejemplo `C:\\src\\flutter\\bin`: Configuración avanzada del sistema → Variables de entorno → `Path` del usuario → Nuevo. Cierra y reabre terminal/IDE. | PowerShell: `where.exe flutter` y `flutter --version`. |
| macOS | Ejemplo `$HOME/development/flutter/bin`. Añade `export PATH="$HOME/development/flutter/bin:$PATH"` a `~/.zprofile` (zsh) y abre otra terminal. | `command -v flutter` y `flutter --version`. |
| Linux | Ejemplo `$HOME/development/flutter/bin`. Añade `export PATH="$HOME/development/flutter/bin:$PATH"` a `~/.bashrc` (bash) o `~/.zshrc` (zsh); abre otra terminal. | `command -v flutter` y `flutter --version`. |

Si la versión no es 3.47.2, usa el SDK fijado para esta práctica y verifica cuál ejecuta el PATH; no actualices `pubspec.lock` para ocultar una versión distinta. Si no puedes instalarlo en tu equipo, documenta `PENDIENTE_ENTORNO` con el primer error y solicita equipo/turno del centro; mientras tanto puedes avanzar D01–D04 con los datos DEMO.

## 2. Microvictoria de A01 · 20 minutos

En la terminal de **tu copia** de `spec_search`, por este orden:

```sh
flutter --version
flutter pub get
flutter analyze --fatal-infos
flutter test
```

Esperas Flutter 3.47.2 y Dart 3.13.2, dependencias recuperadas, análisis sin errores y el test `baseline provides synthetic data` verde. Abre `lib/catalog.dart` y cuenta DEMO-A, B, C y D. Ese verde solo prueba los cuatro datos, **no** búsqueda por título/estado. Guarda en D05: sistema/editor, versión, ruta relativa `spec_search`, comandos, salida real, corte inicial y este límite. Si falla, identifica el **primer** error y sigue [Ayuda por síntomas](../Unidad/11_AYUDA_PM7.md), sin alterar la expectativa del test para forzar verde.

## 3. Archivos de la feature y comandos después del primer incremento

En `lib/catalog.dart` implementa política S1–S5; en `lib/main.dart` conecta búsqueda, estado, vacío, contador y limpiar S6–S7. Coloca pruebas propias en `test/`, con nombres que indiquen el comportamiento. La [tarjeta](../Unidad/05_SPEC_Y_DECISIONES_PM7.md) fija decisiones **después** de tus preguntas. El [laboratorio](../Unidad/06_LABORATORIO_PM7.md) organiza los incrementos.

```sh
dart format lib test
dart format --output=none --set-exit-if-changed lib test
flutter analyze --fatal-infos
flutter test
```

El primer comando modifica formato: revisa su diff. Los tres siguientes deben terminar sin error en tu corte final. Si una prueba falla, anota expected/actual, archivo y línea; diferencia una aserción roja prevista de un import que no compila. Si tu práctica está en Git, conserva baseline antes del cambio y usa `git status --short`, `git diff --stat` y `git diff` para D06; crea una PR solo en el repositorio de práctica autorizado. Sin acceso, deja D07 como borrador `PENDIENTE_PUBLICACION_PR`. Un corte local sin commit no tiene SHA: no lo inventes.

## 4. Android, JDK y AVD solo cuando intervengan

Para un emulador instala Android Studio/SDK mediante su SDK Manager, acepta licencias según las instrucciones del centro y usa un AVD desde Device Manager. Comprueba `flutter doctor -v` y `flutter devices`; el destino debe aparecer antes de ejecutarlo. La virtualización del host debe estar habilitada y el equipo necesita RAM/espacio suficientes. Un AVD lento o ausente no impide documentar y probar la política en host: guarda `PENDIENTE_EMULADOR` y solicita acceso autorizado. No publiques seriales ni rutas personales.

Para construir Android, verifica JDK 17, SDK y licencias con `flutter doctor -v`. En una **copia temporal** de tu proyecto ya guardado en Git/copia de seguridad, genera la plataforma si no existe:

```sh
flutter create --platforms=android --org org.aulaflow.training .
flutter pub get
flutter build apk --debug
```

Antes y después de `flutter create`, compara `lib/`, `test/`, `integration_test/`, `pubspec.yaml` y `pubspec.lock` con tu copia original; conserva tus archivos y elimina solo el test de contador de plantilla si aparece. El APK esperado es `build/app/outputs/flutter-apk/app-debug.apk`. Un build no prueba instalación ni uso en móvil real. Si JDK/Gradle falla, guarda el primer diagnóstico y solicita ayuda; no cambies la spec ni atribuyas una observación física a CI. Un test de integración requiere destino disponible: `flutter test integration_test/flow_test.dart -d <ID_LOCAL>` solo si ese archivo existe en **tu implementación** y `flutter devices` muestra ese destino; no copies el test de la solución docente.

## 5. Fuentes de consulta y privacidad

- [Flutter: instalación](https://docs.flutter.dev/get-started/install), [testing](https://docs.flutter.dev/testing/overview) y [Android](https://docs.flutter.dev/deployment/android).
- [GitHub: pull requests y revisión](https://docs.github.com/en/pull-requests): una PR propuesta no es una aprobación.
- El SDK Flutter usa licencia BSD de tres cláusulas. Los datos del starter son DEMO; no añadas cuentas, red, secretos, datos personales ni paquetes de búsqueda.
- La secuencia SDD y S1–S7 son diseño docente del caso. No constituyen aceptación de AulaFlow ni CE nuevos.

**Rescate:** comparte con el docente solo fase, SO/editor, comando, primer error y comprobación intentada; elimina tokens, seriales, rutas privadas y conversaciones ajenas. No conviertas una propuesta de herramienta en comando ejecutado.
