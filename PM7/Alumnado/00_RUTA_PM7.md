# PM7 · Ruta de estudio autónomo · Consulta DEMO

**Meta.** Partirás de un catálogo Flutter de cuatro entradas y añadirás una búsqueda por título y estado. Documentarás el camino Spec → Clarificación → Plan → Tasks → Implementación incremental → Tests/análisis → Revisión de diff → PR → Defensa. Lo importante es que puedas justificar y modificar la feature, con herramienta autorizada o en modo **MANUAL**.

**Tiempo único:** 6 h = **360 min por estudiante**: **270 min autónomos + T1/T2 de 45 min efectivos**. Los 20 min liberados de los talleres históricos pasan a A04 (+10) y A05 (+10). En cada T eliges **taller o misión equivalente desde casa**, nunca ambos. La franja nominal de martes 19:30–20:25 conserva 10 min de margen operativo. T1: **26/01/2027**. T2: **02/02/2027**. La supervisión individual I3 puede concertarse en otra cita dentro del presupuesto T2.

**Fechas de publicación aún pendientes:** apertura de PM7, entrega objetivo y cierre/cutoff. Los talleres no son plazos de entrega. El docente mostrará las fechas confirmadas aquí, en [Empieza aquí](../AULES/01_EMPIEZA_AQUI_PM7.html), en la sección y en la tarea antes de abrir AULES.

Abre primero [Empieza aquí](../AULES/01_EMPIEZA_AQUI_PM7.html). En sus **primeros 20 minutos** copiarás el starter, abrirás la carpeta con `pubspec.yaml`, ejecutarás el baseline, verás cuatro entradas y guardarás el resultado real en D05. Mantén **un solo [dossier D01–D08](01_DOSSIER_SDD_PM7.md)**; son apartados de una entrega, no ocho tareas. Si todavía no hay repositorio autorizado, D07 puede ser un borrador marcado `PENDIENTE_PUBLICACION_PR`.

| Bloque | Paso humano y salida | Min | Modalidad | Ventana |
|---|---|---:|---|---|
| A01 | Arranca el starter, guarda versión, humo y límite en D05. | 20 | AUTONOMA | Inicio |
| A02 | Comprende SDD; redacta spec provisional y preguntas D01/D02. | 45 | AUTONOMA | Antes de T1 |
| A03 | Consulta tarjeta tras tus preguntas; cierra decisiones, plan y tareas D01–D04. | 40 | AUTONOMA | Antes de T1 |
| T1 | Contrasta contrato y haz primer incremento, en taller o desde casa. | 45 | COLECTIVA | 2027-01-26 |
| A04 | Implementa UI y pruebas por incrementos; conserva resultados D04/D05. | 60 | AUTONOMA | Después de T1 |
| A05 | Revisa diff y prepara PR/borrador D06/D07. | 45 | AUTONOMA | Antes de T2 |
| T2 | Predice, cambia sin agente y explica I3, en taller o cita equivalente. | 45 | COLECTIVA | 2027-02-02 |
| A06 | Comprueba dossier único y feedback; separa ejecutado/propuesto/pendiente. | 40 | AUTONOMA | Después de T2 |
| A07 | Corrige, repite verificación del corte final y entrega handoff. | 20 | AUTONOMA | Cierre |

## Sigue cada paso sin depender de una explicación oral

1. **A01 · Arranca.** Lee [Entorno](02_ENTORNO_Y_FUENTES_PM7.md) y el [README del starter](../Practica/Starter/spec_search/README.md). Abre `Practica/Starter/spec_search/` en VS Code o Android Studio; terminal en la carpeta de `pubspec.yaml`. Ejecuta `flutter --version`, `flutter pub get`, `flutter analyze --fatal-infos`, `flutter test`. **Comprueba:** versión 3.47.2/3.13.2, cuatro entradas DEMO y humo verde que no prueba la feature. **Conserva:** D05 con comandos y corte inicial. **Si falla:** [Ayuda](../Unidad/11_AYUDA_PM7.md), primer error y reintento.

2. **A02 · Pregunta antes de decidir.** Lee [Teoría §§1–3](../Unidad/02_CONTENIDOS_PM7.md) y el [ejemplo 1](../Unidad/03_EJEMPLOS_GUIADOS_PM7.md). Lee solo la **petición inicial** de la [tarjeta](../Unidad/05_SPEC_Y_DECISIONES_PM7.md); escribe en D01/D02 al menos dos preguntas que cambien comportamiento y un ejemplo que distinga respuestas. **Comprueba:** puedes explicar por qué «buscador útil» no basta. **Conserva:** spec provisional y preguntas. **Si falla:** convierte una palabra vaga en entrada/resultado concreto, sin mirar aún las respuestas de la tarjeta.

