# Equivalencias de talleres · PM5

La equivalencia **sustituye** el taller; nunca se acumula a los 720 min. Requiere acuerdo/causa según las reglas del centro y puede dejar observación física pendiente.

| Taller | Equivalencia de 55 min | Evidencia |
|---|---|---|
| 1 · permisos/BLE | 10 min predicción + 25 min trazas fake + 15 min diagnóstico + 5 min ticket | transición, cleanup y `PENDIENTE_HARDWARE` si procede |
| 2 · sensor/media | 10 min traza + 25 min conversión fixture + 15 min error corrupto + 5 min registro | diff, bytes/dimensiones y depuración |
| 3 · I3 | sesión individual reprogramada de 55 min con 23 min sin agente | cambio, ejecución, explicación y estado |

La equivalencia no convierte un fake en prueba real. Cuando el CE exija capacidad física, se agenda observación con equipo del centro.


