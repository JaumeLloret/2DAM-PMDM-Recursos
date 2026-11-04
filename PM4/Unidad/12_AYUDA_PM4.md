# PM4 · Ayuda por síntomas

Busca el primer síntoma reproducible y cambia una sola causa. Antes de pedir ayuda conserva: fase de la Ruta, sistema, editor, destino, terminal, comando, URL saneada, primer error y resultado esperado.

| Síntoma | Qué comprobar | Qué hacer | Qué guardar |
|---|---|---|---|
| `dart` o la API no arranca | `dart --version`; carpeta raíz PM4 | corrige PATH/ubicación; usa el SDK fijado del curso | comando y primer error |
| puerto 8080 ocupado | terminal anterior; proceso escuchando | detén la instancia anterior o usa otro puerto en API y URL | puerto elegido y salida |
| `/health` falla | terminal 1 viva; host/puerto | reinicia API y prueba health antes de Flutter | código o `Connection refused` |
| `Connection refused` en Flutter | health host; URL efectiva; destino | usa `127.0.0.1` en escritorio o `10.0.2.2` en AVD | destino, URL saneada, error |
| emulador no alcanza `localhost` | `127.0.0.1` apunta al AVD | cambia solo `API_BASE_URL` a `10.0.2.2` | antes/después |
| dispositivo no alcanza el PC | misma red autorizada; API escucha; firewall | usa `--host=0.0.0.0` temporalmente y limita red; vuelve a loopback al acabar | no publiques la IP |
| 401 inesperado | Bearer, token restaurado, escenario | inicia sesión de nuevo; ante 401 borra sesión | método/ruta/código, sin header |
| token no se restaura | backend secure storage; read/write | prueba SessionStore aislado y nueva instancia | estado sin token completo |
| logout no borra sesión | delete confirmado; excepción de plugin | representa `PersistenceFailure`; no declares éxito | paso y excepción saneada |
| JSON inválido | código 200 + body no parseable | tipa `FormatFailure`; no fuerces cast | escenario y tipo de fallo |
| DTO inválido | campos requeridos/tipos | reduce a un fixture y valida `fromJson` | esperado/real sin datos |
| timeout | límite y `scenario=slow` | representa timeout + retry; no spinner infinito | duración y estado |
| 500/503 | código y política recuperable | muestra retry; usa cache solo si existe y marca `stale` | código y fuente usada |
| cache no aparece | hubo carga correcta previa; write | prueba store/repository por separado | orden de pasos |
| cache aparece cuando no debe | 401 o dato sensible | impide fallback en sesión inválida; limpia datos protegidos | escenario y estado final |
| persistencia falla | operación read/write/delete | convierte fallo de plataforma en `PersistenceFailure` | operación exacta |
| `flutter analyze` falla | primer diagnóstico, fichero/línea | corrige la causa; no desactives reglas | primer diagnóstico |
| `flutter test` falla | test y esperado/real | reproduce solo ese caso y revisa contrato | nombre + diferencia |
| Gradle/Android bloquea arranque | primer error, espacio, red, AVD | resuelve el primer error; Chrome/escritorio puede ser contingencia temporal | error inicial, no la última línea |

## Rescate en siete pasos

1. Reproduce una vez.
2. Decide la capa probable.
3. Escribe dos hipótesis.
4. Ejecuta la prueba más barata.
5. Cambia una sola causa.
6. Repite el caso y una regresión.
7. Si no avanzas en 15 minutos, pide ayuda con la evidencia anterior.

No borres caches, reinstales todo ni cambies cinco opciones a la vez sin una hipótesis. Un bloqueo documentado puede quedar `PENDIENTE_ENTORNO`; no demuestra el CE, pero tampoco se confunde automáticamente con falta de aprendizaje.

