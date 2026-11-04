# Del encargo al cambio: diálogo, especificación e incrementos

**Itinerario voluntario, sin nota, plazo ni entrega; no forma parte de las 6 horas de PM7.** Trabaja en una copia distinta si quieres realizar sus cambios. Las decisiones de este libro no modifican la tarjeta oficial de Consulta DEMO. Utilizamos un caso de agenda de estudio para aprender a decidir cuánto aclarar, cuánto documentar y cómo comprobar un incremento sin convertir la conversación en burocracia.

## 1. Explorar una necesidad antes de convertirla en una orden de implementación

«Quiero organizar mejor mis avisos» contiene un problema, pero todavía no especifica una solución. Podría significar ocultar leídos, ordenar por prioridad, buscar por texto o recibir notificaciones. Pedir al agente que implemente cualquiera de esas opciones sin contrastar necesidad puede producir una aplicación vistosa que resuelve otra cosa. La primera conversación debe permitir distinguir posibilidades, no cerrar prematuramente un diseño.

Separa dos momentos. En **exploración** puedes pedir alternativas, preguntas y ejemplos de uso. En **ejecución** acuerdas una decisión concreta, un alcance y una comprobación. La transición se produce cuando puedes escribir una entrada y predecir qué debería observar el usuario. No se produce porque el agente haya redactado un documento con muchos apartados. Puedes volver a explorar si aparece información nueva, identificando qué decisión se reabre.

Caso continuo: una persona estudia desde casa y tiene cuatro avisos sintéticos. Dos comparten el título «Preparar equipo», pero son registros distintos. Quiere ver lo importante que aún no ha leído. Pregunta si «importante» es una etiqueta, una prioridad mínima o un rango; si «aún no leído» se combina con esa prioridad; si desea preservar orden y si la selección se guarda al cerrar. Cada respuesta cambia código o expectativa. Preguntar qué color prefiere antes de resolver AND puede consumir tiempo sin aclarar el comportamiento principal.

Una petición de exploración útil sería: «Sin editar, enumera interpretaciones incompatibles de importante y muestra un resultado por IDs que las distinga». Una petición de ejecución útil sería: «Aplica la prioridad mínima inclusiva acordada y conserva el orden; solo política y pruebas; detente si necesitas cambiar el significado de leído». No hay una redacción mágica. Lo que importa es que tú puedas evaluar si la salida responde a la necesidad.

**Ensayo opcional.** Escribe tres posibles interpretaciones de «restablecer». Una solo borra texto; otra restablece prioridad; otra cambia también lectura. Para cada una describe qué control cambia y qué preferencia se conserva. Elige una con una razón de producto. Esa razón puede ser revisada, pero debe existir antes de declarar un comportamiento incorrecto.

Este enfoque recoge la utilidad del diálogo y del contexto presente en las fuentes aportadas, conservando una salida comprobable. Conversar mucho no demuestra comprensión; conversar poco tampoco demuestra eficiencia si luego hay que rehacer la función. Tu criterio es qué incertidumbre has resuelto y qué acción permite realizar.

## 2. Escribir una especificación pequeña que sobreviva a un cambio

Una especificación sirve para que dos personas sepan qué resultado aceptarían. Para el caso de agenda basta inicialmente con propósito, datos, entradas, reglas, ejemplos y límites. No necesita describir todavía cada clase o cada línea de código. Si mezclas comportamiento y una arquitectura imaginada, puedes acabar defendiendo ocho capas que nadie pidió para filtrar cuatro registros.

La regla mínima puede decir: «mostrar registros con prioridad al menos igual al mínimo y, si ocultar leídos está activo, excluir los leídos; conservar identidad y orden». De ella derivan ejemplos independientes: mínimo 3 y ocultar → T-A,T-D; mínimo 3 y mostrar leídos → T-A,T-C,T-D; mínimo 4 y mostrar leídos → T-C. La fuente permanece intacta. Escribir IDs evita que dos registros de igual título se confundan en la revisión.

