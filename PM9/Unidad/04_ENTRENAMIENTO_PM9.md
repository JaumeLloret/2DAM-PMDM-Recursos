# Entrenamiento graduado · PM9

Distribuido dentro de A03–A07/A09/A10 y talleres; no añade carga ordinaria. Conserva intento y corrección; las variantes I3 no se publican aquí.

| Nivel | Ejercicio | Salida verificable | Pista |
|---|---|---|---|
| 1 | E1 Describe una victoria y dos derrotas | Reglas con condiciones observables | Recoger todo no basta sin muelle |
| 1 | E2 Distingue escena, regla y UI | Ruta y responsabilidad de cada una | El contador no debe tener una copia incoherente del progreso |
| 1 | E3 Crea instancia con ID distinto | CellB configurada y justificada | Compartir mesh no comparte identidad |
| 1 | E4 Identifica material frente a física | Parámetro visual y físico con efecto | Roughness no es fricción de CharacterBody3D |
| 2 | E5 Evita doble recogida | Caso repetido e ID desconocido | Guardas antes de mutar conjunto |
| 2 | E6 Predice pausa y final | Tabla de tick/collect/hit en PAUSED/WON | Los estados terminales no reabren ronda |
| 2 | E7 Reproduce daño repetido | Dos eventos dentro/fuera de inmunidad | Distingue contacto de impacto aceptado |
| 2 | E8 Contrasta control móvil | Pulsación/liberación/foco/pausa registrados | La acción abstracta no prueba dedo real |
| 2 | E9 Conecta audio y HUD | Evento→tono→texto equivalente | No disparar sonido cada frame terminal |
| 3 | E10 Aísla un fallo de escena | Entrada, esperado, observado, causa y regresión | IDs duplicados pueden fallar con reglas correctas |
| 3 | E11 Interpreta profiling | Base/cambio/condiciones/resultado/límite | No inventar mejora si no se observa |
| 3 | E12 Cierra documentación | SHA, arranque, Android, pruebas y QA pendiente | Build no sustituye implantación real |

Si E1–E4 fallan, vuelve a diseño y responsabilidades antes de añadir código. Si E5–E9 fallan, usa un caso pequeño y registra la transición. Si E10–E12 fallan, reduce variables y separa niveles de evidencia. El docente evalúa CE y comprensión; no convierte esta lista en doce porcentajes.
