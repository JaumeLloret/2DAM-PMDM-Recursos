# PM5 · Starter que vas a completar

Trabaja desde el paquete PM5 completo. En su raíz ejecuta `dart run Alumnado/preparar_pm5.dart starter`. Después abre `Practica/Starter/aulaflow_device_media_starter/`, la carpeta con `pubspec.yaml`, en VS Code o Android Studio.

```bash
flutter analyze
flutter test
flutter run -d chrome
```

Android/web ya están preparados. El helper conserva las fuentes y tests del paquete; no borres pruebas para hacer que pase el baseline.

Escanear DEMO muestra un periférico, iniciar sensor cambia x y procesar fixture muestra un PNG válido. La conversión todavía devuelve la entrada: ese TODO se trabaja en E11/K10. El modo inicial no usa hardware.

`device_ports.dart` define permisos/BLE/sensor/media; `demo_fakes.dart` implementa el arranque; `device_controller.dart` contiene las mejoras previstas; `main.dart` conecta acciones y pantalla. `media_contracts.dart` aporta contratos para extender captura, almacenamiento, borrador y audio. `fixtures.dart` genera imágenes y tono reproducibles.

Abre `Alumnado/06_RECORRIDOS_GUIADOS_PM5.md` desde la raíz PM5. Los ejemplos que sí puedes ejecutar están en `Practica/Ejemplos/pm5_capacidades_guiadas/`; su README indica qué clase y test corresponde a cada actividad. Completa el laboratorio sobre este starter, conservando tu diff y un único cuaderno.

## Estudia el ejemplo en otra carpeta

Vuelve a la raíz `PM5/` en otra terminal. Prepara el ejemplo y entra en su carpeta:

```bash
dart run Alumnado/preparar_pm5.dart ejemplo
cd Practica/Ejemplos/pm5_capacidades_guiadas
flutter test
flutter run -d chrome
```

En esa pantalla puedes provocar denegación, timeout BLE, sensor, conversión y error de imagen, load/play/pause y animación. El README del ejemplo localiza los archivos. Aprende una pieza y aplícala a tu starter; son proyectos distintos y solo el starter se entrega como producto. Las instrucciones detalladas y el punto de entrada Android están en el recorrido guiado del ZIP.

Usa Flutter **3.47.8 / Dart 3.13.7**. Si todavía tienes 3.47.2, sigue la actualización controlada de la página de referencias; no cambies los paquetes de la unidad.
