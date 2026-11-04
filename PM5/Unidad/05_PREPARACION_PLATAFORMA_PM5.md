# PM5 · Preparación de plataforma sin perderse

## Objetivo

Al terminar esta preparación tendrás una copia del starter ejecutándose en **modo DEMO**. Después decidirás si tu equipo permite añadir el carril Android real.

No intentes resolver todo el hardware antes de ver la app. Primero logra una microvictoria reproducible; luego prepara AVD o móvil cuando la Ruta lo pida.

## 1. Elige editor e identifica para qué sirve cada herramienta

| Herramienta | Uso en PM5 | Opción recomendada |
|---|---|---|
| VS Code | editar Dart, terminal, análisis y tests | recomendado si ya lo usas en PM1–PM4 |
| Android Studio | editar si lo prefieres; gestionar Android SDK y AVD | necesario para SDK Manager/Device Manager |
| Flutter SDK | compilar y ejecutar la app | versión del curso, 3.47.8 stable |
| Dart SDK | lenguaje y formateo | incluido con Flutter, 3.13.7 |
| AVD | Android virtual dentro del ordenador | útil para app/permisos/lifecycle parciales |
| dispositivo físico | Android real por USB | necesario para evidencia física que el AVD no pueda demostrar |
| periférico BLE de aula | anuncia servicio y característica GATT | necesario solo para BLE físico |

No instales otra versión de Flutter para «probar si funciona». Si tu versión no coincide, conserva la salida y usa el mecanismo de versión indicado por el curso.

## 2. Comprueba el entorno antes de abrir el proyecto

Abre una terminal normal. No necesita estar todavía dentro del starter.

```bash
flutter --version
dart --version
flutter doctor -v
flutter devices
```

Debes comprobar:

- `flutter --version` muestra Flutter 3.47.8 y Dart 3.13.7;
- `flutter doctor -v` identifica cada problema por bloque;
- `flutter devices` muestra al menos un destino cuando vayas a ejecutar.

Si `flutter` no se reconoce, el SDK no está en `PATH`. Usa la instalación oficial del sistema operativo y añade la carpeta `flutter/bin` al PATH siguiendo la guía del curso. Cierra y vuelve a abrir terminal/editor antes de repetir. No envíes capturas que muestren tu nombre de usuario o rutas personales completas.

### Instalación mínima si todavía falta algo

1. Descarga el Flutter SDK desde la fuente oficial enlazada por el curso.
2. Descomprime en una ruta estable y con permisos de escritura; evita carpetas temporales.
3. Añade `flutter/bin` al PATH de tu usuario.
4. Instala VS Code y las extensiones oficiales **Flutter** y **Dart**, o Android Studio con esos plugins.
5. Instala Android Studio desde su fuente oficial.
6. En **SDK Manager**, instala el Android SDK y Platform-Tools del curso; para el carril BLE prepara una imagen/plataforma API 31 o superior.
7. Ejecuta de nuevo `flutter doctor -v` y resuelve el **primer** bloque rojo, no todos a la vez.

Los enlaces externos complementan esta guía; los pasos y checkpoints que debes seguir están aquí.

## 3. Haz una copia de trabajo del starter

En el material PM5 localiza:

```text
30 - PMDM/Unidades/PM5/
└── Practica/
    └── Starter/
        └── aulaflow_device_media_starter/
            ├── pubspec.yaml
            ├── lib/
            └── test/
```

