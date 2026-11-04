# spec_search · starter público

Flutter 3.47.8, Dart 3.13.7. Proyecto local, datos DEMO, sin servicio ni persistencia. Ejecuta `flutter pub get`, `flutter analyze --fatal-infos` y `flutter test`. El starter funciona como catálogo de partida y aún no implementa la feature. Su smoke test no es la aceptación de la feature.

Para abrir la app prepara primero la plataforma con `python preparar_plataformas.py web` (`py -3` en Windows) y ejecuta `flutter run -d chrome`. Sin Chrome: `flutter run -d web-server` y abre la dirección local que muestre. Para Android: `python preparar_plataformas.py android`, `flutter devices` y `flutter run -d ID_LOCAL`. Sustituye ID_LOCAL por el destino que realmente aparece; para compilar: `flutter build apk --debug`. El preparador genera solo carpetas de plataforma ausentes y conserva código, tests y lock. Python 3 debe estar instalado; consulta Entorno si falta.

Trabaja en una rama propia con proceso documentado. No incluyas soluciones docentes ni secretos en contexto de agente. El código y los datos son originales de la campaña; las dependencias conservan sus licencias.
