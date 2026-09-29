# Quality Gate · Starter

Flutter 3.47.2 / Dart 3.13.2. Fuente docente sin Android generado ni dependencias remotas de servicios. Desde esta carpeta: `flutter pub get`, `flutter analyze`, `flutter test`. Para Android, `flutter create --platforms=android --org org.aulaflow.training --project-name quality_gate .`, revisa el diff y ejecuta `flutter build apk --debug`. No sustituyas lib/ por la plantilla de ejemplo.

El starter arranca con defectos intencionales y prueba de humo; no se afirma que sus comportamientos sean correctos. La solución y sus pruebas son material docente reservado. `integration_test` necesita emulador/dispositivo; no se presenta como ejecutada si solo se ejecuta `flutter test`. Datos DEMO, sin red ni permisos sensibles.
