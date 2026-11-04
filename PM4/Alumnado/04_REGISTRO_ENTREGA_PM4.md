# PM4 · Registro de entrega

## Entorno

| Dato | Valor |
|---|---|
| SO y editor | |
| Flutter / Dart | |
| Destino (`flutter devices`, sin serial) | |
| Comando API | |
| Comando app | |
| `API_BASE_URL` saneada | |
| Versión del trabajo | |

No incluyas rutas personales, seriales, IP pública, password, token completo o `Authorization`.

## Matriz de ejecución

| Caso | Entrada/configuración | Código/estado | Evidencia observable | Estado real |
|---|---|---|---|---|
| API ready + health | | | | PASS / FAIL / NO EJECUTADO |
| login | | | | |
| lista normal / toggle | | | | |
| empty | | | | |
| 401 + borrado sesión | | | | |
| 404 | | | | |
| 500/503 | | | | |
| invalid-json / DTO inválido | | | | |
| timeout | | | | |
| cache/fallback + `stale` | | | | |
| preferencia/cache re-instanciada | | | | |
| sesión restaurada | | | | |
| logout correcto | | | | |
| logout con fallo de persistencia | | | | |
| HTTPS válida | | | | |
| `flutter analyze` | | | | |
| `flutter test` | | | | |

## Decisiones

1. ¿Qué dato va a SessionStore y por qué?
2. ¿Qué dato va a LocalStore y por qué?
3. ¿Cuándo permite fallback tu Repository?
4. ¿Qué ocurre específicamente ante 401?
5. ¿Cómo distingues datos frescos y antiguos?

## Autenticidad

- diff respecto al starter:
- predicción I3:
- cambio I3:
- ejecución y regresión:
- explicación de capa:
- uso de IA fuera de I3 y verificación:

Si algo no se ejecutó, escribe `NO EJECUTADO` y el bloqueo. No estimes ni copies una salida ajena.

