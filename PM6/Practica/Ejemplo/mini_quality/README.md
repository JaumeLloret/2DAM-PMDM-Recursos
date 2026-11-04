# Reservas · ejemplo ejecutable PM6

Este ejemplo público enseña a leer una prueba unitaria y una de widget. No es la solución de Quality Gate y no se entrega. Trabaja unos 15 minutos dentro de A02, sustituyendo parte de la lectura, sin añadir horas.

1. Descomprime `PM6_EJEMPLO.zip` en `mini_quality` y abre esa carpeta en el IDE. Usa Flutter 3.47.8 / Dart 3.13.7.
2. Ejecuta `flutter pub get`, `flutter analyze --fatal-infos` y `flutter test --reporter expanded`. Esperas tres pruebas verdes; guarda tu resultado si necesitas pedir ayuda.
3. Abre `lib/main.dart`: `availableSeats(3, 1)` devuelve 2. En `test/seat_test.dart`, localiza preparación, acción y aserción. Predice qué test fallaría si la resta sumara. Haz ese cambio temporal, ejecuta, lee el primer fallo y restaura la resta.
4. Lee la prueba widget: montar, pulsar, reconstruir y comprobar texto. Modifica el ejemplo para cuatro plazas y actualiza las expectativas que correspondan; explica qué contrato conserva el botón cuando el aforo está completo. No copies esta regla al contador de trabajos: cambia el dominio y las entradas.
5. Para ver la app ejecuta `python3 tool/prepare_platform.py web`, `flutter pub get` y `flutter run -d chrome`. En Windows puedes usar `py -3` en lugar de `python3`.

Una prueba unitaria verde no demuestra que el botón esté conectado. La prueba widget sí comprueba su interacción en host, pero ninguna demuestra instalación en un móvil. Ahora vuelve a E1 de Quality Gate y escribe su predicción con A abierta, B terminada y C abierta.
