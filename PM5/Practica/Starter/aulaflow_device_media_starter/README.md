# Device Media · starter DEMO de PM5

Este proyecto arranca con puertos y fakes locales. Los botones representan estados de cámara, BLE, sensor y media; todavía no usan esas capacidades físicas. Tu trabajo es desarrollar la integración del laboratorio con evidencia honesta de cada entorno.

## Preparar una copia de trabajo

Utiliza el Flutter/Dart fijado para la unidad. Copia este directorio fuera de la biblioteca y abre una terminal dentro de tu copia:

```bash
flutter create . --platforms=android --project-name aulaflow_device_media_starter
flutter pub get
flutter analyze
flutter test test/starter_test.dart
flutter run
```

Conserva los archivos [lib/](lib), [test/starter_test.dart](test/starter_test.dart) y [pubspec.yaml](pubspec.yaml) del starter al materializar la plataforma. Si Flutter crea `test/widget_test.dart` de la plantilla contador, elimínalo de tu copia: prueba una aplicación distinta. No cambies el nombre del paquete, porque el test lo importa.

Resultado: título «PM5 · Starter DEMO», estado «Listo en modo DEMO» y botones de acción. El test comprueba el arranque y la presencia del botón de permiso; no acredita permisos o hardware reales.

## Qué leer

`main.dart` conecta puertos DEMO con `DeviceController`; `device_ports.dart` define contratos y `demo_fakes.dart` permite observar respuestas locales. Sigue los requisitos del [laboratorio](../../../Unidad/06_LABORATORIO_PM5.md) y la [preparación de plataforma](../../../Unidad/05_PREPARACION_PLATAFORMA_PM5.md).
