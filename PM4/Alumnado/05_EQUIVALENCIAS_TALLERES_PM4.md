# PM4 · Hoja de misiones autónomas equivalentes

Esta hoja permite completar fuera del aula la misma finalidad, los mismos 45 minutos efectivos (55 nominales en la franja presencial, con 10 de margen) y la misma clase de evidencia que cada taller opcional. Elige taller o misión autónoma; no hagas ambos.

La misión autónoma sustituye al taller y no se suma. Los 10 min de cada bloque se redistribuyen en las fases 5, 9 y 10 de la Ruta (105, 130 y 70 min).

## Misión 1 · 03/11 · red, errores y arranque

1. Arranca la API y comprueba `/health`.
2. Reproduce normal, `invalid-json` y `slow`.
3. Registra método, URI saneada, código, duración y estado.
4. Escribe dos hipótesis para un fallo.
5. Ejecuta una prueba mínima, aplica un cambio y comprueba una regresión.

**Entrega:** `síntoma → capa → hipótesis → prueba → cambio/resultado`. No incluyas `Authorization`.

## Misión 2 · 10/11 · sesión, persistencia y Repository

1. Clasifica token, preferencia, cache y contraseña.
2. Demuestra una preferencia con nueva instancia.
3. Carga datos, detén la API y observa fallback con `stale`.
4. Provoca 401 y confirma que se borra sesión.
5. Explica remote-first y cuándo no se usa cache.

**Entrega:** matriz dato/almacén/motivo + re-instanciación + flujo normal/fallback/401.

## Misión 3 · 17/11 · I3 individual

La variante exacta no se publica aquí. Se asigna por AULES con la misma ventana que en el taller:

- 23 min de microcambio sin agente;
- 12 min de ejecución/depuración;
- 7 min de explicación;
- 3 min de registro; la revisión final está en la fase 10 de la Ruta.

**Entrega:** predicción previa, diff mínimo, comando/salida, regresión y explicación de la capa. Si el entorno bloquea, registra `PENDIENTE_ENTORNO`; no fabriques la ejecución.

Usa solo datos `DEMO-*`. Nunca entregues credenciales reales, token completo, `Authorization`, `.env`, IP pública ni datos personales.

