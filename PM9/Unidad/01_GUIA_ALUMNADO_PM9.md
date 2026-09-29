# Guía paso a paso · PM9 · Balizas del muelle

Vas a construir y explicar tu propio juego 3D para móvil en **720 min = 540 de A01–A11 + 45 de M4 + 135 de T1–T3**. En el Starter puedes iniciar y mover al personaje, pero solo existe CellA y faltan CellB/CellC, reglas completas y audio de varios eventos. No copies la solución. Empieza en la [Ruta y primeros 20 minutos](../Alumnado/00_RUTA_PM9.md); usa [Godot 4.7.2 Standard/GDScript/Compatibility](../Alumnado/02_ENTORNO_ANDROID_Y_QA_PM9.md). Guarda un único [dossier G01–G08](../Alumnado/01_DOSSIER_G01_G08_PM9.md) con tus versiones y observaciones.

**Fechas:** apertura, entrega objetivo y cierre/cutoff PENDIENTE_CONFIRMACION_DOCENTE en la portada, Ruta y sección/tarea AULES antes de publicar. Los martes 16/02, 23/02 y 02/03/2027 son talleres opcionales, no entregas. En cada T eliges presencial o misión desde casa de 45 min. M4 es autónoma. Si cursas todo desde casa, los 720 min son autónomos. Los cortes parciales son feedback; la entrega calificada es una sola.

## A01 · 35 min · Arranque y diagnóstico

**Propósito:** abrir una fuente completa y distinguir lo visto de lo que falta. **Recurso:** [Ruta §primer paso](../Alumnado/00_RUTA_PM9.md), [entorno](../Alumnado/02_ENTORNO_ANDROID_Y_QA_PM9.md), ZIP «Balizas del muelle · Starter completo» de AULES. **Haz:** descomprime, conserva copia intacta, importa project.godot, comprueba 4.7.2/Compatibility, pulsa F5, Iniciar y mueve con teclado. Los primeros 20 min deben alcanzar una primera observación o un bloqueo preciso. **Resultado/evidencia:** G01/G02 indica versión, escena, CellA, control, contador y modo OBSERVADO_EDITOR o PENDIENTE_ENTORNO. **Rescate:** si faltan carpetas descarga otra vez; si falla importación guarda error y solicita equipo/cita. Los 10 min adicionales respecto del histórico financian importación y diagnóstico.

## A02 · 45 min · Diseño y mapa de responsabilidades

**Propósito:** saber dónde va cada cambio antes de tocar código. **Recurso:** [teoría §§1–4](02_CONTENIDOS_PM9.md) y [contrato jugable](05_DISENO_DE_JUEGO_PM9.md). **Haz:** dibuja o escribe READY→PLAY→PAUSED/WON/LOST con equivalente textual; localiza rules.gd, main.gd, player.gd y pickup.tscn y asigna responsabilidades. Predice entrega prematura y recogida duplicada. **Resultado/evidencia:** G01 con estados, condiciones y mapa fuente→función, corte DOCUMENTADO. **Rescate:** si confundes HUD con regla, pregunta qué archivo decide el resultado y cuál solo lo muestra.

## A03 · 50 min · Casos antes de completar

**Propósito:** tener pruebas que distingan éxito de un simple arranque. **Recurso:** [ejemplos §§1–2](03_EJEMPLOS_GUIADOS_PM9.md), [entrenamiento](04_ENTRENAMIENTO_PM9.md) E1–E3 y [dossier](../Alumnado/01_DOSSIER_G01_G08_PM9.md). **Haz:** ejecuta el smoke público y anota que solo verifica baseline; escribe en G01 entradas/esperados para tres IDs, muelle prematuro, tiempo, vidas y reinicio. **Resultado/evidencia:** G01 con predicciones y modo EJECUTADO_HEADLESS solo donde ejecutaste el smoke. **Rescate:** si falla el script, revisa ruta/versión y conserva log; puedes continuar diseño sin declarar pruebas pasadas.

## T1 · 45 min · Primera instancia