3. **A03 · Cierra el contrato del caso.** Ahora sí consulta las decisiones C1–C6 y criterios S1–S7 de la tarjeta. Lee [Teoría §§4–5](../Unidad/02_CONTENIDOS_PM7.md) y realiza E4–E5 del [entrenamiento](../Unidad/04_ENTRENAMIENTO_PM7.md). Escribe D02 con fuente «tarjeta docente», D03 plan y D04 tareas con archivos y pruebas. **Comprueba:** S3 espera solo DEMO-A para cámara + pendientes; `ñ` sigue distinta de `n`. **Conserva:** D01–D04 revisados. **Si falla:** deja la contradicción abierta y pide aclaración; no implementes una regla inventada.

4. **T1 · Primer incremento, 45 min.** Sigue [T1: taller o misión desde casa](../Unidad/10_TALLERES_Y_EQUIVALENCIAS_PM7.md) y el [ejemplo reproducible](../Unidad/03_EJEMPLOS_GUIADOS_PM7.md). Escribe primero una prueba discriminante para S3, observa su fallo esperado con un stub, implementa la política por tarea y repite. **Comprueba:** AND devuelve solo DEMO-A y el diff no añade dependencias. **Conserva:** corte, comando, antes/después y D04/D05. **Si falla:** separa error de compilación de aserción roja; [Ayuda](../Unidad/11_AYUDA_PM7.md).

5. **A04 · Completa sin perder el alcance.** Sigue [Laboratorio](../Unidad/06_LABORATORIO_PM7.md), [Teoría §§6–7](../Unidad/02_CONTENIDOS_PM7.md) y E6–E7. En `lib/catalog.dart` verifica S1–S5; en `lib/main.dart` conecta UI S6–S7; añade pruebas en `test/`. Ejecuta formato, análisis y tests tras cada incremento. **Comprueba:** búsqueda/estado AND, vacío, contador y limpiar conservando estado. **Conserva:** D04/D05 y evidencia real del corte. **Si falla:** reduce el diff, reproduce un solo criterio y usa la tabla de ayuda.

6. **A05 · Revisa antes de pedir revisión.** Lee [Teoría §§8–9](../Unidad/02_CONTENIDOS_PM7.md) y ejemplos 3–5. En tu repositorio de práctica autorizado ejecuta `git diff --stat` y `git diff` respecto a tu baseline; lee cada cambio y compara con S1–S7. Prepara D06/D07 con comando y corte exactos. **Comprueba:** un hallazgo real o una comprobación concreta sin hallazgo, nunca un bug inventado. **Conserva:** diff y borrador/enlace real de PR. **Si falla:** consulta [Ayuda](../Unidad/11_AYUDA_PM7.md); si no hay acceso Git, marca `PENDIENTE_PUBLICACION_PR`.

7. **T2 · Demuestra comprensión individual, 45 min.** Sigue [T2 y equivalencia](../Unidad/10_TALLERES_Y_EQUIVALENCIAS_PM7.md). Prepara tu corte desde casa o en taller; el docente comunica una variante nueva **al inicio de la supervisión**. Predice, modifica sin agente, muestra diff, ejecuta comprobación y explica qué cambia en D01/D02/D08. **Comprueba:** observación individual real o `PENDIENTE_SUPERVISION` con cita solicitada. **Conserva:** D08 y salida saneada. **Si falla:** conserva el primer error y reprograma la supervisión; una tarea doméstica sola no la sustituye.

8. **A06 · Cierra el dossier.** Lee [Evaluación](../Unidad/07_EVALUACION_PM7.md), completa la [autoevaluación](../Unidad/12_AUTOEVALUACION_PM7.md) y revisa D01–D08 en un único archivo. Marca cada afirmación EJECUTADO, PROPUESTO o PENDIENTE. **Comprueba:** dos cadenas Sx→decisión→tarea→diff→prueba→resultado→revisión y coherencia con el código entregado. **Conserva:** dossier y feedback auténtico o pendiente. **Si falla:** vuelve al primer eslabón sin fuente; pide feedback focal.

9. **A07 · Entrega un corte reproducible.** Corrige un hallazgo justificado, repite `dart format --output=none --set-exit-if-changed lib test`, `flutter analyze --fatal-infos` y `flutter test` en el corte final. **Comprueba:** resultados vinculados a ese corte; no atribuyas un run anterior al nuevo SHA. **Conserva:** código, tests, dossier y breve handoff con límites. **Si falla:** deja el estado real, causa y siguiente acción; la fecha de entrega la confirmará el docente.

**Recuperación y ampliación.** La recuperación Préstamo DEMO solo aparece en el carril restringido cuando se asigne; no forma parte de los 360 min ordinarios. La [ampliación](../Unidad/09_AMPLIACION_PM7.md) es voluntaria. PM6 conserva la enseñanza de tests/CI; PM7 documenta su uso. PI4 conserva el gobierno del proyecto.
