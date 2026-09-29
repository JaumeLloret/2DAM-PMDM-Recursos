# PM7 · Guía del alumnado · una feature y un proceso explicable

Recibes una lista Flutter con cuatro entradas DEMO. Añadirás búsqueda por título y filtro de estado, y demostrarás cómo llegaste a ese resultado. Lee primero [Empieza aquí](../AULES/01_EMPIEZA_AQUI_PM7.html) y sigue la [Ruta](../Alumnado/00_RUTA_PM7.md). Si estudias solo, empieza por la carpeta `Practica/Starter/spec_search/` y sus cuatro comandos de baseline: en los primeros **20 min** debes poder mostrar los cuatro datos y un test de humo verde, aclarando que aún no existe la feature.

**Presupuesto por estudiante:** 6 h = **360 min**: 270 autónomos y dos misiones T1/T2 de 45 min efectivos. T1 **26/01/2027**, T2 **02/02/2027**, martes 19:30–20:25 (10 min de margen operativo). Taller presencial y [misión desde casa](10_TALLERES_Y_EQUIVALENCIAS_PM7.md) son **alternativas**: realiza una sola vía de cada T. I3 puede supervisarse en cita reprogramada dentro de T2, sin añadir otra tarea.

**Calendario de AULES pendiente:** apertura, entrega objetivo y cierre/cutoff aún no confirmados. Las fechas de taller no son fechas de entrega. Antes de abrir PM7, aparecerán en portada, Ruta, sección y tarea.

## Qué abrir y qué conservar

| Paso | Material y acción | Comprobación | Evidencia |
|---|---|---|---|
| A01 | [Entorno](../Alumnado/02_ENTORNO_Y_FUENTES_PM7.md): copia el starter completo y corre baseline | Cuatro DEMO y humo verde, sin búsqueda | D05 inicial |
| A02–A03 | [Teoría](02_CONTENIDOS_PM7.md), [ejemplos](03_EJEMPLOS_GUIADOS_PM7.md), [entrenamiento](04_ENTRENAMIENTO_PM7.md); pregunta **antes** de la [tarjeta](05_SPEC_Y_DECISIONES_PM7.md) | Regla S3 y alternativas explicables | D01–D04 |
| T1–A04 | [Taller/casa](10_TALLERES_Y_EQUIVALENCIAS_PM7.md) y [laboratorio](06_LABORATORIO_PM7.md): política, UI y pruebas | AND, normalización acotada, vacío, limpiar | Código/tests y D04–D05 |
| A05 | Revisa `git diff` y prepara PR o borrador | Alcance y S1–S7 contrastados | D06–D07 |
| T2 | Predice y modifica regla nueva sin agente, con supervisión individual reprogramable | Diff, test y explicación reales o `PENDIENTE_SUPERVISION` | D08 |
| A06–A07 | [Autoevaluación](12_AUTOEVALUACION_PM7.md), feedback, corrección y corte final | Dossier y código cuentan la misma historia | Entrega única y handoff |

El producto es **Consulta DEMO**. Sigue Spec → Clarificación → Plan → Tasks → Implementación incremental → Tests/análisis → Revisión de diff → PR → Defensa. PM6 ya enseñó tests/CI; aquí documentas cuándo y por qué los aplicaste. PI4 gobierna el proyecto, mientras PM7 evalúa el proceso técnico documentado. Si falta una herramienta de agente autorizada, trabaja **MANUAL** y registra el mismo alcance, tareas, diff, pruebas y límites.

## Cuatro conceptos que no se confunden

- **RA2.i** es el criterio curricular: «Se han documentado los procesos necesarios para el desarrollo de las aplicaciones». No se crean CE por contar prompts, tests o documentos.
- **S3** es un criterio del **producto**: con «cámara» y «pendientes» se ve solo DEMO-A. S1–S7 son ejemplos verificables del caso, no notas independientes.
- Una **tarea** dice qué archivo cambias y con qué límite: «implementar selección en `lib/catalog.dart`». Una **prueba** contrasta el resultado: consulta + pendientes devuelve el ID DEMO-A. Un test verde con otra entrada no basta para S3.
- D01–D08 son **ocho apartados de un solo [dossier](../Alumnado/01_DOSSIER_SDD_PM7.md)**, no ocho entregas ni ocho porcentajes. Entrega código, tests y dossier por el canal que confirme el docente; un borrador de PR se marca como tal.

La [evaluación](07_EVALUACION_PM7.md) combina I1, I2 e I3 sin modificar RA2 35 % global, mínimos ni prueba práctica presencial global separada. Para I3: predicción, cambio propio sin agente, diff, comprobación y actualización documental supervisados. Si falta observación, escribe `PENDIENTE_SUPERVISION` y solicita cita; no simules defensa. La recuperación Préstamo DEMO se abre solo al alumnado asignado y la [ampliación](09_AMPLIACION_PM7.md) es opcional.

**Si te bloqueas:** [Ayuda por síntomas](11_AYUDA_PM7.md). No entregues un historial inventado: D05 distingue EJECUTADO, PROPUESTO y PENDIENTE, y cada comando se vincula al corte que realmente comprobaste.
