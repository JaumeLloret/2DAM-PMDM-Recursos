# Entorno reproducible y fuentes · PM6

## Elige editor y abre el proyecto correcto

Necesitas una copia de `Practica/Starter/quality_gate/`, Flutter **3.47.2** con Dart **3.13.2**, y un editor. En **VS Code** instala las extensiones oficiales Dart y Flutter; elige *Archivo → Abrir carpeta* y selecciona `quality_gate`, la carpeta con `pubspec.yaml`. Abre *Terminal → Nuevo terminal* y comprueba que estás en esa carpeta. En **Android Studio**, abre el proyecto existente desde *Open*, selecciona la misma carpeta y usa la pestaña *Terminal*. El IDE no determina la nota: usa el que permita editar Dart, ejecutar la terminal y depurar. No abras la carpeta `lib` sola ni copies la solución docente.

1. Comprueba `flutter --version`. Si la terminal no encuentra `flutter`, comprueba dónde instalaste el SDK, agrega su directorio `bin` al PATH de tu sistema y **abre una terminal nueva**. Repite el comando antes de tocar el proyecto. La [ayuda](../Unidad/11_AYUDA_PM6.md) separa PATH de errores del código.
2. Ejecuta `flutter pub get` desde `quality_gate`. Espera resolución de dependencias; no cambies `pubspec.lock` por una actualización improvisada.
3. Ejecuta `flutter analyze --fatal-infos` y `flutter test test/smoke_test.dart --reporter expanded`. Esperas análisis correcto y test de humo verde. Si falla, conserva el **primer diagnóstico**, archivo/línea y código de salida, y abre [debugging](../Unidad/05_DEBUGGING_PM6.md).
4. Antes de corregir, copia ese estado o guarda un commit local autorizado. Crea `test/guided_example_test.dart` con el bloque del [ejemplo E1](../Unidad/03_EJEMPLOS_GUIADOS_PM6.md), predice **2 abiertas, 1 observada** y ejecuta solo ese archivo. Un fallo de aserción previsto demuestra el defecto; una importación rota no lo demuestra.

**Sin Android puedes comenzar A01–A04 en host.** Para RA2.g necesitarás observación en emulador; para RA2.h, instalación y recorrido en móvil real autorizado. Si tu ordenador no puede ejecutarlos, continúa lo que sí es verificable, marca el estado pendiente y solicita acceso al equipo del centro. No dependas de una sesión presencial concreta.

### Preparar destino Android sin confundirlo con el host

En Android Studio abre *SDK Manager* para comprobar el SDK, y *Device Manager* para crear/iniciar un AVD compatible con la instalación del centro. Verifica virtualización y espacio si no inicia. Ejecuta `flutter doctor -v` y `flutter devices`; selecciona el ID que aparece **en tu equipo**, nunca un ID copiado de otro alumno. En móvil propio o autorizado habilita depuración según política del centro, acepta el diálogo del propietario y vuelve a ejecutar `flutter devices`. Los IDs/seriales no van al dossier público. El proyecto fuente no trae `android/`: se genera **en una copia** con el comando indicado abajo, se revisa el diff y se conserva el código de PM6. Un destino Chrome/escritorio puede ayudar a comprobar UI, pero no es Android de RA2.g ni móvil real de RA2.h.

Referencia comprobada el 07/09/2026: Flutter **3.47.2**, Dart **3.13.2**, DevTools **2.60.0**. Flutter framework `d3b14c876900e553bc736ca19295fc09e3853e8e`; engine `a804b261645ef8c13eb3d5c44a5c2fb0340c5539`. Conserva el `pubspec.lock` de cada proyecto y compara `flutter --version` antes de actualizar. Los proyectos solo dependen de Flutter, flutter_test e integration_test del SDK. Flutter tiene licencia BSD de tres cláusulas; se conservan las licencias del SDK y sus dependencias cuando se distribuyen binarios.

## Arranque de la práctica

Descomprime el starter en una carpeta de trabajo propia; abre esa carpeta en el editor, no el directorio completo de la campaña. Ejecuta `flutter pub get`, `flutter analyze --fatal-infos` y `flutter test`. El smoke test inicial comprueba que arranca; su verde no demuestra que la lógica sea correcta. Escribe las regresiones de la práctica antes de corregir. No actualices dependencias solo para eliminar el aviso de una versión disponible incompatible con el SDK fijado.

Para Android necesitas Android Studio/SDK configurado y un JDK compatible con el proyecto generado; la referencia CI usa JDK 17. Ejecuta `flutter doctor -v`, revisa sus requisitos Android y acepta licencias solo si estás autorizado. Genera la carcasa con `flutter create --platforms=android --org org.aulaflow.training --project-name quality_gate .`; conserva `lib`, `test`, `integration_test`, pubspec y lock del material y elimina únicamente el test de contador de muestra que genere Flutter, si aparece. Registra versiones Android/Gradle reales del entorno. No copies claves de firma ni datos de otros proyectos.

Inicia el emulador autorizado, comprueba `flutter devices` y usa `flutter test integration_test/flow_test.dart -d <ID_LOCAL>`. El identificador sirve en tu terminal; no lo incluyas en la entrega pública. Para probar manualmente: `flutter run -d <ID_LOCAL>`. Para empaquetar: `flutter build apk --debug`. El APK de entrenamiento no es una publicación de tienda. Sigue Q04 para instalación real y retirada del artefacto de prueba. Si no hay Android disponible, completa las pruebas host, guarda el bloqueo y acuerda acceso al equipo del centro; no reemplaces la evidencia real por una captura fabricada.

