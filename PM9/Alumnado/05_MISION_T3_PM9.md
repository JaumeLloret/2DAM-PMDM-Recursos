# T3 · Preparar Android sin fingir implantación · 45 min

**Martes 02/03/2027, 19:30–20:25:** 45 min efectivos y 10 min de margen. Elige **presencial o desde casa**. Entrada: proyecto propio y G05; salida equivalente: estado comprobado de Godot/templates/JDK/SDK/preset, un intento de exportación o error reproducible y plan de acceso real anotados en G06. A08 completa exportación/instalación cuando haya entorno.

## Qué significa cada comprobación

Editor abierto = fuente importada; F5 = juego observado en ordenador; smoke headless = baseline de reglas; APK debug = paquete construido; instalación y recorrido en móvil autorizado = evidencia distinta. Solo esta última, con observación auténtica del desarrollo propio, puede sustentar implantación RA5.h. Consulta [entorno y Android](02_ENTORNO_ANDROID_Y_QA_PM9.md) y [evaluación](../Unidad/07_EVALUACION_PM9.md).

| Minutos | Presencial | Desde casa, mismo resultado |
|---|---|---|
| 0–8 | Identifica versión 4.7.2 Standard/Compatibility y corte fuente | Identifica la misma versión y corte |
| 8–18 | Revisa templates 4.7.2, JDK 17, SDK y preset Android; registra faltantes | Revisa los mismos prerrequisitos y registra faltantes |
| 18–33 | Intenta export-debug a carpeta externa; conserva log o error exacto | Realiza el mismo intento; si no hay SDK, documenta bloqueo y siguiente acción |
| 33–41 | Distingue build de instalación; acuerda turno de dispositivo si falta | Distingue build de instalación; solicita turno/cita por canal docente |
| 41–45 | Completa G06 con modo, corte, resultado y límite | Completa los mismos campos G06 |

Un build lento puede terminar durante A08: no conviertas espera en minutos ocultos ni declares exportación lograda por el mero inicio. Si falta renderer, SDK/JDK o templates, sigue el [diagnóstico](02_ENTORNO_ANDROID_Y_QA_PM9.md); conserva PENDIENTE_ENTORNO o PENDIENTE_DISPOSITIVO_REAL según corresponda. El checkpoint G06 permite feedback, no crea otra tarea calificada.
