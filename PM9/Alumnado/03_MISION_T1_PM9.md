# T1 · Escenas y primer objeto propio · 45 min

**Martes 16/02/2027, 19:30–20:25:** 45 min efectivos y 10 min de margen. Elige **presencial o desde casa**, una sola vía. Esta fecha no es una entrega. Entrada: copia del Starter abierta y G01 inicial. Salida idéntica en ambas vías: CellB instanciada con identidad propia, escena guardada, prueba descrita y G02 actualizado.

## Por qué y con qué

Una escena reutilizable define forma y comportamiento compartidos; cada instancia necesita un ID y una posición distintos. Si duplicas CellA sin cambiar pickup_id, la regla de unicidad verá la misma baliza dos veces. Lee [el ejemplo de instancia](../Unidad/03_EJEMPLOS_GUIADOS_PM9.md) §2 y [el contrato](../Unidad/05_DISENO_DE_JUEGO_PM9.md). Trabaja en tu copia de Practica/Starter/beacon_dock, nunca en la solución.

| Minutos | Presencial | Desde casa, resultado equivalente |
|---|---|---|
| 0–5 | Predice en G02 qué cambiará entre CellA y CellB; comprueba el corte | Lee este objetivo, predice en G02 y comprueba el corte |
| 5–15 | Localiza Pickups/CellA y pickup.tscn; explica escena frente a instancia con un compañero | Localiza los mismos nodos; escribe en dos frases escena frente a instancia |
| 15–30 | Instancia pickup.tscn bajo Pickups como CellB; asigna pickup_id CELL-B y posición (3,0.9,-4) | Realiza exactamente esa instancia/configuración con el ejemplo abierto |
| 30–40 | Guarda main.tscn; ejecuta F5 y compara árbol, identidad y posición; comunica fallo concreto | Guarda y ejecuta F5; compara árbol, identidad y posición; registra fallo concreto |
| 40–45 | Registra recurso, valores, versión/corte, modo observado y siguiente paso en G02 | Registra los mismos datos y siguiente paso en G02 |

CellB puede verse sin que las reglas estén completas: **verla no prueba recogida ni victoria**. Si falla, restaura la copia inicial de la escena, comprueba que la instancia está bajo Pickups y que el ID no sigue siendo CELL-A. Guarda el mensaje de error si no abre. Conserva G02 como checkpoint para feedback, sin tarea calificada adicional. Después A04 crea CellC y completa las reglas. Una tutoría por bloqueo sustituye tiempo de esta misión; no obliga a repetir la vía desde casa.
