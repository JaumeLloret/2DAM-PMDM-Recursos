# Adaptive navigation example

Ejemplo mínimo y ejecutable: los mismos tres destinos aparecen en una `NavigationBar` en espacio compacto y en una `NavigationRail` desde 600 píxeles lógicos. El contador es estado local porque solo importa a su pantalla.

## Abrir y ejecutar

Abre esta carpeta —la que contiene `pubspec.yaml`— en VS Code o Android Studio. Desde una terminal situada aquí:

```bash
flutter create . --platforms=android --project-name adaptive_navigation_example
flutter pub get
flutter analyze
flutter test
flutter run
```

Estado esperado: tres destinos; bar por debajo de 600 px, rail desde 600 px y contador funcional.

## Práctica breve

1. Predice la navegación a 599 y 600 px.
2. Ejecuta a 390 × 800 y 900 × 700.
3. Cambia temporalmente el breakpoint a 720.
4. Verifica que selección, iconos, etiquetas y orden coinciden.
5. Explica qué anchura resulta más cómoda para estas etiquetas.

La frontera de 600 es una decisión basada en espacio disponible, no una clasificación universal de dispositivos.
