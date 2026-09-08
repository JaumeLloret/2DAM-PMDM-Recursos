# Adaptive navigation example

Ejemplo mínimo de PM3: las mismas tres destinaciones se representan mediante
`NavigationBar` en espacio compacto y `NavigationRail` cuando el contenedor
dispone de 600 píxeles lógicos o más. El estado del contador es efímero y por
eso vive localmente con `setState`.

```bash
flutter create . --platforms=android --project-name adaptive_navigation_example
flutter pub get
flutter analyze
flutter test
flutter run
```

La frontera de 600 es una decisión del ejemplo basada en espacio disponible,
no una clasificación universal de dispositivos.

