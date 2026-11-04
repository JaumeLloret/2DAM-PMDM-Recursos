# PM3 · Ayuda y diagnóstico por síntomas

> Fuente anterior conservada para trazabilidad. La publicación vigente se define en el manifiesto AULES v3 y usa los libros integrados 13–16; este documento no se exporta como una actividad separada.


Los fallos de entorno y código forman parte del aprendizaje. Busca el **primer síntoma reproducible** y cambia una sola causa cada vez.

## Qué guardar antes de pedir ayuda

- paso de la Ruta;
- sistema operativo y editor;
- comando exacto;
- primer mensaje de error relevante;
- fichero y línea si aparece;
- qué esperabas ver;
- una o dos acciones ya probadas.

No publiques contraseñas, tokens, correo personal, números de serie, rutas completas con tu usuario ni capturas con cuentas abiertas.

## Síntomas frecuentes

| Síntoma | Qué comprobar | Qué hacer | Qué guardar |
|---|---|---|---|
| `flutter` no reconocido | `flutter --version` falla también fuera del editor | Revisa PATH y la guía de entorno de PM1; reinicia terminal tras corregirlo | comando y mensaje exacto |
| `flutter doctor -v` marca error | qué sección está roja y si corresponde al destino elegido | Resuelve solo Flutter/Android necesario; acepta avisos de plataformas no usadas | sección completa sin rutas personales |
| No aparece dispositivo | `flutter devices`; AVD encendido; depuración autorizada si es físico | Inicia AVD desde Device Manager o reconecta el dispositivo; prueba Chrome como contingencia temporal | salida de `flutter devices` anonimizada |
| El AVD no inicia | virtualización, memoria disponible e imagen instalada | Cierra otros emuladores, usa una imagen compatible o reduce recursos; pide ayuda si persiste | primer error del Device Manager |
| Gradle tarda o falla | conexión, espacio y primer error, no la última línea | Espera la primera descarga razonable; repite una vez con conexión; no borres cachés a ciegas | primer error y tiempo transcurrido |
| Dependencia no resuelta | estás en la carpeta con `pubspec.yaml` | Ejecuta `flutter pub get`; revisa nombre/indentación del `pubspec.yaml` | comando y bloque `Because...` |
| Pantalla en blanco | terminal, ruta inicial y excepciones | Reduce a un texto en la ruta inicial y vuelve a añadir el body | excepción y ruta abierta |
| Franja de overflow | padre, constraints e hijo que pide demasiado | Aplica flexibilidad o scroll adecuado; evita ancho mágico | tamaño lógico y widget implicado |
| Ruta no encontrada | patrón, barra inicial y parámetro | Muestra temporalmente ubicación/id y corrige el patrón | URL/ruta y resultado esperado |
| Estado no refresca | comando, mutación y `notifyListeners` | Comprueba que la View observa la misma instancia; evita copiar estado | flujo evento → estado |
| Diálogo o SnackBar no aparece | `context`, ancestros y resultado del diálogo | Usa un contexto del ámbito correcto y comprueba `mounted` tras `await` | acción y subárbol afectado |
| `flutter analyze` falla | primer diagnóstico y fichero/línea | Corrige la causa, no desactives la regla global | primer diagnóstico |
| `flutter test` falla | nombre del test y diferencia esperada/real | Reproduce ese caso y decide si código o expectativa rompe el contrato | test, esperado y real |

## Ruta de rescate

1. Reproduce una vez.
2. Reduce a un comando, fichero y entrada.
3. Escribe dos hipótesis.
4. Comprueba la más barata.
5. Cambia una sola causa.
6. Repite el caso y una regresión cercana.
7. Si no avanzas en 15 minutos, pide ayuda con la información anterior.

Un bloqueo documentado puede registrarse como `PENDIENTE_ENTORNO`; no demuestra el CE, pero tampoco se convierte automáticamente en cero.
