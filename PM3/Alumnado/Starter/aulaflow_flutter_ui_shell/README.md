# AulaFlow Flutter UI Shell · starter

Este starter **funciona**, usa datos locales `DEMO-*` y permite recorrer tres
destinos y un detalle. No contiene la solución del laboratorio.

Deudas intencionales que debes localizar y resolver con decisiones justificadas:

- siempre usa navegación compacta aunque haya espacio ancho;
- la lista, el filtro y el cambio de estado viven dentro de una vista;
- la vista conoce directamente los fixtures;
- el filtro se calcula durante `build`;
- el detalle recibe un mapa mutable completo mediante `extra`;
- el control de cambio no pide confirmación ni ofrece feedback.

```bash
flutter create . --platforms=android --project-name aulaflow_flutter_ui_shell_starter
flutter pub get
flutter analyze
flutter test
flutter run
```

No añadas red, autenticación, persistencia, sensores ni una arquitectura mayor
que el problema. Conserva todos los ids `DEMO-*`.

