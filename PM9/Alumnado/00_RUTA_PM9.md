# PM9 · Ruta de estudio · Balizas del muelle

Construirás un juego 3D pequeño para móvil: moverás al personaje, recogerás tres balizas distintas y volverás al muelle antes de 60 segundos, evitando peligros. Aprenderás a unir escenas, reglas, física, sonido, cámara, luz, pruebas y exportación Android. El resultado será **tu proyecto modificable y un único dossier G01–G08**. La recuperación Clasificador orbital solo se asigna si procede.

**Tiempo:** 12 h = 720 min por estudiante. Necesitas Godot **4.7.2 Standard**, GDScript y renderer Compatibility; un ordenador Windows, Linux o macOS; el ZIP «Balizas del muelle · Starter completo» de esta sección, espacio para conservar copias y el [dossier](01_DOSSIER_G01_G08_PM9.md). JDK 17, SDK Android y templates 4.7.2 se preparan antes de exportar, no para empezar. Si te falta ordenador o dispositivo, solicita acceso al docente y registra el estado pendiente; no inventes una observación.

**Fechas de AULES antes de publicar:** apertura PENDIENTE_CONFIRMACION_DOCENTE · entrega objetivo PENDIENTE_CONFIRMACION_DOCENTE · cierre/cutoff PENDIENTE_CONFIRMACION_DOCENTE. El docente debe configurar y repetir las tres fechas en esta Ruta, la portada y la sección/tarea calificada. Las fechas de los talleres **no son entregas**. La fecha de la prueba presencial global y el inicio de Formación en Empresa (FE) están pendientes de confirmación por separado.

## Tu primer paso: primeros 20 minutos de A01

1. Descarga en AULES **«Balizas del muelle · Starter completo.zip»**, que debe contener exactamente el contenido de Practica/Starter/beacon_dock, no la raíz docente. Descomprime y comprueba project.godot, scenes/, scripts/, materials/, ui/, assets/, README.md y LICENSES.md. Conserva una copia intacta y trabaja en otra. Si faltan carpetas, descarga de nuevo.
2. Abre Godot 4.7.2 Standard. En Gestor de proyectos → Importar, selecciona project.godot de tu **copia de trabajo**, espera la importación y comprueba Compatibility. Sigue la [guía de entorno](02_ENTORNO_ANDROID_Y_QA_PM9.md) si usas Windows, Linux o macOS.
3. Pulsa F5 para ejecutar la escena principal scenes/main.tscn. Pulsa «Iniciar» y mueve el personaje con WASD/flechas; observa una baliza CellA, el contador y el mensaje. Registra en G01/G02 qué viste, versión/corte y modo OBSERVADO_EDITOR. Si falla, guarda mensaje de Salida/Depurador y usa PENDIENTE_ENTORNO.
4. **No declares el juego terminado:** el Starter contiene CellA, pero faltan CellB/CellC, las reglas completas de recogida/daño/victoria y tonos de hit/win/lose. El smoke headless solo verifica una base; F5 y una captura tampoco prueban el juego final.

## Presupuesto vigente y secuencia

