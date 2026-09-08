# Starter · AulaFlow Flutter Data Client

Este proyecto funciona parcialmente: login y listado remoto. La frontera es remote-only, la sesión vive en memoria, no hay timeout/cache/preferencia persistente y todos los fallos comparten mensaje. Son deudas plausibles, no huecos con la solución escrita.

```bash
dart run ../../../Recursos/API/demo_api.dart --port=8080
flutter create . --platforms=android --project-name aulaflow_flutter_data_client_starter
flutter pub get
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

Completa desde contrato, teoría y criterios del laboratorio. No copies una arquitectura ceremonial.