Un criterio útil también define el borde y el error. El laboratorio admite prioridades de 1 a 5; cero provoca un error de entrada en la función. Eso no obliga a mostrar una excepción técnica al usuario de Flutter: la UI puede impedir elegir ese valor. Son responsabilidades distintas. La política protege su contrato y la presentación explica o evita entradas no válidas. Si amplías a un rango, debes decidir qué ocurre cuando el máximo es menor que el mínimo.

| Pregunta | Alternativas que cambian la solución | Ejemplo discriminante |
|---|---|---|
| ¿Mínimo inclusivo? | `>=` o `>` | Aviso con prioridad exactamente 3 |
| ¿Cómo se combina lectura? | AND u OR | Aviso de prioridad 1 no leído |
| ¿Qué identifica un aviso? | ID o título | T-A y T-D comparten título |
| ¿Qué restaura el botón? | Un control o toda la pantalla | Prioridad 3 con ocultar activado |
| ¿Dónde se guarda? | Solo memoria o persistencia | Cerrar y abrir la app |

**Ejercicio de revisión.** Compara «la lista no estará vacía» con «para mínimo 3 y ocultar, IDs T-A y T-D en ese orden». La primera afirmación puede ser verdadera con un OR defectuoso. La segunda permite refutar una implementación concreta. No se trata de escribir siempre listas de IDs en un producto real: aquí son un oráculo pequeño y observable.

Si cambia una decisión, conserva qué versión queda histórica y qué ejemplos se sustituyen. No alteres las expectativas para hacer pasar el resultado existente sin explicar que también cambió el requisito. Un cambio legítimo de producto y una corrección de bug pueden producir el mismo diff; su justificación es distinta. La documentación permite al revisor distinguirlos.

## 3. SDD proporcionado: documentar para decidir, no para llenar una plantilla

SDD puede aportar claridad cuando obliga a fijar comportamientos antes de delegar. Puede convertirse en fricción cuando se interpreta como producir una gran especificación cerrada y aplazar toda comprobación hasta el final. Las críticas de los vídeos a la rigidez o a delegar bloques enormes son una oportunidad para examinar prácticas concretas. Un título provocador no demuestra que todos los requisitos hayan dejado de servir.

En una funcionalidad pequeña puedes mantener un único documento vivo: regla vigente, preguntas resueltas, siguiente incremento y evidencias. Cuando tomas una decisión con alternativas relevantes, una nota breve de tipo ADR ayuda: contexto, decisión, alternativas y consecuencias. Para elegir AND en este caso puede bastar un párrafo y un ejemplo. Para una migración de datos o una integración de autenticación haría falta analizar compatibilidad, errores y recuperación con más detalle.

El ciclo práctico es necesidad → pregunta → decisión → incremento → observación → revisión. Una observación puede devolverte a la pregunta. Supón que, al probar la UI, alguien entiende que prioridad 3 significa «solo 3». Tal vez el algoritmo esté bien y el texto del control sea ambiguo. Cambiar el rótulo a «Prioridad 3 o más» puede resolver el problema sin sustituir `>=`. No todos los hallazgos requieren modificar la política.

**Compara dos planes.** El primero pide generar toda la app, tests, README y una memoria final con un solo encargo. El segundo pide un corte visible con prioridad mínima, una prueba que discrimine el límite y una revisión antes de añadir lectura. El segundo crea oportunidades más cercanas de detectar malentendidos. No es una ley de que cada tarea deba durar exactamente cierto número de minutos: el tamaño debe permitir comprender el diff y obtener feedback útil.

El exceso de documentación también puede ocultar incoherencias. Si un agente produce veinte páginas, localiza una decisión y sigue su cadena hasta la función y la aserción. Si no puedes hacerlo, la longitud no está proporcionando trazabilidad. Del mismo modo, una spec de tres líneas puede ser insuficiente si omite identidad, borde y estados vacíos. La cantidad apropiada depende de lo que hay que comunicar y del riesgo del cambio.

