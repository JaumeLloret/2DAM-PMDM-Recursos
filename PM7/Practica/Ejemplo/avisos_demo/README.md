# Avisos DEMO · ejemplo completo de PM7

Este ejemplo enseña el recorrido. No es el producto que entregas. Usa datos sintéticos y Flutter 3.47.8 / Dart 3.13.7. No requiere cuenta, red de datos propia ni paquetes externos.

## Especificación y decisión

Necesidad: ver los avisos de una prioridad mínima y ocultar los ya leídos. ¿Prioridad exacta o mínima? Para el ejemplo se acuerda mínima inclusiva. ¿Restablecer borra todo? Solo devuelve prioridad a 1 y conserva ocultar leídos. La fuente y el orden no cambian. Prioridad 3 y ocultar leídos → AV-A; prioridad 3 sin ocultar → AV-A, AV-C. Son decisiones didácticas, no una aceptación real de usuarios.

## Ejecuta y observa

Abre esta carpeta, donde está `pubspec.yaml`. En Windows sustituye `python` por `py -3` si procede. Python 3 solo prepara las plataformas, Flutter ejecuta la app.

```sh
flutter pub get
flutter analyze --fatal-infos
flutter test
python preparar_plataformas.py web
flutter run -d chrome
```

Esperas tres avisos y `3 de 3`. Activa Ocultar leídos, elige Prioridad 3 o más: queda Preparar el equipo y `1 de 3`. Restablecer prioridad mantiene Ocultar leídos: aparecen dos avisos. Si no dispones de Chrome, usa `flutter run -d web-server` y abre la dirección local que muestre tu terminal. Un navegador comprueba esta UI; no simula Android ni acredita hardware físico.

## Archivos, tarea y verificación

`lib/notices.dart` contiene datos y `selectNotices`: función pura sin estado de UI. `lib/main.dart` guarda prioridad/ocultar y calcula la lista; usa `Expanded` para dar altura al listado. `test/notices_test.dart` ejecuta tres pruebas: combinación, fuente intacta e interacción de restablecer. No se guarda una segunda lista mutable.

En A02 basta ejecutar y comprender el ejemplo correcto. El contraste con OR se realiza una sola vez en los 15 minutos iniciales de T1 mediante `ensayo_agente.py`, siguiendo el libro «Trabaja con un agente» de AULES: predicción, test débil verde, expectativa independiente roja y corrección a AND. No hagas además otra mutación manual del ejemplo original. Registra lo que ejecutaste, con corte local; este README no es una prueba ejecutada por ti. Para revisar, compara el cambio con tu copia guardada o con `git diff`.

## Traspaso

Sin persistencia, cuentas, red ni cambios asíncronos. No mide rendimiento. Trasladar a Consulta DEMO significa mantener la cadena requisito→decisión→archivo→prueba→resultado; debes diseñar la búsqueda y escribir tu propio código. Los datos y el código son originales del curso; Flutter y dependencias mantienen sus licencias. No envíes datos de compañeros a herramientas externas.
