# Starter · AulaFlow Flutter Data Client

Este proyecto funciona parcialmente: login y listado remoto. La frontera es remote-only, la sesión vive en memoria, no hay timeout/cache/preferencia persistente y todos los fallos comparten mensaje. Son deudas plausibles, no huecos con la solución escrita.

Usa dos terminales. En la **terminal 1**, desde esta carpeta, arranca la API y
déjala abierta:

```bash
dart run ../../../tools/demo_api.dart --port=8080
```

Debes ver `PM4_DEMO_API_READY http://127.0.0.1:8080`. Comprueba
`http://127.0.0.1:8080/health` antes de abrir Flutter.

En la **terminal 2**, desde esta carpeta que contiene `pubspec.yaml`:

```bash
cd ../../..
dart run tools/preparar_proyecto.dart starter
cd Alumnado/Starter/aulaflow_flutter_data_client
flutter analyze
flutter test
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

La URL anterior es para Android Emulator. Para Chrome, el preparador ya genera
`web/`: ejecuta `flutter run -d chrome --dart-define=API_BASE_URL=http://127.0.0.1:8080`.
En dispositivo físico consulta la Ruta PM4: requiere
una red autorizada y una escucha temporal limitada al entorno local.

Completa desde contrato, teoría y criterios del laboratorio. No copies una arquitectura ceremonial.

El preparador conserva las fuentes y las pruebas originales; no tienes que eliminar tests por tu cuenta. El ejemplo público `Alumnado/Ejemplos/pm4_datos_guiados/` permite estudiar clases y pruebas completas antes de aplicarlas a este starter.

Si `health` funciona pero la app no conecta, revisa primero destino y URL
efectiva. Si `health` no funciona, el problema todavía no está en Flutter.