**Propósito:** convertir una escena reutilizable en objeto con identidad propia. **Recurso:** [misión T1](../Alumnado/03_MISION_T1_PM9.md). **Haz:** una de las vías, presencial 16/02 o casa, con los mismos cinco tramos. **Resultado/evidencia:** CellB, pickup_id CELL-B, posición y G02; verla no demuestra reglas completas. **Rescate:** revisar Pickups, ID y escena; solicitar cita sustitutiva si editor bloqueado.

## A04 · 85 min · Instancias y reglas

**Propósito:** completar el bucle sin perder invariantes. **Recurso:** [laboratorio §desarrollo](06_LABORATORIO_PM9.md), [teoría §§2–4](02_CONTENIDOS_PM9.md), [contrato](05_DISENO_DE_JUEGO_PM9.md). **Haz:** crea CellC con CELL-C y posición (4,0.9,3); completa en rules.gd recogida única, daño con inmunidad, entrega con tres IDs, pausa, tiempo y reinicio. Integra señales en main.gd y comprueba un caso por cambio. **Resultado/evidencia:** G02/G03 con diff propio, tres identidades y caso discriminante. **Rescate:** si un ID no cuenta, inspecciona instancia y señal antes de retirar guardas. Los 10 min adicionales financian CellC y pruebas de reglas.

## A05 · 55 min · Material, física e input

**Propósito:** comprender apariencia, colisión y controles como responsabilidades distintas. **Recurso:** [teoría §§5–7](02_CONTENIDOS_PM9.md), [laboratorio](06_LABORATORIO_PM9.md), [entrenamiento E4–E8](04_ENTRENAMIENTO_PM9.md). **Haz:** crea/configura material propio de baliza y peligro, verifica usuarios y lectura por forma/texto; comprueba CharacterBody3D, capas/máscaras, velocidad, gravedad y actions. Prueba pared y teclado. **Resultado/evidencia:** G02/G04 con propiedades, recorrido, corte y modo. **Rescate:** si atraviesa pared revisa cuerpos/capas, no el color del material.

## T2 · 45 min · Contraste de juego

**Propósito:** unir regla y escena sin atribuir la simulación a un móvil. **Recurso:** [misión T2](../Alumnado/04_MISION_T2_PM9.md). **Haz:** presencial 23/02 o casa, una sola vía; predice, ejecuta, corrige y repite recogida/daño/pausa/reinicio. **Resultado/evidencia:** G03/G04 con esperado, observado y regresión. **Rescate:** reduce el caso a un evento y guarda el log.

## A06 · 55 min · Presentación con significado

**Propósito:** informar de los eventos aunque haya silencio o dificultad para distinguir color. **Recurso:** [teoría §§8–9](02_CONTENIDOS_PM9.md), [ejemplo audio §4](03_EJEMPLOS_GUIADOS_PM9.md). **Haz:** completa tonos collect/hit/win/lose una vez por evento y silencio; ajusta cámara, luz y HUD; prueba tamaño de ventana. **Resultado/evidencia:** G05 separa código/recurso, OBSERVADO_EDITOR y audio escuchado o PENDIENTE_AUDIO_REAL. **Rescate:** si headless pasa, aún debes observar/escuchar; si no hay altavoces solicita oportunidad y conserva pendiente.

## A07 · 50 min · Regresión funcional

**Propósito:** detectar cambios que rompen el recorrido. **Recurso:** [teoría §10](02_CONTENIDOS_PM9.md), [entrenamiento E10](04_ENTRENAMIENTO_PM9.md). **Haz:** prueba ID duplicado, entrega prematura, daño/inmunidad, tiempo, pausa y reinicio; añade un caso motor y reproduce un fallo real si existe. **Resultado/evidencia:** G07 con entrada, esperado, observado, corte, corrección o «sin hallazgo» y límite. **Rescate:** si un test falla, conserva la aserción y aísla regla, señal o escena.

## T3 · 45 min · Preparación Android

