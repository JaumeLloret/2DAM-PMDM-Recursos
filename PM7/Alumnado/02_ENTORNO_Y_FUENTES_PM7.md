# PM7 · Entorno, archivos y primera comprobación

**Objetivo:** abrir una copia del starter Consulta DEMO, ejecutar su baseline y saber qué hacer si no funciona. Usa **Flutter 3.47.8 / Dart 3.13.7** y el `pubspec.lock` incluido. PM7 reutiliza lo aprendido en PM6; el emulador y Android son destinos de comprobación, no una condición para redactar la spec. No necesitas cuenta de pago ni proveedor de agente. Si el centro no autoriza uno, escribe `MANUAL` en D03/D05 y sigue idénticas tareas, pruebas y revisión.

## 1. Carpeta e IDE

Obtén **la carpeta completa** `Practica/Starter/spec_search/` desde el recurso descargable de AULES o el repositorio autorizado y haz una copia de trabajo. No copies la carpeta `Solucion` ni abras solo `main.dart`. El archivo `pubspec.yaml` marca la raíz del proyecto; `lib/catalog.dart` contiene los cuatro datos DEMO, `lib/main.dart` la pantalla y `test/smoke_test.dart` el humo inicial. Conserva `pubspec.lock`.

- **VS Code:** instala las extensiones oficiales Flutter y Dart; usa «Archivo → Abrir carpeta» y selecciona `spec_search`. Abre «Terminal → Nuevo terminal» y comprueba que `pubspec.yaml` está en esa carpeta.
- **Android Studio:** instala los plugins Flutter y Dart y, si usarás emulador, Android SDK. Usa «Open» sobre `spec_search`; la terminal integrada debe apuntar a la carpeta con `pubspec.yaml`.
- Puedes editar con cualquiera de los dos en Windows, macOS o Linux. La herramienta de agente, si existe y está autorizada, no sustituye IDE, terminal, pruebas ni revisión propia.

