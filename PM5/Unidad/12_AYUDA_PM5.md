# PM5 · Ayuda por síntomas

Busca el primer síntoma reproducible. Cambia una sola causa y repite también un caso normal.

Antes de pedir ayuda conserva: fase, carril DEMO/REAL, sistema, editor, destino, acción/comando, primer error, resultado esperado, dos hipótesis y estado de evidencia. Sanea ids, rutas y medios.

| Síntoma | Qué comprobar | Qué hacer | Qué guardar | Estado de evidencia |
|---|---|---|---|---|
| `flutter` no se reconoce | `flutter --version`, PATH y nueva terminal | corrige PATH del SDK del curso | comando y primer error | `PENDIENTE_PERMISO_ENTORNO` si bloquea |
| no aparece ningún destino | `flutter devices`, AVD iniciado o USB autorizado | usa Chrome/escritorio para DEMO; prepara Android aparte | lista saneada de tipos de destino | DEMO puede continuar |
| AVD no inicia | virtualización, espacio y primer error | resuelve una causa; usa DEMO/dispositivo como contingencia | primer error, sin rutas personales | pendiente de entorno |
| dispositivo USB no detectado | cable/datos, depuración y autorización | reconecta y revisa `adb devices` | nunca guardes serial | pendiente de entorno |
| API Android insuficiente para BLE | `getprop ro.build.version.sdk` | usa DEMO para BLE o API31+ | solo valor API | `PENDIENTE_HARDWARE` |
| permiso denied | acción y motivo visibles | explica, permite reintento/fallback | feature y estado | fake/real según caso |
| permiso permanente | repetir diálogo no ayuda | ofrece Ajustes o DEMO; no fuerces | estado y acción elegida | real solo si observado |
| permiso restricted/limited | política de sistema/plataforma | adapta salida; no conviertas en granted total | capacidad disponible | estado exacto |
| BLE apagado/no ready | API31+, permiso, radio, `BleStatus.ready` | no inicies scan; ofrece activar/revisar/DEMO | código saneado | real solo si observado |
| scan vacío | periférico, filtro, anuncio y ventana 8 s | termina como vacío, permite reintento | duración y filtro sin UUID real | pendiente hardware si falta |
| scan duplicado | referencia a suscripción | cancela anterior antes de empezar | conteo de listeners | fake |
| timeout al conectar | periférico/rango y límite | cancelar y volver a estado recuperable | duración/código | fake o real |
| conexión perdida | stream de enlace | limpiar id/GATT, informar y volver a buscar | transición | fake o real |
| GATT falla | conectado, servicio/característica y protocolo | no lo trates como HTTP; verifica configuración aula | operación/código saneado | real solo si observado |
| sensor ausente | capacidad/plataforma | muestra unavailable y usa traza fake | feature ausente | `PENDIENTE_HARDWARE` |
| sensor no emite | suscripción, fake/adapter y tiempo | prueba una traza mínima y timeout controlado | muestras recibidas | fake/real |
| stream duplicado | inicio repetido/propietario | cancela o bloquea segundo inicio | listeners antes/después | fake |
| stream sigue tras salir | `suspend/dispose` | cancela y espera; prueba regresión | eventos después de pausa | fake/real |
| picker no devuelve archivo | la persona canceló | conserva borrador anterior; no es error | cancelación | real/fake |
| lost-data no se recupera | `recoverLost()` en inicio/resume | vuelve al mismo pipeline | fixture/código saneado | fake; real pendiente |
| archivo >5 MiB | tamaño antes de decode | rechaza con salida recuperable | tamaño redondeado | fake |
| MIME no permitido | MIME y bytes, no extensión | rechaza antes de procesar | tipo saneado | fake |
| decode devuelve null | `DEMO-CORRUPT-01` | `MediaDecodeFailure` y otro fixture | código del fallo | fake |
| JPEG no es real | MIME, dimensiones y `FF D8` | decode→resize→encode; no renombres | tres comprobaciones | procesamiento real de fixture |
| ancho >1024 | resize/proporción | calcula ancho objetivo y recodifica | antes/después | fake |
| almacenamiento falla | directorio privado y write | fallo tipado; no crear draft falso | operación, sin ruta | fake/real |
| aparece ruta personal | log/registro sin sanear | redacta a `app-private://DEMO-*` | versión saneada | no entregues original |
| player no carga | archivo WAV y estado | representa load_failed y reintento | estado/código | fake/real |
| play no hace nada | se llamó load; estado ready/paused | respeta contrato; no pulses en bucle | transición | fake/real |
| player no se libera | pause/dispose/lifecycle | dispose idempotente y sin eventos | antes/después | fake/real |
| animación sigue activa | estado fuente y lifecycle | detener con estado; respetar reducción | evento que la controla | fake |
| `flutter analyze` falla | primer diagnóstico fichero/línea | corrige causa; no desactives reglas | diagnóstico inicial/final | resultado real |
| `flutter test` falla | test y esperado/real | ejecuta el caso aislado y revisa contrato | nombre y diferencia | resultado real |
| Gradle/build falla | primer error, red/espacio/JDK | resuelve el primer error; no cambies cinco versiones | error inicial | pendiente de entorno si procede |

## Rescate en ocho pasos

1. Reproduce una vez.
2. Escribe el síntoma, no la conclusión.
3. Elige la capa.
4. Formula dos hipótesis.
5. Ejecuta la prueba más barata.
6. Cambia una sola causa.
7. Repite el caso y una regresión.
8. Clasifica la evidencia real.

Si no obtienes una observación nueva en 15 minutos, pide ayuda con estos datos. Reinstalar todo o borrar caches sin hipótesis destruye evidencia y suele añadir causas nuevas.

