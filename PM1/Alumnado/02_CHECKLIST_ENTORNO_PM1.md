# Checklist de entorno · Flutter + Android

## A. Inventario

- [ ] SO y arquitectura identificados.
- [ ] al menos 12 GB libres recomendados para SDK/imagen/cachés.
- [ ] virtualización activada o equipo alternativo reservado.
- [ ] conexión disponible para descarga inicial.

El espacio es una previsión operativa, no un mínimo oficial universal. Registra el real.

## B. Flutter

- [ ] he seguido https://docs.flutter.dev/install para mi SO.
- [ ] he elegido canal `stable`.
- [ ] `flutter/bin` está en `PATH`.
- [ ] una terminal nueva reconoce:

```bash
flutter --version
dart --version
```

Dart viene incluido con Flutter; no instales otro Dart para «corregir» una incompatibilidad sin diagnosticar.

## C. Android

- [ ] última Android Studio estable instalada.
- [ ] SDK Platform indicada por el docente instalada.
- [ ] Android SDK Build-Tools.
- [ ] Android SDK Command-line Tools.
- [ ] Android Emulator.
- [ ] Android SDK Platform-Tools.
- [ ] CMake.
- [ ] NDK (Side by side).
- [ ] licencias revisadas/aceptadas:

```bash
flutter doctor --android-licenses
```

## D. AVD

- [ ] Device Manager abre.
- [ ] imagen corresponde a arquitectura del host.
- [ ] aceleración hardware seleccionada.
- [ ] el AVD arranca hasta el escritorio.
- [ ] no contiene cuentas ni datos personales.

## E. Validación

```bash
flutter doctor -v
flutter emulators
flutter devices
```

- [ ] Android toolchain no muestra bloqueo.
- [ ] `flutter emulators` lista el AVD.
- [ ] `flutter devices` lista un target Android cuando el AVD está encendido.

## F. Proyecto

En una copia del starter:

```bash
flutter create . --platforms=android --org es.aulaflow.lab
flutter pub get
flutter analyze
flutter test
flutter run -d <ID_EMULADOR>
```

- [ ] `android/` se ha generado.
- [ ] analyzer termina sin incidencias.
- [ ] test termina correctamente.
- [ ] la app aparece en el AVD.

## Diagnóstico

| Estado | Condición | Acción |
|---|---|---|
| verde | todo lo anterior | continuar |
| ámbar | Flutter funciona, Android incompleto | resolver componente concreto |
| rojo | PATH/virtualización/hardware bloquea | registrar y usar contingencia |

### Registro breve

```text
Estado:
Comando:
Salida útil:
Hipótesis:
Acción:
Nueva salida:
```

Una web abierta o un móvil físico no sustituyen la ejecución exigida en emulador.