| Bloque | Min | Recurso exacto y acción principal | Resultado que conservas |
|---|---:|---|---|
| A01 | 35 | Esta Ruta §primer paso; [entorno](02_ENTORNO_ANDROID_Y_QA_PM9.md) | Importación, primera observación o bloqueo; corte G01/G02 |
| A02 | 45 | [Teoría](../Unidad/02_CONTENIDOS_PM9.md) §§1–4 y [contrato](../Unidad/05_DISENO_DE_JUEGO_PM9.md) | Mapa READY/PLAY/PAUSED/WON/LOST y responsabilidades |
| A03 | 50 | [Ejemplos](../Unidad/03_EJEMPLOS_GUIADOS_PM9.md) §§1–2, [dossier](01_DOSSIER_G01_G08_PM9.md) | G01 con casos y predicciones; baseline honesto |
| T1 | 45 | [Misión T1](03_MISION_T1_PM9.md): presencial **o** casa | CellB con identidad/escena y primer corte G02 |
| A04 | 85 | [Laboratorio](../Unidad/06_LABORATORIO_PM9.md) §desarrollo y [teoría](../Unidad/02_CONTENIDOS_PM9.md) §§2–4 | CellC, reglas y G02/G03 con pruebas propias |
| A05 | 55 | [Teoría](../Unidad/02_CONTENIDOS_PM9.md) §§5–7 y [entrenamiento](../Unidad/04_ENTRENAMIENTO_PM9.md) E4–E8 | Materiales, formas/capas, input y G04 |
| T2 | 45 | [Misión T2](04_MISION_T2_PM9.md): presencial **o** casa | Colisiones, daño/pausa/reinicio observados G03/G04 |
| A06 | 55 | [Teoría](../Unidad/02_CONTENIDOS_PM9.md) §§8–9 y [ejemplo audio](../Unidad/03_EJEMPLOS_GUIADOS_PM9.md) §4 | G05 audio, cámara/luz y HUD con límites |
| A07 | 50 | [Teoría](../Unidad/02_CONTENIDOS_PM9.md) §10 y [entrenamiento](../Unidad/04_ENTRENAMIENTO_PM9.md) E10 | Casos propios, regresión y corte G07 |
| T3 | 45 | [Misión T3](05_MISION_T3_PM9.md): presencial **o** casa | Diagnóstico Android y preparación G06 |
| A08 | 55 | [Entorno y Android](02_ENTORNO_ANDROID_Y_QA_PM9.md) §exportación/implantación | APK debug y/o incidencia; acceso real acordado; G06 |
| A09 | 60 | [Teoría](../Unidad/02_CONTENIDOS_PM9.md) §11 y [ejemplo](../Unidad/03_EJEMPLOS_GUIADOS_PM9.md) §6 | Medición comparable o pendiente, una variable y G07 |
| M4 | 45 | [Misión autónoma final](06_MISION_AUTONOMA_M4_PM9.md) | Recorrido, cambio individual I3 y G08; cita sustitutiva si procede |
| A10 | 30 | [Laboratorio](../Unidad/06_LABORATORIO_PM9.md) §cierre y [evaluación](../Unidad/07_EVALUACION_PM9.md) | Corrección focal, regresión y dossier revisado |
| A11 | 20 | [Dossier G01–G08](01_DOSSIER_G01_G08_PM9.md) y tarea única | Fuentes/corte final y un dossier entregados; feedback registrado |
| **Otros tramos autónomos A01–A11** | **540** |  |  |
| **M4 autónoma** | **45** |  |  |
| **T1+T2+T3, una vía por taller** | **135** |  |  |
| **Total** | **720** |  |  |

Los 40 minutos retirados del esquema histórico se incorporan a A01 (+10, importación/diagnóstico), A04 (+10, reglas y CellC), A08 (+10, preparación/exportación) y A09 (+10, medición/contraste). La instantánea histórica era **500 autónomos + cuatro talleres de 55 min = 720**, con PM9 desde 09/02; permanece solo como instantánea en tools/unit.json y auditorías. **09/02/2027 pertenece a PM8.**

T1 **martes 16/02/2027**, T2 **23/02/2027** y T3 **02/03/2027**, siempre 19:30–20:25: 45 min de misión y 10 min de margen. Cada enlace de misión ofrece dos vías **alternativas de 45 min** con el mismo resultado; haces una, nunca ambas ni minutos extra. Si haces el curso entero en casa: 540 + 45 + 135 = **720 min autónomos**. M4 siempre es autónoma; su verificación individual puede realizarse por cita que **sustituye** un tramo de M4. Hasta que el docente la observe, marca PENDIENTE_SUPERVISION. La prueba práctica presencial global PMDM es independiente de I3.

## Cortes, ayuda y entrega

Muestra G01/G02, G03/G04 y G05/G06/G07 para feedback en los puntos indicados; **no son tres tareas calificadas**. La única tarea calificada recibe el proyecto propio y **un solo dossier G01–G08**. Cada evidencia indica corte/versión, cómo se obtuvo y qué no demuestra. El docente confirmará apertura, entrega objetivo y cutoff antes de publicar; no deduzcas plazos de las fechas de taller.

Si F5 falla, conserva error/corte y sigue el [diagnóstico](02_ENTORNO_ANDROID_Y_QA_PM9.md). Si una baliza no cuenta, revisa pickup_id y la escena antes de quitar la guarda de duplicados. Si el SDK o templates faltan, avanza G01–G05/G07 y concierta acceso. Si no hay móvil real, conserva PENDIENTE_DISPOSITIVO_REAL y pide turno: un APK construido no acredita RA5.h. Usa la [guía paso a paso](../Unidad/01_GUIA_ALUMNADO_PM9.md) para rescatar cada bloque.
