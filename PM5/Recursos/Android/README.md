# Compatibilidad Android de la integración BLE

Este recurso se aplica a la integración real con `reactive_ble_mobile 5.5.0` y Android compileSdk 36 descrita en la unidad. El starter DEMO no necesita este paso.

Después de añadir las dependencias fijadas y ejecutar `flutter pub get` en tu proyecto, usa Python 3 para aplicar el puente a la copia del paquete resuelta por ese proyecto:

```bash
python3 patch_reactive_ble_android.py /ruta/a/tu/proyecto
```

En Windows usa el comando con el que ejecutes Python 3 y la ruta real del proyecto. El script localiza `reactive_ble_mobile` mediante `.dart_tool/package_config.json`, exige la versión 5.5.0 y cambia únicamente `compileSdkVersion 33` por `36` en su `android/build.gradle`. Si ya está aplicado, lo indica. Si cambia la versión o el patrón, se detiene y debes revisar el entorno con el docente.

El cambio afecta a la copia de dependencia indicada por package_config, normalmente en la caché de paquetes. No sustituye tu manifiesto de permisos, tu adaptador ni la prueba física. No lo uses para ignorar otros errores de Gradle.

[Preparación y límites de plataforma](../../Unidad/05_PREPARACION_PLATAFORMA_PM5.md) · [Versiones de referencia](../../Unidad/10_REFERENCIAS_Y_ACTUALIZACION_PM5.md)
