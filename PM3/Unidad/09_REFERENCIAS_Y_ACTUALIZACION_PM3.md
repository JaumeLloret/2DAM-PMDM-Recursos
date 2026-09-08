# Referencias y actualización · PM3

Baseline comprobado el **05/09/2026**:

- Flutter stable/documentación: **3.47.2**;
- Dart incluido: **3.13.2**;
- `go_router`: **18.0.1**;
- `provider`: **6.1.5+1**.

## Fuentes primarias

- [Guía oficial de arquitectura Flutter](https://docs.flutter.dev/app-architecture/guide)
- [Recomendaciones de arquitectura](https://docs.flutter.dev/app-architecture/recommendations)
- [Enfoque general para apps adaptables](https://docs.flutter.dev/ui/adaptive-responsive/general)
- [Accesibilidad en Flutter](https://docs.flutter.dev/ui/accessibility)
- [NavigationBar API](https://api.flutter.dev/flutter/material/NavigationBar-class.html)
- [NavigationRail API](https://api.flutter.dev/flutter/material/NavigationRail-class.html)
- [go_router 18.0.1](https://pub.dev/packages/go_router)
- [provider 6.1.5+1](https://pub.dev/packages/provider)

## Decisiones de baseline

- Material 3 activo mediante `useMaterial3: true`.
- `LayoutBuilder` para constraints locales y `MediaQuery.sizeOf` solo cuando
  interese la ventana completa.
- 600 px en el laboratorio como decisión de caso.
- navegación declarativa por id con `go_router`.
- `ChangeNotifier` + provider como mecanismo pequeño y observable.
- View/ViewModel + Repository fake; cero Services porque no existe fuente externa.

## Protocolo de reconfirmación prepublicación

1. Ejecutar `flutter --version` y guardar salida.
2. Revisar breaking changes de stable y guías de migración de `go_router`.
3. Ejecutar `flutter pub outdated`; actualizar solo con rama/validación.
4. Materializar Android, `pub get`, `analyze`, `test` y build debug.
5. Probar AVD/equipo equivalente, 390/900 px, texto grande y teclado.
6. Si cambia una API, actualizar código, teoría, capturas, XML y registro.

## Caducidad

La versión es evidencia del corte de producción, no una promesa eterna. AULES no
debe publicar «última versión» sin reconfirmar poco antes de impartir.

