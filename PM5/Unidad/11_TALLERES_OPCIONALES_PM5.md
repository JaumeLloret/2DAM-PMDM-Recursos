# PM5 · Talleres opcionales y misiones autónomas equivalentes

Los talleres ofrecen acompañamiento, observación, debugging y feedback. **No contienen teoría, recursos ni evidencias exclusivas.**

En cada fecha eliges una vía:

- **vía A · taller opcional**, con acompañamiento;
- **vía B · misión autónoma equivalente**, disponible en AULES.

Ambas duran 45 minutos efectivos (55 minutos nominales de franja presencial, con 10 de margen), persiguen la misma finalidad y producen la misma clase de evidencia. No haces las dos. La vía autónoma permite completar el aprendizaje; si un CE exige observación física, esa observación queda pendiente y se agenda, sin convertir el fake en hardware.

Los tres bloques mantienen exactamente la misma duración en ambas vías:
**bloque 1 = 45 min, bloque 2 = 45 min y bloque 3 = 45 min efectivos**.

## Taller 1 · permisos y BLE

**Fecha:** 24/11/2026 · 19:30–20:25.
**Finalidad:** explicar una decisión de permiso, recorrer BLE y demostrar cleanup.

### Vía A · taller opcional

El profesor acompaña la preparación de Android/periférico, contrasta estados y observa cuando exista hardware. Cada persona ejecuta también el recorrido fake y conserva su propia evidencia.

### Vía B · misión autónoma · 45 min

| Min | Acción | Checkpoint |
|---:|---|---|
| 0–10 | Predice denied/permanentlyDenied/unavailable y ejecuta dos estados fake. | mensajes y rescates distintos |
| 10–25 | Recorre scan→stop→connect→DEMO-PING. | una suscripción, id no persistido |
| 25–35 | Provoca timeout o desconexión. | estado recuperable y cleanup |
| 35–42 | Suspende con scan/conexión activos. | nada queda activo |
| 42–45 | Redacta ticket causal. | síntoma→capa→prueba→resultado→evidencia |

**Evidencia en ambas vías:** transición de permiso, secuencia BLE, error/cleanup y estado FAKE/REAL/pendiente.

## Taller 2 · sensor, media y debugging

**Fecha:** 01/12/2026 · 19:30–20:25.
**Finalidad:** controlar un stream y demostrar una conversión real mientras se depura un fallo.

### Vía A · taller opcional

Se comparan trazas, se observa el pipeline y el profesor acompaña una incidencia. Si hay dispositivo preparado, se contrasta la parte física; no se exige para poder completar la misión.

### Vía B · misión autónoma · 45 min

| Min | Acción | Checkpoint |
|---:|---|---|
| 0–10 | Ejecuta sensor fake y anota frecuencia/repintado. | última muestra y cancelación |
| 10–25 | Procesa `DEMO-PNG-01`. | MIME, dimensiones y `FF D8` |
| 25–35 | Inyecta `DEMO-CORRUPT-01`. | fallo tipado, app recuperable |
| 35–42 | Suspende/reanuda y comprueba recursos. | no hay stream/player fantasma |
| 42–45 | Cierra incidencia y regresión. | registro saneado |

**Evidencia en ambas vías:** diff mínimo, tres comprobaciones de conversión, debugging y estado de evidencia.

## Taller 3 · I3 y defensa

**Fecha:** 15/12/2026 · 19:30–20:25.
**Finalidad:** demostrar comprensión individual con una microvariación reservada.

La variante se entrega por el canal de AULES tanto en la vía presencial como en la autónoma. Las dos vías usan el mismo bloque:

En ambas vías, I3 conserva **23 min sin agente**.

| Tramo | Min | Acción | Evidencia |
|---|---:|---|---|
| preparación | 5 | recibe variante, abre tu starter y baseline | estado inicial |
| I3 sin agente | 23 | predice e implementa el microcambio | predicción + diff |
| ejecución | 10 | ejecuta, depura y comprueba regresión | comando + resultado |
| explicación | 5 | explica capa, recurso, decisión y límite | defensa focalizada |
| cierre | 2 | registra evidencia y pendiente físico | estado honesto |
|  | **45** |  |  |

En el taller existe observación/feedback inmediato. En la vía autónoma entregas las mismas piezas dentro de la ventana asignada y realizas la explicación por el mecanismo individual previsto. I3 no acredita hardware si no se ha observado hardware.

El registro ampliado se cierra en la fase 11. Reutiliza tus decisiones y pruebas anteriores: no repitas la misión ni redactes otra memoria. I3 conserva 23 min sin agente y el bloque completo dura 45 min efectivos.

## Pedir ayuda sin exponer datos

Indica fase, vía, carril, sistema, editor, destino, acción/comando, primer error, esperado y pruebas realizadas. No compartas MAC, serial, cuenta, ruta personal, foto/audio personal ni log crudo.
