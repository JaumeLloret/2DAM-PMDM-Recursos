# T1 · Una misión, dos formas de hacerla

El **martes 09/02/2027 de 19:30 a 20:25** hay una franja nominal de 55 minutos: trabajaremos **45 minutos efectivos** y dejaremos 10 para entrada, equipo y cierre. Puedes hacer **la vía presencial o la vía íntegra desde casa**. Elige una; no tienes que hacer las dos. El objetivo y la evidencia son iguales: relacionar jerarquía, coordenadas y recurso compartido del proyecto existente y realizar una modificación nueva I3. Todo lo necesario está en [teoría](../Unidad/02_CONTENIDOS_PM8.md), [ejemplos](../Unidad/03_EJEMPLOS_GUIADOS_PM8.md), [proyecto completo](../Practica/Starter/motor_lab/README.md) y [dossier](01_DOSSIER_MOTOR_LAB_PM8.md).

Antes de empezar, usa tu copia `motor_lab_trabajo`, Godot 4.7.2 Standard y `scenes/lab3d.tscn`. Conserva otra copia sin tocar. Si tu equipo no abre el editor, registra el fallo en L02 y pide acceso docente; no inventes un resultado gráfico. La actividad se puede retomar en un equipo del centro.

| Minutos | En el aula o desde casa | Registro común |
|---:|---|---|
| 0–8 | Abre Lab3D, localiza `Pivot/Probe`, `ProbeCopy`, `materials/copper.tres` y el texto del HUD. Di qué relación es «contiene» y cuál es «usa». | L05: tabla de dos relaciones y versión/estado |
| 8–18 | Predice la posición global de Probe si Pivot pasa de (2,0,0) a (3,0,0), sin girar. El valor local (1,1,0) sigue igual. Escribe el cálculo antes de tocar nada. | L05: antes, predicción y razón |
| 18–30 | En una copia, cambia **solo** X de la posición de Pivot 2 → 3 en el Inspector, ejecuta y contrasta el HUD con la predicción. Detén y restaura X = 2. Una captura puede acompañar la tabla, pero añade los valores y la explicación. | L06: diff/valor, modo observado, restauración |
| 30–40 | **I3 individual:** recibe del docente una propiedad o relación nueva durante la sesión o en cita; predice, cambia una sola variable, comprueba y restaura sin solución ni ayuda generativa. Si trabajas en casa, prepara tu predicción y copia de trabajo; concierta la observación individual. | L06: consigna recibida, predicción, diff/valores y resultado; `PENDIENTE_SUPERVISION` hasta observación auténtica |
| 40–45 | Explica oralmente o ante el docente por cita por qué cambió el valor global y qué no cambió; anota un error corregido y el estado de I3. | L05/L06 y siguiente paso |

La cita para I3 **sustituye el tramo de supervisión previsto dentro de T1**: puedes adelantar la preparación desde casa y concertar esos minutos en otra franja. No es una segunda misión ni añade 45 minutos al presupuesto. Si no se ha producido la observación, entrega el trabajo preparado con `PENDIENTE_SUPERVISION`; el docente organizará oportunidad real y no dará I3 por verificada mediante una captura. El docente asigna la variante individual sin publicar el banco de variantes; la parte común de esta página basta para estudiar en casa.

**Si falla:** si el valor global no coincide, comprueba que gira = detenido, que has editado Pivot y no Probe, y que solo cambiaste X. Si aparece un error tras editar el `.tscn`, restaura la copia y usa el Inspector. Si no hay ventana, conserva texto del fallo y solicita cita/equipo. Después pasa a A06 para integrar L05/L06 en el único dossier.
