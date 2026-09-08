# Mobile Profile Lab · starter

App Flutter pequeña para PM1. Tiene tres archivos Dart relevantes y datos estáticos. No es el cliente real de AulaFlow 2.0.

## Preparar Android

Hazlo en una copia:

```bash
flutter create . --platforms=android --org es.aulaflow.lab
flutter pub get
flutter analyze
flutter test
flutter run
```

Flutter 3.47+/Dart 3.13+ materializa el scaffold de plataforma. La carpeta `android/` generada no se incluye para evitar fijar boilerplate dependiente del SDK antes de la prepublicación.

## Punto de lectura

`lib/main.dart → ProfileLabApp → ProfileScreen → MobileProfile`

La decisión está deliberadamente incompleta. Sigue el laboratorio; un cambio de color o texto aislado no resuelve el reto.


