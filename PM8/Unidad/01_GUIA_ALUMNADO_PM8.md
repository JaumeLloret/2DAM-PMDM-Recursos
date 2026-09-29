# PM8 · Guía de trabajo autónomo

Lee primero [la Ruta](../Alumnado/00_RUTA_PM8.md): allí están el arranque de 20 minutos, presupuesto 315 + 45 y calendario. Apertura, entrega objetivo y cierre/cutoff: `PENDIENTE_CONFIRMACION_DOCENTE` cada una. La sesión T1 es el 09/02/2027; esa fecha **no** es un plazo. Todo el material de estudio está disponible desde casa. Conserva un único [dossier L01–L06](../Alumnado/01_DOSSIER_MOTOR_LAB_PM8.md); los checkpoints intermedios solo sirven para recibir feedback.

El motor ya está elegido para este curso: Godot 4.7.2 Standard con GDScript y Compatibility. Tú explicarás por qué sirve para este alcance y qué límites quedan. En PM8 analizas Motor Lab; PM9 desarrolla el juego. Antes de tocar un valor, predice, cambia una variable en una copia, comprueba y restaura. Marca cada afirmación como documentada, calculada, observada en editor o pendiente según corresponda.

## A01 · 40 min · Abre el laboratorio

**Propósito y explicación.** Distingue editor (herramientas) de ejecución del proyecto (ventana de juego). `project.godot` configura la escena principal y renderer; `lab3d.tscn` es una escena, no todo el proyecto.