**Respuesta razonada al dilema «¿dejo de usar SDD?»** Conserva preguntas, criterios observables, decisiones versionadas e incrementos revisables. Reduce documentos redundantes y evita posponer todo feedback. En PM7 el criterio curricular sobre documentar procesos permanece; en esta ampliación puedes experimentar distintas formas de cumplir esa función sin convertir una metodología o una marca en un requisito nuevo de nota.

## 4. Diseñar un corte vertical y llevarlo de la regla a la pantalla

Un corte vertical entrega un comportamiento pequeño que atraviesa las responsabilidades necesarias. En agenda podría incluir elegir prioridad, calcular visibles, dibujar la lista y mostrar el contador. No exige completar primero una capa de datos general, luego una arquitectura completa y finalmente toda la UI. Permite observar pronto si el comportamiento se entiende y si el estado se conserva.

Mantén una sola fuente de verdad por dato. La lista DEMO es la fuente de registros; prioridad y ocultar leídos son estado de presentación; la lista visible se deriva de ambos. Guardar además una lista filtrada mutable introduce otra cosa que sincronizar. Si cambias un control y olvidas actualizar esa copia, la pantalla puede mostrar un resultado antiguo aunque la función pura sea correcta. La simplicidad consiste en reducir ese riesgo, no en eliminar toda separación.

Primer incremento opcional: prioridad mínima sin ocultar. Predice mínimo 4 → T-C. Verifica la política y conéctala a un control visible. Segundo: añade lectura con AND y prueba mínimo 3 ocultando → T-A,T-D. Tercero: restaura solo prioridad y comprueba que lectura se conserva según la regla elegida. La agenda de este laboratorio tiene cuatro datos; el Avisos DEMO de las seis horas tiene sus propios tres registros. No mezcles sus contadores ni presentes un resultado de Python como una captura de Flutter.

Para transferir a Flutter, abre la copia del ejemplo correcto y localiza `lib/notices.dart`, `lib/main.dart` y `test/notices_test.dart`. Antes de editar anota qué datos del nuevo experimento añades y qué expectativas cambian. No pegues los IDs T-A–T-D en una prueba del ejemplo antiguo esperando que ya existan. La equivalencia reside en la regla y el procedimiento; el montaje y los datos deben coincidir con cada proyecto.

Cuando un incremento necesite red o persistencia, su complejidad cambia: aparecen espera, errores, cancelación y respuestas antiguas. No simules que ya resolviste esos problemas con una función local. Utiliza las responsabilidades estudiadas en PM4/PM6 y diseña casos nuevos. Esta ampliación permite estudiar ese cambio de alcance, pero no lo añade a la entrega ordinaria de PM7.

**Criterio de parada.** Si no puedes explicar qué control produce qué entrada de la política, detén la ampliación y recorre un solo dato. Si la pantalla no se actualiza, distingue una regla incorrecta de un estado no reconstruido. Añadir otra librería de estado antes de localizar esa diferencia puede aumentar el problema.

## 5. Git como corte verificable, no como sustituto de la conversación

Antes de delegar conserva un punto de partida y comprueba `git status --short`. Un commit identifica archivos, no demuestra por sí solo que el trabajo sea correcto o propio. Su utilidad aquí es poder comparar qué se cambió y recuperar un corte conocido. La conversación explica decisiones; Git permite contrastar el resultado material. Si tu carpeta no tiene repositorio, puedes usar copias identificadas, sin inventar un SHA.

En un repositorio de práctica autorizado y sin cambios ajenos, crea una rama para tu experimento. Revisa primero archivos y después líneas. `git diff --stat` da una señal de tamaño; `git diff BASELINE` compara lo que hay respecto al corte que guardaste. Sustituye BASELINE por un SHA real. Un fichero nuevo no aparece en el diff ordinario hasta que lo añades al índice; `git status --short` evita olvidar ese test nuevo. Un diff vacío sin revisar la base no prueba que no haya cambios.

Si quieres comparar dos implementaciones, Git permite árboles de trabajo separados:

```sh
git worktree list
git worktree add -b ensayo-rango ../ensayo-rango BASELINE
```

