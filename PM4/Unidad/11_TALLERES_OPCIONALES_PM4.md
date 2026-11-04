# PM4 · Talleres opcionales y misiones autónomas equivalentes

Los talleres ofrecen acompañamiento, práctica, debugging y feedback. No contienen teoría, recursos ni evidencias exclusivas. En cada fecha eliges **una vía**:

- **vía A · taller opcional**, con acompañamiento;
- **vía B · misión autónoma equivalente**, disponible en AULES.

Ambas duran 45 minutos efectivos (franja presencial de 55 minutos nominales: 10 de margen), persiguen la misma finalidad y producen la misma clase de evidencia. No se hacen las dos.

## Taller 1 · HTTP, errores y arranque

**Fecha:** 03/11/2026 · 19:30–20:25.
**Finalidad:** separar un fallo de API, transporte, protocolo, formato o timeout.

### Misión presencial

En parejas de diagnóstico —cada persona conserva su evidencia— se comprueba health, se reproduce un error y se explica la capa antes de proponer un cambio. El profesor acompaña bloqueos y contrasta hipótesis.

### Misión autónoma equivalente · 45 min

| Min | Acción | Checkpoint |
|---:|---|---|
| 0–10 | Arranca API y verifica `/health`. | 200 o bloqueo exacto. |
| 10–25 | Ejecuta normal, `invalid-json` y `slow`. | Código/salida saneados. |
| 25–40 | Clasifica síntoma, capa y dos hipótesis. | Una prueba mínima descarta una hipótesis. |
| 40–45 | Aplica o describe el cambio mínimo y comprueba una regresión. | Caso vuelve a ejecutarse. |

El cierre y el registro técnico ampliado se completan en la fase 5 de la Ruta, ya ampliada a 105 min.

**Evidencia en ambas vías:** registro técnico saneado y explicación causal breve.

## Taller 2 · sesión, persistencia y Repository

**Fecha:** 10/11/2026 · 19:30–20:25.
**Finalidad:** decidir qué persiste, demostrar re-instanciación y explicar remote-first.

### Misión presencial

Se comparan token, preferencia, cache y contraseña; se prueba un store con nueva instancia; se sigue el flujo normal, fallback y 401.

### Misión autónoma equivalente · 45 min

| Min | Acción | Checkpoint |
|---:|---|---|
| 0–10 | Clasifica cuatro datos por sensibilidad y vida. | Matriz dato → almacén → motivo. |
| 10–25 | Escribe/lee una preferencia con nueva instancia. | Persistencia observable. |
| 25–40 | Carga remoto, detén API y repite. | Cache con `stale=true`. |
| 40–45 | Provoca 401 y explica la política remoto/local. | Sesión borrada; cache no oculta el 401. |

El registro ampliado de la política se integra en la fase 9 de laboratorio (130 min).

**Evidencia en ambas vías:** matriz de persistencia, resultado de re-instanciación y explicación remote-first.

## Taller 3 · I3 y cierre

**Fecha:** 17/11/2026 · 19:30–20:25.
**Finalidad:** demostrar comprensión individual mediante un cambio pequeño no preparado.

La variante exacta permanece reservada y se asigna por el canal de AULES tanto en la vía presencial como en la autónoma.

| Tiempo | Acción | Evidencia |
|---:|---|---|
| 23 min | Predice y realiza la microvariación sin agente. | predicción + diff |
| 12 min | Ejecuta, depura y comprueba una regresión. | comando + resultado |
| 7 min | Explica la capa, decisión y límite. | explicación focalizada |
| 3 min | Registra estado y pendiente; la revisión final está en la fase 10. | checklist real |

En el taller puede observarse en directo y recibes feedback inmediato. En la vía autónoma entregas las mismas piezas dentro de la ventana asignada. Si el entorno bloquea la ejecución, registra `PENDIENTE_ENTORNO`; si falta autenticidad, `PENDIENTE_EVIDENCIA`. No se inventa una observación.

Los 10 min retirados de cada misión se distribuyen en las fases 5, 9 y 10 de la Ruta. I3 mantiene 23 min sin agente; el resto de la misión 3 suma 22 min y no se añade otra comprobación.

## Cómo pedir ayuda

Aporta fase, sistema, destino, comando, URL saneada, primer error, resultado esperado y acciones probadas. Nunca compartas contraseñas, token completo, `Authorization`, IP pública ni datos personales.

