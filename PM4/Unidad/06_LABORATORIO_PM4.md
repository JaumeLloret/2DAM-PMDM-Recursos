# PM4 · Laboratorio AulaFlow Flutter Data Client

## La misión

El starter ya hace login y lista datos, pero es `remote-only`: sesión en memoria, sin timeout, sin cache, sin preferencia persistente y con todos los fallos mezclados. Vas a completar la frontera de datos sin convertirla en una arquitectura ceremonial.

La app es una demo con datos `DEMO-*`. No implementa el backend ni el contrato futuro de AulaFlow 2.0.

## Antes de tocar código

- completa la práctica **Debugging PM4**;
- conserva una copia limpia de `lib/`;
- confirma dos terminales, `/health` 200 y app inicial;
- ejecuta `flutter analyze` y `flutter test`;
- abre la carpeta que contiene `pubspec.yaml`.

## Hito 0 · baseline · 10 min

- **Objetivo:** demostrar que API y starter funcionan.
- **Acción:** health, login y listado; registra URL efectiva saneada.
- **Mínimo verificable:** tres tareas `DEMO-*` o un bloqueo con capa identificada.
- **Escenario:** normal.
- **Evidencia:** comandos y primer resultado.
- **Rescate:** si health falla, vuelve a API/puerto; si solo falla Flutter, revisa destino/URL.

## Hito 1 · DTO y fallos · 20 min

- **Objetivo:** impedir que JSON dinámico y errores crudos escapen.
- **Estado inicial:** casts directos y mensajes genéricos.
- **Acción:** DTO → dominio; tipos transporte/protocolo/formato/timeout/auth.
- **Mínimo verificable:** normal mapea; `invalid-json` produce `FormatFailure`.
- **Escenarios:** normal, JSON inválido y timeout.
- **Evidencia:** prueba pequeña y tabla de fallos.
- **Rescate:** empieza por un único DTO y un único fallo.

## Hito 2 · sesión segura · 20 min

- **Objetivo:** restaurar y borrar token sin persistir contraseña.
- **Acción:** `SessionStore` seguro, login, Bearer, boot, logout y 401.
- **Mínimo verificable:** nueva instancia puede restaurar token; logout confirmado lo elimina.
- **Escenarios:** login correcto, credencial errónea, 401 y fallo de borrado.
- **Evidencia:** estados antes/después sin token completo.
- **Rescate:** prueba store aislado antes de conectarlo a UI.

## Hito 3 · preferencia y cache · 20 min

- **Objetivo:** persistir solo datos no sensibles y pequeños.
- **Acción:** `showCompleted` + cache demo en LocalStore.
- **Mínimo verificable:** otra instancia recupera preferencia/cache; password nunca aparece.
- **Escenario:** write/read/delete y re-instanciación.
- **Evidencia:** matriz dato → almacén → motivo.
- **Rescate:** separa primero preferencia; añade cache después.

## Hito 4 · Repository remoto/local · 20 min

- **Objetivo:** aplicar remote-first sin ocultar sesión caducada.
- **Acción:** remoto; cache tras éxito; fallback en fallo recuperable; `stale=true`.
- **Mínimo verificable:** API caída tras una carga muestra cache antigua identificada.
- **Escenarios:** normal, 500/offline y 401.
- **Evidencia:** traza de decisiones sin `Authorization`.
- **Rescate:** prueba Repository con fakes antes de la app completa.

## Hito 5 · estados ViewModel · 15 min

- **Objetivo:** representar `booting/loading/data/empty/error/sessionExpired` sin booleanos incompatibles.
- **Acción:** coordina comandos y retry fuera de `build()`.
- **Mínimo verificable:** vacío no es error; timeout termina; 401 vuelve a login.
- **Escenarios:** empty, slow, invalid-json y unauthorized.
- **Evidencia:** tabla evento → estado → acción.
- **Rescate:** conecta un escenario cada vez.

## Hito 6 · comprobación integrada · 15 min

| Caso | Resultado esperado |
|---|---|
| normal | datos frescos y toggle |
| vacío | estado vacío, no error |
| 401 | sesión borrada y login |
| 404 | recurso no encontrado con salida |
| 500/503 | retry; cache visible si procede |
| JSON inválido | error de contrato |
| timeout | no spinner infinito |
| API detenida tras cache | datos `stale` claramente marcados |
| reinicio/re-instanciación | sesión/preferencia/cache según política |
| logout fallido | error representado; no éxito fingido |
| HTTPS, cuando proceda | TLS válido sin bypass |

## Producto mínimo I2

- login/listado/detalle/toggle/logout;
- RemoteService con URI, headers, timeout, códigos y JSON;
- DTO → dominio;
- SessionStore seguro;
- LocalStore para preferencia/cache no sensible;
- Repository remote-first/fallback visible;
- estados ViewModel y retry;
- `API_BASE_URL` por entorno;
- registro saneado de escenarios;
- `flutter analyze` y `flutter test` reales.

Entrega código, decisiones, diff, comandos y registro. No entregues `build/`, `.dart_tool/`, `.env`, password, token completo, IP pública, datos reales ni material docente.

## I3 con o sin asistencia

La microvariación individual dura 23 minutos y se realiza sin agente. En taller puede observarse en directo; si no asistes se asigna por AULES con la misma finalidad, tiempo y clase de evidencia.

Debes conservar: predicción previa, cambio mínimo, ejecución, regresión y explicación de la capa. La variante exacta permanece reservada.

## Parada

Cuando el producto mínimo funciona y puedes explicar sus decisiones, detente. No añadas SQL/ORM, OAuth/JWT completo, sensores, multimedia, testing profesional, CI curricular, agentes ni arquitectura global del proyecto.