Descarga el paquete de materiales y conserva la raíz **PM5/**. Desde ella ejecuta:

```bash
dart run Alumnado/preparar_pm5.dart starter
cd Practica/Starter/aulaflow_device_media_starter
```

El preparador materializa Android/web sin sustituir fuentes o pruebas, conserva las reglas de análisis y retira solo el test ajeno que Flutter genera. Abre esta carpeta con `pubspec.yaml` en el editor. Para el ejemplo guiado, vuelve a PM5/ y elige `ejemplo`; consulta su README. El helper del ejemplo aplica también las capacidades del manifiesto y el puente BLE fijado en el curso: no necesitas copiar archivos docentes ni editar caches a mano.

## 4. Microvictoria en carril A · DEMO / FAKE

Desde la carpeta con `pubspec.yaml`:

```bash
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run -d chrome
```

Si aparecen varios destinos, Flutter te permite elegir. Chrome es suficiente para esta primera victoria porque los puertos usados son fakes.

En la app:

1. comprueba el título **PM5 · Starter DEMO**;
2. pulsa **Escanear DEMO** y espera `Periférico DEMO`;
3. pulsa **Iniciar sensor DEMO** y observa que cambia `x=`;
4. pulsa **Procesar fixture DEMO** y observa tipo/tamaño.

Guarda:

- versiones, sin rutas personales;
- destino usado;
- resultado de analyze/test;
- cuatro resultados visibles;
- estado `OBSERVADA_FAKE_TEST`.

Si esto funciona, el proyecto base está vivo. Todavía no has pedido permisos ni demostrado hardware.

## 5. Añade dependencias cuando llegue su hito

El starter inicial incluye Flutter e `image` para generar un PNG válido. No añadas siete plugins antes de la microvictoria.

### Carril DEMO con conversión real

El procesador `image` ya figura en el starter. Comprueba la dependencia antes de modificarlo:

```bash
flutter pub add image:4.9.2
flutter pub get
```

Los puertos/fakes de permiso, BLE, sensor, almacenamiento y player pueden practicarse sin plugin físico.

### Carril Android real

El ejemplo Android ya declara estas dependencias fijadas. Si las llevas al producto del starter, añade únicamente las de las features que vas a observar:

```bash
flutter pub add permission_handler:12.0.3
flutter pub add flutter_reactive_ble:5.5.0
flutter pub add sensors_plus:7.1.0
flutter pub add image_picker:1.2.3
flutter pub add path_provider:2.1.6
flutter pub add just_audio:0.10.6
flutter pub get
```

Después de cada grupo ejecuta `flutter analyze` y `flutter test`. Las versiones y el motivo de cada paquete están en Referencias. No uses `flutter pub upgrade` para sustituir el baseline durante la unidad.

## 6. Prepara un AVD cuando lo necesites

Un AVD es un dispositivo Android virtual. Se ejecuta en tu ordenador y consume memoria, CPU y espacio.

1. Abre Android Studio.
2. Ve a **Tools → Device Manager**.
3. Selecciona **Create device**.
4. Elige un perfil de teléfono del curso.
5. Descarga/selecciona una imagen Android API 31 o superior.
6. Termina el asistente e inicia el AVD.
7. Espera a que aparezca la pantalla de inicio.
8. Comprueba:

```bash
flutter devices
adb shell getprop ro.build.version.release
adb shell getprop ro.build.version.sdk
```

El último comando debe devolver `31` o superior si quieres ensayar la frontera Android 12+.

### Qué puede y qué no puede acreditar el AVD

| AVD puede ayudar a | AVD no certifica por sí solo |
|---|---|
| instalar/arrancar la app | radio BLE y conexión con un periférico físico |
| observar parte de permisos y lifecycle | sensor físico real |
| ensayar selección de archivos/cámara virtual según configuración | cámara/lost-data físicos de tu dispositivo |
| ejecutar conversión, almacenamiento y player | comportamiento de todo el hardware real |

Los controles de sensores/cámara del emulador varían según imagen y equipo. Si no están disponibles, no es un fracaso de aprendizaje: usa DEMO y registra `PENDIENTE_HARDWARE`.

## 7. Prepara un dispositivo físico sin exponer datos

1. Comprueba en **Ajustes → Información del teléfono → Versión de Android** que utiliza Android 12 o superior para BLE PM5.
2. Activa las opciones de desarrollador y **Depuración USB** siguiendo el procedimiento del fabricante/centro.
3. Conecta por USB y acepta la huella del ordenador solo si es un equipo autorizado.
4. Ejecuta:

```bash
adb devices
adb shell getprop ro.build.version.release
adb shell getprop ro.build.version.sdk
flutter devices
```

Para BLE físico, el SDK debe indicar `31` o superior. La app puede instalarse desde API 24, pero PM5 no promete BLE físico en API 24–30 porque requeriría un carril legacy con ubicación runtime que no forma parte de la unidad.

No entregues número de serie de `adb devices`, nombre del teléfono, cuenta, capturas de Ajustes ni rutas personales. Registra solo «Android API 31+ detectado» o el valor de API sin identificadores.

## 8. Comprueba el periférico BLE de aula

Antes del carril real confirma con el docente:

- periférico disponible;
- servicio/característica del protocolo de aula;
- comando mínimo `DEMO-PING` o equivalente;
- política de préstamo/turno.

No guardes MAC ni UUID de instancia en Git, AULES, logs o capturas. La solución usa configuración didáctica y redacta el id.

Si no hay periférico:

1. realiza scan/conexión/intercambio con `FakeBlePort`;
2. conserva el comportamiento y los errores;
3. marca `PENDIENTE_HARDWARE` solo en BLE físico;
4. agenda la observación posterior. No bloquees sensor, media o audio.

## 9. Permisos que PM5 sí y no necesita

| Feature | Permiso/capacidad | Momento |
|---|---|---|
| scan BLE | `BLUETOOTH_SCAN` | al pulsar buscar |
| conexión BLE | `BLUETOOTH_CONNECT` | al conectar |
| cámara | `CAMERA` | al pulsar capturar |
| selector de imagen | selector del sistema según plataforma | al elegir imagen |
| sensor | disponibilidad del hardware | al iniciar stream |
| audio DEMO | reproducción de WAV local | no necesita micrófono |

PM5 no pide `MANAGE_EXTERNAL_STORAGE`, ubicación en background ni micrófono. Una denegación afecta a su feature: denegar cámara no apaga BLE o sensor.

## 10. Fixtures y privacidad

Usa:

- `DEMO-PNG-01`;
- `DEMO-CORRUPT-01`;
- `DEMO-TOO-LARGE-01`;
- `DEMO-TONE.wav`;
- trazas de sensor preparadas;
- para cámara real, una tarjeta/escena neutra `DEMO-OBJECT`.

No uses fotos, audio, ubicación, nombres o cuentas personales. Elimina el archivo físico de prueba cuando termine la verificación si así lo indica la política del centro.

## 11. Diagnóstico rápido de entrada

| Síntoma | Comprueba primero | Rescate |
|---|---|---|
| `flutter` no existe | PATH y nueva terminal | corrige PATH; no reinstales todo |
| no hay dispositivos | `flutter devices` y AVD iniciado/USB autorizado | usa Chrome/escritorio para DEMO |
| AVD no inicia | virtualización, espacio y primer error | dispositivo físico o DEMO temporal |
| API menor de 31 | `getprop ro.build.version.sdk` | DEMO para BLE; otras features pueden seguir |
| BLE no ready | radio, permisos y API | no repitas scan; registra y usa fake |
| no hay periférico | disponibilidad de aula | fake + `PENDIENTE_HARDWARE` |
| Gradle falla | primer error, red/espacio/JDK de Flutter | corrige una causa y repite |
| test/analyze falla | primer diagnóstico y fichero/línea | vuelve al baseline antes de hardware |

Cuando el starter DEMO arranca y sabes qué carril utilizarás, continúa con permisos y lifecycle.