**Propósito:** llegar a exportación con diagnóstico honesto. **Recurso:** [misión T3](../Alumnado/05_MISION_T3_PM9.md) y [entorno](../Alumnado/02_ENTORNO_ANDROID_Y_QA_PM9.md). **Haz:** presencial 02/03 o casa; revisa templates/JDK/SDK/preset y prueba exportación debug o registra bloqueo. **Resultado/evidencia:** G06 con versión/corte, log o incidencia y solicitud de dispositivo si procede. **Rescate:** continúa A08 en entorno facilitado; un APK no acredita implantación.

## A08 · 55 min · Exportación y acceso real

**Propósito:** separar paquete de juego instalado. **Recurso:** [guía Android §exportación/implantación](../Alumnado/02_ENTORNO_ANDROID_Y_QA_PM9.md) y [G06](../Alumnado/01_DOSSIER_G01_G08_PM9.md). **Haz:** exporta APK debug fuera de las fuentes; registra log/hash. Con dispositivo autorizado instala y recorre controles táctiles, pausa, sonido y final; si no hay acceso, solicita turno. **Resultado/evidencia:** BUILD_APK y, solo tras recorrido observado, OBSERVADO_DISPOSITIVO_REAL; si falta, PENDIENTE_DISPOSITIVO_REAL. **Rescate:** revisa SDK/JDK/templates/firma y acuerda equipo; los 10 min extra financian diagnóstico/exportación, sin convertir espera en deber oculto.

## A09 · 60 min · Medir una variable

**Propósito:** hablar de optimización con datos y límites. **Recurso:** [teoría §11](02_CONTENIDOS_PM9.md), [ejemplo §6](03_EJEMPLOS_GUIADOS_PM9.md), [guía de profiling](../Alumnado/02_ENTORNO_ANDROID_Y_QA_PM9.md). **Haz:** mismo equipo/renderer/recorrido; observa profiler o monitor, cambia solo sombras u otra variable, repite y compara con legibilidad/regresión. **Resultado/evidencia:** G07 con base, cambio, valores realmente observados o PENDIENTE_PROFILING, incertidumbre y conclusión. **Rescate:** si no hay profiler, conserva hipótesis y cita para medir; nunca inventes FPS. Los 10 min extra financian repeticiones y comparación.

## M4 · 45 min · Modificación individual

**Propósito:** demostrar comprensión transferible. **Recurso:** [misión autónoma M4](../Alumnado/06_MISION_AUTONOMA_M4_PM9.md). **Haz:** recorrido final, predicción de consigna nueva, cambio focal sin ayuda generativa, prueba y explicación observada en cita sustitutiva. **Resultado/evidencia:** G08 con diff, corte y observación docente o PENDIENTE_SUPERVISION. **Rescate:** prepara desde casa; reprograma el tramo observado dentro del presupuesto. Una captura no acredita I3.

## A10 · 30 min · Corrección focal

**Propósito:** cerrar un fallo sin rehacer todo el proyecto. **Recurso:** [laboratorio §cierre](06_LABORATORIO_PM9.md) y [rúbrica por CE](07_EVALUACION_PM9.md). **Haz:** lee feedback, corrige un caso, repite regresión y actualiza la evidencia del CE afectado. **Resultado/evidencia:** proyecto y dossier consistentes en nuevo corte. **Rescate:** si persiste, documenta bloqueo y pide devolución concreta, sin fabricar aprobado.

## A11 · 20 min · Entrega única

**Propósito:** permitir una revisión auténtica y reproducible. **Recurso:** [plantilla G01–G08](../Alumnado/01_DOSSIER_G01_G08_PM9.md) y tarea AULES «PM9 · Juego y dossier final». **Haz:** revisa G01–G08, enlaces/licencias, corte final, pendientes y acceso al proyecto; entrega una vez por el canal indicado y conserva justificante. **Resultado/evidencia:** una tarea calificada con fuente propia y un dossier, feedback por CE. **Rescate:** si no puedes subir un archivo, informa antes del cutoff confirmado y conserva el error; no uses un ZIP de solución.

La evaluación mantiene RA5 con 20 % global, todos los RA ≥5 y la prueba práctica presencial global ≥5 separada del I3 local. No se inventan porcentajes para APK, juego, tests, capturas o dossier. Clasificador orbital es un carril restringido, solo por asignación; su enlace aparece únicamente al alumnado asignado.
