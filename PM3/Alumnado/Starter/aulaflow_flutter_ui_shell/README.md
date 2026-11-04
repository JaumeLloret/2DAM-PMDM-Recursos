# AulaFlow Flutter UI Shell · starter

Este starter funciona con datos locales `DEMO-*` y permite recorrer Tareas, Tablero, Ajustes y un detalle. Contiene deudas intencionales que resolverás por hitos; no contiene la solución.

## Abre el proyecto correcto

En VS Code usa **Archivo → Abrir carpeta** y selecciona esta carpeta, la que contiene `pubspec.yaml`. En Android Studio usa **Open** y selecciona la misma carpeta. No abras solo `lib/main.dart`.

## Primera ejecución

Desde esta carpeta:

```bash
flutter create . --platforms=android --project-name aulaflow_flutter_ui_shell_starter
flutter pub get
```

Antes de analizar, revisa `test/widget_test.dart` como se explica abajo. Después ejecuta:

```bash
flutter analyze
flutter test
flutter run
```

Si ya existe `android/`, omite `flutter create`. La app debe mostrar **AulaFlow UI starter**, tres destinos y tareas `DEMO-*`.

## Después de cada `flutter create`: revisa el test de plantilla

En la creación normal del proyecto, Flutter puede volver a generar `test/widget_test.dart` con la prueba de su aplicación de contador. Esto también puede ocurrir al añadir una plataforma más adelante, por ejemplo Windows. **Repite esta revisión después de cada `flutter create`**, aunque ya hubieras retirado la plantilla en Android.

1. Abre `test/widget_test.dart`, si existe.
2. Comprueba que es la plantilla del contador: referencia a `MyApp`, búsqueda de los textos `0` y `1` y pulsación del icono `Icons.add`.
3. Solo si sigue siendo esa plantilla ajena al starter, elimina ese archivo desde el editor. No borres toda la carpeta `test/`.
4. Conserva `test/starter_smoke_test.dart` y todas las pruebas que hayas escrito o adaptado.
5. Ejecuta `flutter analyze` y `flutter test`. El fallo que quede debe leerse por su archivo y línea; no lo atribuyas automáticamente a la plantilla.

Si ya has convertido `widget_test.dart` en una prueba propia, consérvala y corrige lo que corresponda. Este procedimiento no cambia las deudas didácticas del starter.

## Deudas que debes localizar

- siempre usa navegación compacta aunque haya espacio ancho;
- lista, filtro y cambio de estado viven dentro de una vista;
- la vista conoce directamente los fixtures;
- el filtro se calcula durante `build`;
- el detalle recibe un mapa mutable mediante `extra`;
- el control cambia el estado sin confirmación ni feedback.

Antes de editar, predice qué ocurrirá a 390 y 900 px, navega a un detalle y conserva una copia segura. Después sigue los hitos de `Unidad/05_LABORATORIO_PM3.md`.

No añadas red, autenticación, persistencia, sensores, multimedia ni una arquitectura mayor que el problema. Conserva todos los ids `DEMO-*`.
