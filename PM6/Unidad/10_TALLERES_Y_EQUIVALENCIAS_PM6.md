# PM6 · Dos talleres de apoyo y dos misiones equivalentes

**Fechas vigentes:** T1, **12/01/2027**; T2, **19/01/2027**. Franja nominal de PMDM: **19:30–20:25** (Europe/Madrid). Se planifican **unos 45 min efectivos** por bloque; los 10 min restantes de la franja presencial absorben entrada, equipos y transición. En casa la misión dura 45 min. Elige **taller o misión desde casa**, nunca ambos: finalidad y evidencia son equivalentes, sin contenido imprescindible reservado al aula. Los 20 min efectivos que salen de los antiguos T1/T2 están en A04 y A05 de la [ruta](../Alumnado/00_RUTA_PM6.md); total curricular **480 min**.

**I3 no depende de asistir el 19/01.** Sus 22 min de modificación no preparada sin agente y 10 min de explicación son individuales y supervisados. Si eliges la vía desde casa, reserva una cita/tutoría individual por canal institucional (a distancia cuando el centro lo habilite, o reprogramada en otra franja). La variante se comunica al inicio de esa supervisión. La preparación en casa y el tramo supervisado suman **45 min**, no dos tareas de 45. La evaluación no se transforma en ejercicio doméstico sin supervisión.

## T1 · Fallo reproducible y fake controlado · 45 min

**Propósito:** distinguir humo verde y bug real; usar `ControlledStore` para una prueba que discrimina el contador. Entrada: copia que arranca, E1 leído y Q01 iniciado. Salida igual en ambas vías: rojo esperado, corrección mínima, verde y regresión en Q01/Q02. Puedes hacer toda la misión autónoma en casa con el starter publicado.

| Min efectivos | En taller opcional | Misión autónoma desde casa | Checkpoint igual |
|---:|---|---|---|
| 0–8 | Contrasta predicción con el grupo. | Localiza `pendingCount` y escribe expected=2/actual inicial. | Predicción antes del cambio. |
| 8–28 | Monta fake y test con apoyo. | Ejecuta E1 y un caso límite; clasifica rojo esperado o setup. | Comando y primer resultado. |
| 28–40 | Compara corrección y regresión. | Aplica cambio mínimo y repite contador + vacío/todos terminados. | Diff y verde observado. |
| 40–45 | Recibe feedback. | Escribe duda/incidencia y un límite de la evidencia host. | Q01/Q02. |

Si falta Flutter, sigue [Debugging](05_DEBUGGING_PM6.md), guarda el bloqueo y pide ayuda. No cambies la aserción para fabricar un verde.

## T2 · Evidencia en destino e I3 · 45 min

**Propósito:** contrastar las cuatro capas y explicar individualmente un microcambio. En A05/A06 ya preparaste Android, DevTools/CI y pruebas; aquí verificas el corte y el estado real. Si no tienes emulador/móvil en casa, registra `PENDIENTE_EMULADOR`/`PENDIENTE_DISPOSITIVO` y solicita acceso. Una APK compilada no cuenta como instalación. El acompañamiento del taller ayuda, pero no aporta contenido exclusivo.

| Tramo efectivo | Min | Taller o misión desde casa: misma finalidad/evidencia |
|---|---:|---|
| Preparación | 3 | Abre tu corte, comprueba resultado host y destino autorizado o pendiente. |
| Contraste | 5 | Muestra el registro del recorrido emulador, APK/CI y móvil real si se observaron; identifica capa y límite. |
| I3 supervisado sin agente | 22 | Recibe variante no preparada al inicio de la cita individual, predice y hace el microcambio; conserva diff. |
| Explicación supervisada | 10 | Ejecuta caso/regresión y explica decisión, resultado y límite al docente. |
| Cierre | 5 | Completa Q04/Q05, anota feedback y solicita turno físico si falta observación. |
| Total efectivo | **45** | Una vía, sin duplicar trabajo. |

**Vía taller:** los tramos se realizan el 19/01 con supervisión individual para I3. **Vía desde casa:** prepara desde casa los 8 min iniciales y los 5 de cierre; realiza los 32 min I3 mediante cita individual supervisada reprogramada. Si el centro dispone de canal telemático institucional para supervisión, la cita puede hacerse desde casa; si no, se concierta otra franja de tutoría, **sin exigir asistir al taller ordinario**. El mismo bloque de 45 min incluye ambas partes. La prueba presencial práctica global obligatoria sigue siendo un instrumento separado de I3.

En ambas vías se entrega evidencia saneada del mismo tipo. Si falta hardware, se acuerda observación posterior y se conserva el pendiente; no se simula RA2.g/h. No se publican variantes I3 ni seriales.