Ejecuta el segundo comando solo tras sustituir BASELINE, comprobar que la rama y la carpeta de destino no existen y entender qué repositorio utilizas. Crea otra carpeta de trabajo; no crea otra cuenta ni publica. Las dependencias y la versión de Flutter deben prepararse también allí. No confundas una rama de conversación en Pi con esta separación de archivos. Si dos agentes comparten la misma carpeta, sus cambios pueden colisionar aunque tengan conversaciones distintas.

Una PR revisable explica necesidad, comportamiento, cambio, verificación y límites. «Refactorización completa por IA» no permite localizar el propósito. «La prioridad mínima ahora incluye el límite; antes T-A/T-D quedaban fuera; el contrato los espera y pasa en este corte» conecta el problema con una observación. Si no tienes acceso remoto autorizado, prepara un borrador local: el aprendizaje no depende de fingir un enlace publicado.

**Revisión de alcance.** Para corregir un operador no debería aparecer una credencial, una nueva librería ni la eliminación del test. Puede haber una razón legítima para cambiar más de un archivo; debe hacerse explícita. Lee también las aserciones y el README, porque un agente puede haber conseguido verde ajustando ambos al mismo error.

Referencia de comandos y revisión: [documentación de Git](https://git-scm.com/docs/git-worktree) y [pull requests de GitHub](https://docs.github.com/en/pull-requests). Su uso en este libro es un experimento personal y no una autorización para modificar o fusionar el repositorio del curso.

## 6. Rescatar un incremento y dejar una continuidad que otra persona pueda utilizar

No todos los intentos terminan en verde al primer paso. El aprendizaje profesional incluye reconocer cuándo se repite una acción sin obtener información nueva. Si el agente cambia tres archivos para resolver un import y falla otra vez, reduce el caso: comando exacto, primer error, versión y archivo. Diferencia el fallo original de los errores introducidos durante el rescate. Una segunda propuesta más grande no es automáticamente mejor.

Utiliza una hipótesis comprobable. «Quizá el cliente usa la API del SDK anterior» se contrasta leyendo la versión instalada y el import oficial. «El modelo no entiende nada» no sugiere una prueba concreta. En este material MCP se fija 2.3.0 y utiliza `MCPServer`; un tutorial que importe `FastMCP` corresponde a otra línea del SDK. Antes de copiar, identifica si estás siguiendo documentación v1 o v2. La herramienta de ayuda y la versión son parte del diagnóstico.

Si debes detenerte, deja el estado real: qué funciona, qué falla, qué archivos cambiaste, qué comprobación ejecutaste y cuál sería el siguiente experimento. No describas un comando recomendado como ejecutado. No borres un fallo útil del registro para aparentar un proceso perfecto. Tampoco conviertas el registro en una transcripción interminable: selecciona la información que permite continuar.

**Práctica de handoff.** Guarda un corte del laboratorio con la variante `limite`. Entrega a una persona autorizada cuatro líneas con la regla vigente y el fallo, sin darle la corrección. Pídele localizar la función, predecir qué IDs faltan y explicar qué cambiaría. Luego contrasta su diagnóstico con `python comprobar.py --variante limite`. El fallo esperado debe ser de aserción; un error por no encontrar el archivo no demuestra haber reproducido el defecto.

Cuando retomes la conversación, comprueba los archivos antes de aceptar su resumen. Si el código ya está corregido, una revisión honesta puede concluir que no hace falta editar. La actividad no exige producir un bug ni un diff para justificar el uso de una herramienta. Saber conservar una solución suficiente es una decisión válida.

**Transferencia final voluntaria.** Propón un rango de prioridades en una copia: aclara si ambos límites son inclusivos, qué ocurre con un rango invertido y qué control se restablece. Escribe tres expectativas, implementa un corte pequeño y revisa su diff. No alteres la tarjeta oficial ni añadas esta funcionalidad a la entrega ordinaria por haber leído el libro. El resultado que buscas es dominar el procedimiento para un requisito nuevo, con o sin agente.
