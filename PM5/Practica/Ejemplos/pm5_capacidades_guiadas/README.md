# PM5 · Capacidades guiadas que puedes ejecutar

Este proyecto enseña piezas pequeñas; el laboratorio se completa en `Practica/Starter/aulaflow_device_media_starter/`. No reemplaces el starter por este ejemplo.

## Preparar y arrancar

Descarga y descomprime **PM5_MATERIALES_ALUMNADO.zip**. Desde la carpeta **PM5/** ejecuta:

```bash
dart run Alumnado/preparar_pm5.dart ejemplo
cd Practica/Ejemplos/pm5_capacidades_guiadas
flutter analyze
flutter test
flutter run -d chrome
```

DEMO simula permisos, radio, sensor y estados de audio. **La conversión PNG→JPEG sí procesa bytes reales** y muestra la imagen resultante. El almacén en memoria enseña la frontera, sin acreditar persistencia física. No hay backend. El tono DEMO no suena en esta composición.

## De cada actividad a su archivo

| Actividades | Abre | Ejecuta y modifica |
|---|---|---|
| E1–E2 / K1–K2 | `lecciones.dart`: `Decision`, `permissionMessage` | Cambia granted/denied/permanentlyDenied. Explica la salida de cada estado. |
| E3, E7–E8 / K3, K6–K7 | `SensorLesson` y `test/lecciones_test.dart` | Cambia el límite de 120 ms; observa última muestra, repintado y cancelación. |
| E4–E6 / K4–K5 | `ScriptedBle`, `BleLesson` | Ejecuta normal/timeout/disconnected/unavailable; deduplica y comprueba cleanup. |
| E9–E12 / K8–K11 | `fixtures.dart`, `processImage`, `MemoryDraftStore` | Fixture válido/corrupto/grande, firma JPEG y dimensiones. En Android, sigue `pick`, `recoverLost` y `_process`. |
| E13–E14 / K12–K14 | `DemoPlayer`, `main.dart`: `AnimatedContainer` | Play antes de load, pausa y movimiento reducido. Android usa el WAV sintético real. |
| E15 / K15 | `suspend` y `dispose` en ambos puntos de entrada | Suspende, comprueba que cesan recursos y vuelve a activar solo por intención. |

Los nombres de archivo de esta tabla están dentro de `lib/`. Las pruebas están en `test/lecciones_test.dart`. Primero predice; ejecuta el test; cambia una regla; repite una regresión; después lleva esa decisión al starter. Conserva los cambios en el único cuaderno I1, sin otra entrega.

## Android real: un punto de entrada explícito

El preparador genera el manifiesto y aplica el puente BLE fijado en el curso. Inicia un AVD o conecta el dispositivo y localiza su ID con `flutter devices`. Sustituye `ID_ANDROID` por ese destino:

```bash
flutter run -t lib/main_android.dart -d ID_ANDROID
```

`main_android.dart` contiene la pantalla; `android_lab.dart` concentra plugins y recursos. Empieza por **Iniciar sensor real**, una imagen DEMO y cargar/reproducir el tono. Para cámara, usa una tarjeta DEMO-OBJECT. Cancelar la selección conserva la imagen anterior. La imagen se valida, recodifica y guarda dentro del directorio privado de la aplicación; se muestra un resumen sin la ruta completa.

BLE real necesita **Android API 31+**, radio activa, periférico de aula y los dos UUID de su protocolo. El docente facilita esos valores; no sirven UUID inventados ni los de un equipo cualquiera. Una característica de escritura con respuesta y lectura debe implementar el intercambio del aula. Cuando se disponga de esa configuración, añade:

```text
--dart-define=PM5_BLE_SERVICE=UUID_DEL_SERVICIO
--dart-define=PM5_BLE_CHARACTERISTIC=UUID_DE_LA_CARACTERISTICA
```

Son argumentos del comando anterior, en una sola línea. Si no se han facilitado, el botón informa `teacher_gatt_configuration_missing`: continúa con BLE simulado y registra la observación física pendiente. No se pide permiso al abrir la app. La selección de archivos usa el selector del sistema; no exige permiso general sobre todo el almacenamiento. Recuperar lost-data después de una recreación debe comprobarse en Android; el código incluido no acredita que ese incidente se haya observado.

## Qué queda para el laboratorio

Integrar estas piezas en el producto del starter: separar puertos/adaptadores, componer el modo DEMO y el real, conservar original y derivada según la política de la tarea, gestionar todos los estados y demostrar errores/lifecycle. El ejemplo Android guarda una derivada para enseñar el mecanismo; no es el producto final ni una solución de I3.