Si ya tienes el SDK correcto por PM6, pasa al paso 2. Si falta, descarga **Flutter 3.47.8 stable** desde el [archivo oficial del SDK](https://docs.flutter.dev/install/archive) y colócalo en una carpeta tuya con permiso de escritura, sin espacios problemáticos ni privilegios de administrador para cada comando. El SDK trae Dart; no instales otra versión de Dart para este proyecto. Comprueba `flutter --version` antes de cambiar dependencias.

| Sistema | Añade al PATH de usuario la carpeta `bin` del SDK | Comprueba |
|---|---|---|
| Windows | Ejemplo `C:\\src\\flutter\\bin`: Configuración avanzada del sistema → Variables de entorno → `Path` del usuario → Nuevo. Cierra y reabre terminal/IDE. | PowerShell: `where.exe flutter` y `flutter --version`. |
| macOS | Ejemplo `$HOME/development/flutter/bin`. Añade `export PATH="$HOME/development/flutter/bin:$PATH"` a `~/.zprofile` (zsh) y abre otra terminal. | `command -v flutter` y `flutter --version`. |
| Linux | Ejemplo `$HOME/development/flutter/bin`. Añade `export PATH="$HOME/development/flutter/bin:$PATH"` a `~/.bashrc` (bash) o `~/.zshrc` (zsh); abre otra terminal. | `command -v flutter` y `flutter --version`. |

Si la versión no es 3.47.8, usa el SDK fijado para esta práctica y verifica cuál ejecuta el PATH; no actualices `pubspec.lock` para ocultar una versión distinta. Si no puedes instalarlo en tu equipo, documenta `PENDIENTE_ENTORNO` con el primer error y solicita equipo/turno del centro; mientras tanto puedes avanzar D01–D04 con los datos DEMO.

## 2. Microvictoria de A01 · 20 minutos

En la terminal de **tu copia** de `spec_search`, por este orden:

```sh
flutter --version
flutter pub get
flutter analyze --fatal-infos
flutter test
```

Esperas Flutter 3.47.8 y Dart 3.13.7, dependencias recuperadas, análisis sin errores y las dos pruebas iniciales verdes (datos y montaje de la pantalla). Abre `lib/catalog.dart` y cuenta DEMO-A, B, C y D. Esos verdes prueban los datos y su presentación inicial, **no** búsqueda por título/estado. Guarda en D05: sistema/editor, versión, ruta relativa `spec_search`, comandos, salida real, corte inicial y este límite. Si falla, identifica el **primer** error y sigue [Ayuda por síntomas](../Unidad/11_AYUDA_PM7.md), sin alterar la expectativa del test para forzar verde.

## 3. Archivos de la feature y comandos después del primer incremento

En `lib/catalog.dart` implementa política S1–S5; en `lib/main.dart` conecta búsqueda, estado, vacío, contador y limpiar S6–S7. Coloca pruebas propias en `test/`, con nombres que indiquen el comportamiento. La [tarjeta](../Unidad/05_SPEC_Y_DECISIONES_PM7.md) fija decisiones **después** de tus preguntas. El [laboratorio](../Unidad/06_LABORATORIO_PM7.md) organiza los incrementos.

```sh
dart format lib test
dart format --output=none --set-exit-if-changed lib test
flutter analyze --fatal-infos
flutter test
```

El primer comando modifica formato: revisa su diff. Los tres siguientes deben terminar sin error en tu corte final. Si una prueba falla, anota expected/actual, archivo y línea; diferencia una aserción roja prevista de un import que no compila. Si tu práctica está en Git, conserva baseline antes del cambio y usa `git status --short`, `git diff --stat` y `git diff` para D06; crea una PR solo en el repositorio de práctica autorizado. Sin acceso, deja D07 como borrador `PENDIENTE_PUBLICACION_PR`. Un corte local sin commit no tiene SHA: no lo inventes.

## 4. Abre la pantalla: web primero, Android si lo necesitas

Los ZIP incluyen fuentes completas y pruebas; las carpetas de plataforma se generan con el SDK fijado para evitar transportar rutas de otro equipo. Necesitas **Python 3** solo para ejecutar `preparar_plataformas.py`; comprueba `python --version` (Windows: `py -3 --version`). Si no está instalado, obtén Python desde [python.org](https://www.python.org/downloads/) o solicita ayuda. El preparador crea las carpetas de plataforma en una plantilla temporal y copia solo `web/` o `android/`; verifica que `lib/`, `test/`, `pubspec.yaml` y `pubspec.lock` conservan sus bytes. Si la plataforma ya existe, se detiene sin sobrescribirla.

En la raíz del starter, dentro de los 20 min de A01:

```sh
python preparar_plataformas.py web
flutter devices
flutter run -d chrome
```

En Windows cambia `python` por `py -3`. Esperas la pantalla **Consulta DEMO** con las cuatro entradas y sus estados; aún no hay buscador. Comprueba primero esa diferencia: arrancar no equivale a tener la funcionalidad. Si Chrome no aparece, ejecuta `flutter run -d web-server` y abre la dirección **local** que imprima tu terminal en tu navegador. Para parar, vuelve a terminal y pulsa `q`. No publiques el servidor ni abras puertos externos. Si no hay Python, una copia temporal de tu proyecto guardado admite el comando oficial `flutter create . --platforms web`; compara y conserva tus fuentes/tests/lock antes de seguir. No uses un test de contador generado como sustituto del smoke original.

Para Android: prepara Android Studio/SDK/AVD con lo aprendido en PM1. Comprueba `flutter doctor -v`, SDK/licencias, JDK compatible (JDK 17 en esta edición verificada) y `flutter devices`. Después:

```sh
python preparar_plataformas.py android
flutter pub get
flutter devices
```

Ejecuta `flutter run -d ID_LOCAL` sustituyendo ID_LOCAL por el destino realmente listado. Para compilar: `flutter build apk --debug`; salida `build/app/outputs/flutter-apk/app-debug.apk`. Un emulador permite observar la UI Android, web permite observar la UI de navegador, un widget test usa un entorno simplificado y una compilación solo genera un archivo. Ninguno acredita por sí solo instalación física. Si no hay emulador/RAM/SDK, continúa en web, conserva `PENDIENTE_EMULADOR` y pide equipo/turno del centro. PM7 no añade una exigencia de hardware a RA2.i.

Un test de integración requiere un destino disponible y un archivo que exista en tu implementación: `flutter test integration_test/flow_test.dart -d ID_LOCAL`. No copies pruebas reservadas ni declares un resultado físico a partir de CI.

## 4.1. Conserva el punto de partida para poder revisar un diff

Git ya se trabajó en las unidades anteriores. Si el proyecto está dentro de tu repositorio autorizado, crea allí una rama; **no** crees un segundo repositorio anidado. Si es una carpeta nueva sin repositorio, `git init` crea uno local sin publicar nada. En ambos casos empieza con una copia limpia y comprueba `git status --short` antes de guardar.

```sh
git switch -c pm7-consulta
git add .gitignore README.md pubspec.yaml pubspec.lock lib test preparar_plataformas.py
git commit -m "PM7: punto de partida"
git rev-parse HEAD
```

Conserva el SHA real en D05. Si Git pide identidad, usa la cuenta/identidad autorizada por el centro; no inventes una. Antes de guardar el incremento posterior, revisa `git status --short` y selecciona solo tus archivos. `git diff BASELINE` compara los cambios de archivos ya seguidos, aunque hayas creado commits; sustituye BASELINE por el SHA anterior. Los ficheros nuevos solo aparecen después de añadirlos con `git add ruta/del/archivo`. Si ya están guardados, `git diff BASELINE..HEAD` compara ambos cortes. Un diff vacío sin comprobar la base no demuestra que no hubo cambios. Sin acceso remoto, D07 sigue siendo un borrador de PR; el repositorio local y el patch son suficientes para preparar la revisión.

## 5. Fuentes de consulta y privacidad

Edición verificada con Flutter 3.47.8 / Dart 3.13.7, el parche que ya utiliza PM5. Se conserva la serie 3.47 para no introducir cambios de API durante la unidad. El [aviso oficial del SDK](https://github.com/dart-lang/sdk/security/advisories/GHSA-frr6-h895-5pxp) justifica el parche de mantenimiento. No ejecutas `pub upgrade` ni añades paquetes para esta funcionalidad.


- [Flutter: instalación](https://docs.flutter.dev/get-started/install), [testing](https://docs.flutter.dev/testing/overview) y [Android](https://docs.flutter.dev/deployment/android).
- [GitHub: pull requests y revisión](https://docs.github.com/en/pull-requests): una PR propuesta no es una aprobación.
- El SDK Flutter usa licencia BSD de tres cláusulas. Los datos del starter son DEMO; no añadas cuentas, red, secretos, datos personales ni paquetes de búsqueda.
- La secuencia SDD y S1–S7 son diseño docente del caso. No constituyen aceptación de AulaFlow ni CE nuevos.

**Rescate:** comparte con el docente solo fase, SO/editor, comando, primer error y comprobación intentada; elimina tokens, seriales, rutas privadas y conversaciones ajenas. No conviertas una propuesta de herramienta en comando ejecutado.
