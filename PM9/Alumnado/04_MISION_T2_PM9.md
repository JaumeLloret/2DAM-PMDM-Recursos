# T2 · Reglas, colisiones y estados · 45 min

**Martes 23/02/2027, 19:30–20:25:** 45 min efectivos y 10 min de margen. Elige **presencial o desde casa**, no ambas. Entrada: CellA/B/C y primer corte de G03/G04; si falta algo, usa un caso mínimo y documenta el bloqueo. Salida equivalente: un recorrido reproducible de recogida/daño/pausa/reinicio, con un fallo o comprobación sin hallazgo y regresión en G03/G04.

## Idea necesaria

rules.gd decide si un evento está permitido según READY, PLAY, PAUSED, WON o LOST; main.gd conecta áreas con reglas y UI. El CharacterBody3D choca con suelo/paredes; las Area3D detectan balizas, peligros y muelle. Un contacto repetido durante 1,2 s de inmunidad no debe restar otra vida. Lee [teoría](../Unidad/02_CONTENIDOS_PM9.md) §§3, 6–7 y [entrenamiento](../Unidad/04_ENTRENAMIENTO_PM9.md) E5–E8.

| Minutos | Presencial | Desde casa, mismo resultado |
|---|---|---|
| 0–7 | Predice dos casos: ID repetido y pausa antes de recibir daño | Escribe las mismas dos predicciones |
| 7–20 | Ejecuta/corrige un caso pequeño de rules.gd; comprueba que la regla no cambia fuera de PLAY | Ejecuta/corrige el mismo caso en tu copia; registra entrada/esperado/obtenido |
| 20–35 | Ejecuta F5: pared, una recogida y un cono; inspecciona capas/máscaras, forma e inmunidad | Ejecuta el mismo recorrido gráfico, con observación propia; si falla, conserva log |
| 35–42 | Pausa y reinicia; contrasta vidas, tiempo, balizas y posición; repite un caso tras la corrección | Pausa/reinicia y repite el mismo contraste y regresión |
| 42–45 | Anota G03/G04: corte, modo, resultado y límite | Anota exactamente los mismos campos |

Si un test de reglas pasa y la escena no recoge, revisa pickup_id, conexión body_entered, capas/máscaras y escena cargada. No quites la guarda de duplicados ni atribuyas la prueba headless a dedos o física de un teléfono. El checkpoint G03/G04 da feedback, no una segunda entrega calificada. Pide una cita sustitutiva de estos 45 min si el editor está bloqueado.
