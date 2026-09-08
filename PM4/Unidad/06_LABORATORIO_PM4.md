# Laboratorio integrado · AulaFlow Flutter Data Client

## Reto

Completa el starter para que la frontera de datos deje de ser remote-only y sea segura, observable y recuperable. El producto es una demo docente; no implementa contrato ni backend real de AulaFlow 2.0.

## Criterios de aceptación

- login ficticio y token opaco;
- `GET /tasks`, detalle y `PATCH /tasks/:id/toggle`;
- Service con URI, headers, timeout, códigos y JSON;
- DTO → dominio con opcionalidad y estado desconocido;
- token persistido solo mediante `SessionStore` seguro;
- preferencia/cache pequeña mediante LocalStore no sensible;
- logout y 401 borran sesión;
- Repository remote-first con fallback cache en fallos recuperables;
- ViewModel representa booting/loading/data/empty/error/sessionExpired;
- retry explícito y aviso de cache antigua;
- `API_BASE_URL` por `--dart-define`;
- ninguna lógica HTTP/JSON/almacén en widgets;
- prueba HTTPS controlada sin bypass TLS.

## Deudas reales del starter

El starter ya arranca, hace login y lista remoto. Su `RemoteOnlyRepository` conserva token solo en memoria, no tiene timeout, muestra errores genéricos, no restaura preferencia/cache y no distingue 401. No hay comentarios que contengan la solución. Haz un diff y resuelve desde el contrato.

## Secuencia sugerida · dentro de 120 min

1. 0–15: ejecutar health/login/lista y capturar contrato saneado.
2. 15–35: DTO y fallos tipados.
3. 35–55: SessionStore seguro; restauración/logout/401.
4. 55–80: preference/cache LocalStore y re-instanciación.
5. 80–100: Repository remote-first/fallback y `stale`.
6. 100–115: estados ViewModel, empty/error/retry.
7. 115–120: registro mínimo y siguiente riesgo.

Las fases anteriores ya entrenan cada bloque; no debes aprenderlo todo aquí desde cero.

## Escenarios de aceptación

| Caso | Activación | Observable |
|---|---|---|
| normal | sin query | datos frescos y operación toggle |
| vacío | `scenario=empty` | estado vacío, no error |
| 401 | `scenario=unauthorized` | sesión borrada y login |
| 404 | id inexistente | mensaje de recurso no encontrado |
| 500 | `scenario=server-error` | retry; cache si existe |
| formato | `scenario=invalid-json` | error de contrato |
| timeout | `scenario=slow` | estado timeout sin spinner infinito |
| offline tras cache | detener API | datos `stale` claramente marcados |
| persistencia | recrear stores/app | preferencia y sesión según política |

## Evidencia I2

Entrega código, decisiones, comandos y registro de casos. Capturas aisladas no sustituyen ejecución. El token se sanea como `DEMO-…<redacted>` incluso siendo ficticio para practicar el hábito.

## I3 · 23 min simultáneos

Recibirás una variante no anunciada. Haz el cambio sin agente, ejecuta al menos una comprobación focalizada y explica la capa. Después hay 15 min para ejecución/debugging y 10 min de explicación/cierre dentro del taller de 55 min. Variantes exactas son reservadas.

## Errores que no se aceptan

- `badCertificateCallback => true`;
- token en preferencias, constante o log;
- contraseña persistida;
- red dentro de `build()`;
- cache ocultando 401;
- afirmar que HTTP local valida HTTPS;
- capturas o resultados fabricados.

