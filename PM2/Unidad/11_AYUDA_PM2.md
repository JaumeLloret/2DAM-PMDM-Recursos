# PM2 · Ayuda y diagnóstico

Los fallos de entorno y los errores de código forman parte del trabajo. Antes de cambiar muchas cosas, identifica el primer síntoma reproducible.

## Qué incluir al pedir ayuda

- paso de la Ruta;
- sistema operativo;
- editor utilizado;
- comando exacto;
- salida completa relevante;
- fichero y línea;
- qué esperabas;
- una o dos acciones ya probadas.

No publiques contraseñas, tokens, correo personal, rutas completas con tu usuario ni capturas con cuentas abiertas.

## Fallos frecuentes

| Síntoma | Comprueba | Acción acotada |
|---|---|---|
| `dart: command not found` o «dart no se reconoce» | `dart --version` falla también fuera del editor | Vuelve al recurso de entorno de PM1 y comprueba PATH/SDK. No reinstales Android Studio o Flutter sin verificar primero qué comando falta. |
| El editor muestra errores en todos los imports | Has abierto un fichero suelto o una carpeta superior | Abre exactamente la carpeta que contiene `pubspec.yaml` y ejecuta `dart pub get`. |
| `Could not find bin/<paquete>.dart` al usar `dart run` | El ejecutable del material se llama `bin/main.dart` | Ejecuta `dart run bin/main.dart`. |
| `pub get failed` | Estás en otra carpeta o falta conexión | Ejecuta `pwd`/mira la ruta, confirma `pubspec.yaml` y repite con conexión. Conserva el primer error si persiste. |
| Analyzer marca `A value of type ... can't be assigned` | Tipo declarado y valor no coinciden | Lee ambos tipos. Corrige el contrato; no cambies a `dynamic` solo para silenciarlo. |
| `Null check operator used on a null value` | Hay un `!` sobre un valor realmente nulo | Sustituye la promesa por validación, promoción o un valor alternativo con `??`. |
| Aparece `Instance of 'Future<String>'` | Estás imprimiendo el `Future`, no su resultado | Marca la función llamadora `async` y usa `await`. |
| `Unsupported operation` al añadir a una lista | La colección es no modificable | Decide si necesitas una copia mutable o si la operación debe devolver una nueva colección. No elimines la protección sin justificarlo. |
| Un test falla después del refactor | Cambió una regla o una salida | Lee el nombre del test, reproduce el caso mínimo y revisa si el test o tu código expresa el contrato vigente. |
| `dart format --output=none --set-exit-if-changed .` devuelve código 1 | Hay ficheros sin formatear | Ejecuta `dart format .`, revisa los cambios y repite la comprobación. |

## Ruta de rescate en cinco pasos

1. Reproduce una vez el fallo.
2. Reduce el caso: un comando, un fichero y una entrada.
3. Escribe dos hipótesis antes de editar.
4. Cambia una sola causa probable.
5. Repite el comando y una comprobación de regresión.

Si tras 15 minutos no puedes reducir el caso, pide ayuda con la información anterior. Eso es mejor evidencia técnica que una captura aislada o «he reinstalado todo».

## Bloqueo de entorno

Un bloqueo documentado se registra como `PENDIENTE_ENTORNO`: no demuestra el CE, pero tampoco se transforma automáticamente en un suspenso. Continúa con predicciones y diseño mientras se resuelve; necesitarás una ejecución real para cerrar la evidencia.

