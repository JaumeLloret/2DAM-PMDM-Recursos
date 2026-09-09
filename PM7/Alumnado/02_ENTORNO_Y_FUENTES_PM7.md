# Entorno y consulta · PM7

Flutter 3.47.2 y Dart 3.13.2 fijados como en PM6, DevTools 2.60.0. Flutter framework d3b14c876900e553bc736ca19295fc09e3853e8e, engine a804b261645ef8c13eb3d5c44a5c2fb0340c5539. Revalidación 07/09/2026; conserva pubspec.lock. El SDK Flutter usa licencia BSD de tres cláusulas. Código y datos DEMO originales de campaña, sin assets externos ni paquetes de búsqueda.

Abre una copia propia del starter spec_search; ejecuta `flutter pub get`, `flutter analyze --fatal-infos` y `flutter test`. El baseline muestra catálogo y su smoke test no verifica la feature. Para formato: `dart format lib test`. No cambies versiones para perseguir avisos de actualización si el entorno fijado resuelve dependencias.

Android es un destino de verificación heredado, no contenido nuevo de PM7. En una copia de trabajo genera `flutter create --platforms=android --org org.aulaflow.training .`; conserva lib/test/integration_test/pubspec/lock de la práctica y retira solo el test de contador generado si aparece. Verifica JDK 17 y Android SDK con `flutter doctor -v`; `flutter build apk --debug` produce artefacto de entrenamiento. Con emulador autorizado: `flutter test integration_test/flow_test.dart -d <ID_LOCAL>`. No publicar ID local ni inferir dispositivo físico de un build.

La herramienta de agente depende de la disponibilidad autorizada del centro. La unidad enseña alcance, contexto, ejecución y revisión con cualquier herramienta que permita esas operaciones; no prescribe una cuenta de pago ni un proveedor. Modo MANUAL mantiene todas las decisiones, tareas y evidencias. Un proveedor y versión solo se anotan cuando se han utilizado realmente. La configuración CI usa CI=true y FLUTTER_SUPPRESS_ANALYTICS=true.

Fuentes oficiales de consulta, comprobadas durante producción:

- [PR y revisión de cambios en GitHub](https://docs.github.com/en/pull-requests/reference/pull-requests): distingue propuesta, cambios, checks y revisión antes de merge.
- [Tipos de pruebas Flutter](https://docs.flutter.dev/testing/overview): delimita qué observan los tests reutilizados de PM6.
- [Pruebas de integración Flutter](https://docs.flutter.dev/testing/integration-tests): ejecución en un destino de sistema disponible.
- [Despliegue Android](https://docs.flutter.dev/deployment/android): requisitos y empaquetado de entrenamiento.

Las reglas SDD del caso y su secuencia son diseño docente propio basado en el encargo canónico, no una transcripción de una guía comercial. La teoría de esta unidad permite completar la ruta sin perseguir tutoriales externos.
