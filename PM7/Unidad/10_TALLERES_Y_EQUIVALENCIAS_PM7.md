# PM7 · T1/T2: taller opcional o misión desde casa

**Fechas vigentes:** T1 **26/01/2027**, T2 **02/02/2027**, martes **19:30–20:25** (Europe/Madrid). La franja nominal dura 55 min, pero cada misión tiene **45 min efectivos** y 10 min de margen operativo presencial. Dentro de las 6 h de PM7: **270 min autónomos + 45 + 45 = 360 min**. Para cada T eliges taller **o** misión desde casa, nunca ambas. Las fechas de taller no son plazos de entrega; apertura, entrega objetivo y cierre/cutoff están pendientes de confirmación docente.

Todo el conocimiento y la consigna ordinaria aparecen en la [Ruta](../Alumnado/00_RUTA_PM7.md), [Teoría](02_CONTENIDOS_PM7.md), [ejemplos](03_EJEMPLOS_GUIADOS_PM7.md), [tarjeta](05_SPEC_Y_DECISIONES_PM7.md) y [laboratorio](06_LABORATORIO_PM7.md). El taller aporta acompañamiento, no una regla secreta. Trabajar MANUAL o con herramienta autorizada conduce a la misma salida.

## T1 · Cerrar contrato y primer incremento · 45 min

**Entrada:** starter con humo comprobado; D01 provisional y preguntas D02 escritas antes de consultar la tarjeta. **Salida equivalente:** spec cerrada, prueba discriminante de S3, política inicial y D04/D05 con resultado real. Usa `lib/catalog.dart` y `test/search_test.dart` de tu copia.

| Min | Taller presencial opcional | Misión autónoma desde casa | Comprueba y conserva |
|---:|---|---|---|
| 0–8 | Comparas preguntas con otra persona. | Lee tu D02 y predice cámara + pendientes. | Anota expectativa DEMO-A antes de cambiar código. |
| 8–18 | Contrastáis C1–C6. | Consulta la tarjeta y marca fuente/motivo de cada decisión. | D01/D02 sin ambigüedad oculta. |
| 18–25 | Acordáis tareas pequeñas. | Escribe tarea de política S1–S5 y archivo/test permitido. | D03/D04 con alcance y condición de parada. |
| 25–40 | Implementas con apoyo. | Sigue el ejemplo rojo/verde de S3 en tu copia; corrige AND. | Test rojo esperado, diff mínimo y verde real o primer fallo documentado. |
| 40–45 | Recibes feedback. | Revisa diff y escribe duda/próximo incremento. | D05 y límite de la comprobación. |

Si no hay Flutter, registra `PENDIENTE_ENTORNO`, formula spec/tareas y solicita acceso para ejecutar la prueba. No marques verde sin log. Si la prueba no compila, usa [Ayuda](11_AYUDA_PM7.md) antes de diagnosticar S3.

## T2 · Cambio individual sin agente y explicación · 45 min

**Entrada:** feature y dossier del corte propio; D06/D07 preparados. **Salida equivalente:** D08 con predicción, cambio nuevo sin agente, diff, prueba, regla/documento actualizado y observación supervisada auténtica o `PENDIENTE_SUPERVISION`.

| Tramo | Min | Qué haces |
|---|---:|---|
| Preparación del corte | 5 | Abre código, test y D01/D02. Anota versión y resultado anterior. |
| Contraste de reglas | 3 | Predice qué pasaría si cambia una regla; no abras variantes reservadas. |
| I3 individual supervisado | 22 | El docente comunica una variante **no preparada** al iniciar la cita. Cambia tu código sin agente y guarda diff. |
| Ejecución y explicación supervisada | 10 | Ejecuta prueba pertinente, explica predicción, resultado, decisión y documento actualizado. |
| Cierre | 5 | Anota feedback real, corte y siguiente paso en D08. |
| **Total** | **45** | Una sola vía. |

**Vía presencial:** los tramos se realizan en T2 si la supervisión individual cabe realmente. **Vía desde casa:** prepara los 8 min iniciales y el cierre desde casa; concierta los **32 min supervisados** de I3 en otra cita/tutoría por canal institucional, a distancia si el centro lo permite o en otra franja. La cita ocupa tiempo de **este mismo bloque**, no suma otra misión. El docente comunica la variante al inicio de la supervisión. Si aún no ocurre, conserva `PENDIENTE_SUPERVISION`; una modificación doméstica sin observación no se presenta como I3 aprobado.

El docente puede concertar supervisiones individuales también para quienes acudieron al taller si no cupieron en la franja. La prueba práctica presencial global PMDM continúa separada de I3. No se publican soluciones, variantes ni datos de compañeros.