**Recurso y acción.** Sigue exactamente [los cuatro pasos iniciales de la Ruta](../Alumnado/00_RUTA_PM8.md#los-primeros-20-minutos), [entorno por sistema](../Alumnado/02_ENTORNO_FUENTES_Y_ANDROID_PM8.md) y `Practica/Starter/motor_lab/` completo. En los 20 min restantes recorre Escena, Inspector, Sistema de archivos y Salida/Depurador; pulsa giro y detén. **Resultado:** proyecto importado, 3D visible y texto de coordenadas o un fallo reproducible. **Evidencia:** L02 con versión, acción, resultado y modo. **Rescate:** descarga completa, verifica pin/Compatibility y solicita equipo/cita con error exacto; deja `PENDIENTE_ENTORNO` sin inventar imagen.

## A02 · 55 min · Entiende las piezas

**Propósito y explicación.** Una malla dibuja, una forma colisiona y un área detecta; una escena organiza nodos y un recurso aporta datos compartidos. 2D y 3D tienen tipos y espacios diferentes.

**Recurso y acción.** Lee [teoría §§1–6](02_CONTENIDOS_PM8.md) y resuelve E1–E7 del [entrenamiento](04_ENTRENAMIENTO_PM8.md) mirando `scenes/lab3d.tscn` y `lab2d.tscn`. Completa L01 con un ejemplo de cada subsistema, tipo y responsabilidad; dibuja la primera relación padre/hijo de L05. **Resultado:** puedes explicar por qué `Platform/Mesh` no sostiene por sí sola `SampleBody` y por qué `Sensor` no es suelo. **Evidencia:** L01 y borrador L05. **Rescate:** vuelve al nodo concreto y busca `Shape`, `collision_layer`, `collision_mask`; si no abre el editor, marca lectura `DOCUMENTADO`, no observación.

## A03 · 60 min · Analiza escenas y juego existente

**Propósito y explicación.** Jerarquía y scripts colaboran: la señal `pressed` llega a un método y `_process(delta)` actualiza el estado. Una captura del árbol no explica la regla.

**Recurso y acción.** En `scenes/lab3d.tscn`, localiza `Pivot/Probe`, `ProbeCopy`, `Sensor`, `Camera`; cambia con el botón a `lab2d.tscn` y vuelve. Abre «Analizar minijuego existente»: Iniciar → botones A, B, A; reinicia y prueba B primero; reinicia y espera diez segundos. Lee `scripts/signal_game.gd` y [ejemplo §4](03_EJEMPLOS_GUIADOS_PM8.md). **Resultado:** separas visual, cámara, física, detección y estado READY/PLAY/WON/LOST. **Evidencia:** L04 con tabla evento→método→estado y L05 con árbol y recurso. **Rescate:** si una tecla no funciona, usa botones visibles y foco; si no hay ventana, explica código como `DOCUMENTADO` y pide acceso docente, sin atribuir sonido escuchado.

## A04 · 45 min · Selecciona con pruebas proporcionadas

**Propósito y explicación.** Fuente oficial y observación local contestan preguntas diferentes. Android necesita preparación técnica aunque este laboratorio abra en escritorio.

**Recurso y acción.** Lee [entorno, licencia y Android](../Alumnado/02_ENTORNO_FUENTES_Y_ANDROID_PM8.md), [teoría §§9–10](02_CONTENIDOS_PM8.md) y [ejemplo §5](03_EJEMPLOS_GUIADOS_PM8.md). Compara Godot con Unity 6.3 LTS solo desde documentos oficiales; anota fecha de consulta, fuente, estado, implicación y límite en L03. **Resultado:** decisión razonada para PM9, sin FPS inventados ni exportación simulada. **Evidencia:** L03. **Rescate:** si falta una fuente, deja `PENDIENTE_ENTORNO` o «dato sin verificar» y no conviertas publicidad en prueba.

## A05 · 45 min · Dos experimentos reversibles

**Propósito y explicación.** El local de Probe no cambia cuando gira Pivot; dos nodos pueden compartir `materials/copper.tres` aunque no sean hermanos.

**Recurso y acción.** Sigue [ejemplos §§1–3](03_EJEMPLOS_GUIADOS_PM8.md) en una copia: con giro automático detenido, predice global de Probe tras +90° Y de Pivot; cambia **solo** esa rotación en Inspector, comprueba y restaura. En otro corte, predice qué usuarios compartirán roughness 0.8, cambia **solo** esa propiedad, compara y restaura 0.2. Calcula también 2D: (600,200)+(80,0)=(680,200). **Resultado:** separas `contiene` de `usa`, y cálculo de observación. **Evidencia:** dos filas L06 y tabla L05. **Rescate:** si editaste radianes como grados en `.tscn` o cambiaste dos valores, vuelve al baseline y repite un solo cambio; si no ves brillo, registra limitación, no una observación inventada.

## T1 · 45 min · Contraste e I3

**Propósito y explicación.** Una predicción nueva y una modificación individual explicada demuestran que entiendes el árbol. **Recurso y acción:** elige presencial **o** la [misión completa desde casa](../Alumnado/03_MISION_T1_PM8.md), con iguales tiempos, tabla, rescates y evidencia. **Resultado:** contraste común y variante I3 individual; la supervisión puede concertarse y sustituye el tramo de T1, sin tarea añadida. **Evidencia:** L05/L06. **Rescate:** conserva `PENDIENTE_SUPERVISION` hasta observación auténtica; prepara predicción y diff y solicita cita.

## A06 · 40 min · Reúne el único dossier

**Propósito y explicación.** Una conclusión necesita origen y límites. **Recurso y acción:** completa [plantilla L01–L06](../Alumnado/01_DOSSIER_MOTOR_LAB_PM8.md) con [laboratorio](06_LABORATORIO_PM8.md); corrige un hallazgo después del feedback. **Resultado:** un documento reproducible con tablas legibles, estado por afirmación y restauración. **Evidencia:** L01–L06 integrados. **Rescate:** usa [ayuda por síntomas](../Alumnado/04_AYUDA_Y_AUTOCONTROL_PM8.md), identifica apartado incompleto y pide feedback sin abrir una segunda entrega.

## A07 · 30 min · Autocontrol y transferencia

**Propósito y explicación.** Entregar el análisis permite empezar PM9 con límites claros. **Recurso y acción:** usa [autocontrol](../Alumnado/04_AYUDA_Y_AUTOCONTROL_PM8.md) y [rúbrica](07_EVALUACION_PM8.md); revisa fuentes, evidencias e I3 y entrega **una vez** el dossier en la tarea AULES cuando se confirmen las fechas. **Resultado:** handoff breve con motor/versión/renderer, conceptos, requisitos Android y pendientes; sin juego nuevo. **Evidencia:** final L06 y dossier. **Rescate:** declara bloqueo o supervisión pendiente, solicita oportunidad docente; una captura aislada no acredita comprensión.
