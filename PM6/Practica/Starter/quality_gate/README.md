# Quality Gate · proyecto inicial PM6

Flutter 3.47.8 / Dart 3.13.7. Descomprime el ZIP en una carpeta llamada `quality_gate`, abre esa carpeta y ejecuta `flutter pub get`, `flutter analyze --fatal-infos`, `flutter test test/smoke_test.dart`. El humo debe pasar; el proyecto tiene defectos didácticos deliberados.

Para E1 copia `guided/guided_example_test.dart` a `test/guided_example_test.dart`. Ejecuta `flutter test test/guided_example_test.dart --reporter expanded`: ambas aserciones deben fallar por el contador. Después de corregirlo deberán pasar. No copies este test antes de guardar el humo inicial.

`python3 tool/prepare_platform.py android,web` genera solo las carpetas de plataforma que faltan, sin modificar código ni tests. En Windows puede usarse `py -3`. Con `flutter run -d chrome` puedes observar UI DEMO. Para Android sigue la guía de entorno de AULES. Profile requiere móvil físico; el emulador Android se usa en debug para interacción.

La comparación de listas usa `--dart-define=EAGER_LIST=true` o `false` al arrancar. Solo cambia la estrategia de construcción; conserva datos, modo y recorrido. No atribuyas a una compilación pruebas en hardware que no hayas observado.

Entrega tu reparación, sus regresiones y un dossier. El ejemplo de reservas es de consulta y no sustituye tu producto. Nunca incluyas cachés, keystores, cuentas, tokens ni seriales en la entrega.