Ejecuta el recorrido `integration_test` después de corregir los defectos y comprobar las regresiones host. Sobre el starter original, el indicador de carga queda activo tras error y `pumpAndSettle` puede agotar su tiempo de espera; para diagnosticarlo utiliza la prueba widget con `pump` controlado de la unidad. Aumentar el timeout no corrige ese comportamiento.

En CI se fijan `CI=true` y `FLUTTER_SUPPRESS_ANALYTICS=true`, opciones del entorno de herramientas. La validación local utilizó `TAR_OPTIONS=--no-same-owner` para extraer archivos del SDK sin intentar conservar propietarios ajenos. Son ajustes de instalación, no cambios en el producto ni requisitos conceptuales que deba memorizar el alumnado.

## A06 · Primer workflow de calidad

Usa un repositorio de práctica autorizado donde `pubspec.yaml`, `lib` y `test` estén en la raíz. No pegues este workflow en el repositorio común de materiales. La carpeta `.github/workflows` va en la raíz del repositorio de tu app; crea en ella `quality.yml` con este contenido. Si tu app está en una subcarpeta, acuerda primero esa estructura y configura `defaults.run.working-directory` con su ruta relativa.

```yaml
name: Calidad PM6

on:
  push:
  pull_request:

permissions:
  contents: read

jobs:
  host:
    runs-on: ubuntu-24.04
    timeout-minutes: 20
    env:
      CI: 'true'
      FLUTTER_SUPPRESS_ANALYTICS: 'true'
      EXPECTED_SHA: ${{ github.event.pull_request.head.sha || github.sha }}
    steps:
      - uses: actions/checkout@v6
        with:
          ref: ${{ env.EXPECTED_SHA }}
          persist-credentials: false
      - name: Comprobar el corte
        run: |
          test "$(git rev-parse HEAD)" = "$EXPECTED_SHA"
          git rev-parse HEAD
      - uses: subosito/flutter-action@v2
        with:
          channel: stable
          flutter-version: '3.47.2'
      - name: Registrar herramientas
        run: |
          flutter --version
          dart --version
      - run: flutter pub get
      - name: Formato
        run: dart format --output=none --set-exit-if-changed lib test integration_test
      - name: Análisis
        run: flutter analyze --fatal-infos
      - name: Pruebas host
        run: flutter test --reporter expanded
```

`on` define cuándo se ejecuta; `jobs.host` usa un runner Linux y sus pasos se realizan por orden. La primera acción obtiene el corte indicado y la segunda instala Flutter fijado. Si falla formato, un análisis o una prueba, el job se detiene y conserva la salida del paso. No necesita secretos de AulaFlow. Las versiones de las acciones identifican las familias del ejemplo; en una configuración de centro consolidada pueden fijarse sus commits revisados sin cambiar el SDK del curso. Consulta su documentación primaria: [checkout](https://github.com/actions/checkout) y [flutter-action](https://github.com/subosito/flutter-action).

Antes de subir, ejecuta los mismos comandos localmente. Si formato detecta diferencias, ejecuta `dart format lib test integration_test`, revisa el diff y repite análisis/pruebas. Si una regresión funcional falla, conserva el expected/actual y corrige la app; no borres la aserción para obtener verde. Guarda el archivo, crea un commit y sube la rama de práctica. En GitHub, abre Actions → Calidad PM6 → ejecución y comprueba el SHA impreso, paso, comando y resultado. Regístralos en Q05 con el enlace real del run.

Este workflow verifica formato, análisis y pruebas unitarias/widget. El nombre `integration_test` en formato/análisis no significa que haya ejecutado un emulador. El APK se genera con los pasos Android anteriores y la interacción/empaquetado/despliegue se registran por separado en Q04. Si GitHub Actions no está habilitado en el repositorio autorizado, conserva el YAML y las verificaciones locales y marca `PENDIENTE_CI` hasta poder ejecutar; no atribuyas al ejemplo una ejecución propia. Todo este recorrido pertenece a A06, sin añadir un nuevo bloque horario.

## Consulta documentada

La teoría de esta unidad contiene el recorrido necesario. Estas fuentes oficiales permiten comprobar APIs y ampliar, sin convertir una lectura externa en requisito oculto:

- [Tipos de pruebas Flutter](https://docs.flutter.dev/testing/overview): diferencia de alcance y coste; una prueba host no observa el sistema Android completo.
- [Pruebas de integración](https://docs.flutter.dev/testing/integration-tests): ejecución del flujo con integration_test en un destino disponible.
- [Performance de DevTools](https://docs.flutter.dev/tools/devtools/performance): medición de frames en profile; debug no representa rendimiento de distribución.
- [Memoria en DevTools](https://docs.flutter.dev/tools/devtools/memory): snapshots, asignaciones y límites al interpretar crecimiento.
- [Android con Flutter](https://docs.flutter.dev/deployment/android): configuración y empaquetado; la actividad termina en instalación de entrenamiento autorizada.
- [Sintaxis de workflows](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions): eventos, jobs, permisos y condiciones de GitHub Actions.

Las fuentes son referencias de consulta; el caso, código, datos DEMO, consignas y pruebas se han redactado para esta campaña. No se usan imágenes, audio ni datos personales de terceros.
