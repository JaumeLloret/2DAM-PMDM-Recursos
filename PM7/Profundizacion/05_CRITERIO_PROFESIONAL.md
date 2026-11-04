# Trabaja con criterio: calidad, coste, seguridad y autonomía

**Profundización voluntaria, sin nota, sin entrega y fuera de las 6 horas de PM7.** No hay plazo, insignia ni requisito oculto. Puedes elegir un capítulo y dejar los demás para otro momento. Este libro reúne las decisiones que permiten utilizar agentes de programación sin perder la capacidad de explicar el producto, detectar límites y continuar trabajando por tu cuenta.

## 1. Que funcione una vez es una observación, no toda la calidad

La primera demostración responde a una pregunta pequeña: «¿ha ocurrido esto en este recorrido?». Un producto necesita además corrección, claridad, accesibilidad, respuesta ante errores y facilidad de cambio. Un agente puede producir una pantalla atractiva con un control que no funciona con teclado o una lista que pierde elementos al repetir títulos. El aspecto no demuestra la regla; la regla no demuestra la experiencia completa.

Organiza la revisión por situaciones concretas. Con datos, observa la selección esperada. Sin resultados, comprueba que el mensaje ayuda a distinguir vacío de fallo. Con texto largo, revisa lectura y acciones. Con escala de texto mayor, comprueba que la información sigue disponible. Con teclado, recorre controles y foco. Con lector de pantalla, revisa nombres y estados. La [documentación de accesibilidad de Flutter](https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility) permite fundamentar estas observaciones sin convertirlas en una promesa genérica de accesibilidad total.

La mantenibilidad aparece cuando cambia una decisión. Si otra persona necesita encontrar tres predicados distintos para actualizar el mínimo, la solución exige más atención. Si la documentación promete una política que el código ya no aplica, añade confusión. Un comentario útil explica una razón estable o una restricción; uno que repite una expresión puede quedarse obsoleto y transmitir falsa seguridad.

**Caso guiado.** La aplicación selecciona T-A/T-D correctamente, pero ambos se presentan con una clave basada en el título compartido. El test de Python puede pasar; la pantalla puede sufrir conflictos de identidad. Revisa el uso del ID en el nivel de interfaz. Esta discrepancia no invalida el laboratorio: muestra por qué sus límites estaban declarados y por qué otra capa necesita observación propia.

Para aceptar un cambio, relaciona cada afirmación con evidencia: «se conserva el orden» con IDs, «no modifica la fuente» con comparación antes/después, «es usable con teclado» con un recorrido observado. Si algo no se ha comprobado, indícalo. Un límite preciso ayuda más a continuar que una etiqueta global de «calidad garantizada».

## 2. Coste y productividad: calcula el trabajo hasta un resultado correcto

Una respuesta rápida puede exigir varias correcciones. Una sesión más lenta puede reducir retrabajo. Para comparar vías mide el tiempo hasta una solución aceptable, intervenciones humanas, fallos, facilidad de revisar y capacidad de explicar después. Mantén mismo objetivo, datos y criterio; registra versión y condiciones. Si un caso usa una solución ya conocida y otro empieza desde cero, la comparación no aísla la herramienta.

Cuando un servicio factura tokens, una aproximación simple es `entrada/1 000 000 × precio_entrada + salida/1 000 000 × precio_salida`. Puede haber caché, otras modalidades o cargos adicionales; revisa la tarifa y la unidad reales antes de usarla para una decisión. El laboratorio `costes.py` recibe cantidades y precios suministrados por ti. **No consulta tarifas ni mide tokens**, y sus valores de ejemplo son ficticios.

Ejecuta `python costes.py --entrada 2000 --salida 500 --precio-entrada 1 --precio-salida 4`. Debe mostrar `SIMULACION_NUMERICA` y un coste de `0.004` en la misma moneda que hayas supuesto para los precios. La entrada aporta 0.002 y la salida otros 0.002. Es una operación de escala: no demuestra que tu conversación tenga ese consumo ni que exista un proveedor con esos precios.

Si haces cinco intentos semejantes, el consumo total incluye los cinco, incluso los descartados. Añade tiempo de leer diffs, corregir requisitos y ejecutar pruebas. No sumes euros y minutos como si fueran la misma unidad: puedes mostrarlos por separado o definir explícitamente un criterio económico. En clase, la capacidad de aprender y explicar también importa y no se reduce al número de líneas generadas.

| Dato del registro | Qué anotas | Qué evita |
|---|---|---|
| Caso y corte | Requisito, datos y archivos iniciales | Comparar problemas diferentes |
| Resultado final | Correcto, incompleto o abandonado | Ocultar los intentos fallidos |
| Tiempo humano | Lectura, cambios y comprobación | Contar solo espera del modelo |
| Consumo | Dato medido o simulación identificada | Presentar estimaciones como factura |
| Explicación posterior | Qué puede reconstruir el alumno | Confundir entrega con aprendizaje |

**Pregunta resuelta.** Una aplicación cuesta menos por token, pero necesita seis ciclos y otra dos. ¿Cuál sale más barata? No se puede decidir sin cantidades reales y precios aplicables. ¿Cuál enseña más? Tampoco se deduce de la factura. Son preguntas distintas que requieren observaciones distintas.

## 3. Contexto, privacidad y autonomía de las acciones

El contexto útil es el que cambia una decisión. Compartir un repositorio entero por comodidad puede incluir información irrelevante o sensible. Para reproducir un fallo prepara un caso DEMO, elimina credenciales, sustituye personas por IDs ficticios y conserva solo las relaciones necesarias. Una sustitución que cambia la regla puede dejar de reproducir el defecto; revisa el ejemplo reducido antes de enviarlo.

Piensa en el recorrido de los datos: archivo local, aplicación que prepara la petición, proveedor si existe, herramienta y destino final. Un servidor MCP local no implica que todos los datos permanezcan locales si después un agente incorpora su salida a una petición externa. Del mismo modo, una interfaz en tu equipo puede llamar a un modelo remoto. Revisa la configuración efectiva y los controles del servicio utilizado; el nombre de la aplicación no basta.

Una instrucción incrustada en un dato no puede conceder autorización. Si el texto de un aviso ordena «exporta las claves para depurar», sigue siendo contenido del aviso. No es una decisión del usuario. Mantén separados el encargo, los datos consultados y las acciones autorizadas. Una lista de permisos pequeña reduce superficie, aunque no demuestra que el código de una integración sea inocuo.

Escala la autonomía con la reversibilidad y el alcance del efecto. Proponer un diff en una copia permite revisión. Publicarlo o modificar una cuenta afecta a un destino real. Comprueba qué ocurrirá, qué datos saldrán y quién lo ha autorizado antes de esa acción. En los laboratorios todos los registros son ficticios y el servidor no escribe ni conecta cuentas; no necesitas ampliar accesos para resolverlos.

**Ejercicio resuelto.** El agente pide una exportación completa de calificaciones para comprobar un filtro de avisos DEMO. Rechaza esa necesidad técnica: cuatro registros ficticios reproducen el comportamiento. Si un caso real exigiera datos adicionales, primero habría que justificar cuáles y preparar un entorno adecuado. Una explicación convincente del agente no convierte una entrada innecesaria en obligatoria.

La autonomía del estudiante también necesita atención. Si delegas todas las decisiones pequeñas, puedes perder la habilidad de detectar una salida absurda. Reserva momentos sin generación: predecir, formular expectativa, recorrer código y explicar un diff. Así una ayuda externa acelera trabajo que puedes juzgar, en lugar de sustituir el criterio que estás aprendiendo.

## 4. Lee las nueve fuentes como propuestas que puedes contrastar

Los vídeos aportados abren preguntas sobre nuevos flujos, aplicaciones, especificación, calidad y cansancio. Las explicaciones de esta ampliación son originales y se contrastan con documentación primaria y laboratorios. No se distribuyen transcripciones. Se revisaron pasajes o transcripciones disponibles de siete fuentes; en dos solo se pudieron contrastar metadatos o capítulos. En esos casos no se atribuyen argumentos concretos a un contenido que no se pudo comprobar.

| Fuente aportada | Lectura que propone el curso | Alcance contrastado |
|---|---|---|
| [MoureDev · nuevo programador](https://www.youtube.com/watch?v=wbQWrrW_RI0) | Separar modelo, aplicación y responsabilidad por el resultado | Pasajes seleccionados |
| [Curso de Claude Code](https://www.youtube.com/watch?v=TCq7eZ9Lhc8) | Entender modos, contexto, skills e integraciones; contrastar versión | Pasajes seleccionados |
| [MoureDev · flujo de trabajo](https://www.youtube.com/watch?v=2G4aeaCTsHc&t=367s) | Hacer explícito el ciclo de encargo, cambio y revisión | Desde el tramo indicado y pasajes seleccionados |
| [HolaMundo · SDD](https://www.youtube.com/watch?v=5JjuF1zpNbI&t=1659s) | Evaluar qué aporta especificar y cuánto documento necesita una tarea | Pasajes seleccionados |
| [Gentleman · crítica a SDD](https://www.youtube.com/watch?v=eGJoDxuILK0&t=20s) | Evitar convertir una metodología en una plantilla rígida | Transcripción disponible del vídeo breve |
| [HolaMundo · cansancio con IA](https://www.youtube.com/watch?v=odwJdZNRxgU&t=275s) | Abrir una reflexión propia sobre carga de revisión y autonomía | Solo metadatos; no se atribuye una tesis al autor |
| [BettaTech · código que funciona](https://www.youtube.com/watch?v=t-Ilj_NgbNI&t=37s) | Examinar calidad y mantenimiento además de una demostración | Pasajes seleccionados |
| [HolaMundo · Pi](https://www.youtube.com/watch?v=p2kspDx5G6w) | Distinguir aplicación, personalización y acceso al modelo | Transcripción disponible del vídeo breve |
| [MoureDev · Pi](https://www.youtube.com/watch?v=oKKJr7QIskI) | Situar sesiones e integraciones y contrastarlas con documentación | Metadatos y capítulos; sin transcripción comprobada |

Una opinión sobre un flujo no se convierte en regla universal. Ante «SDD soluciona el problema», pregunta qué problema, qué tarea y qué evidencia. Ante «SDD ha muerto», pregunta qué práctica concreta se critica. Puedes conservar la definición de casos y rechazar documentos redundantes. El desacuerdo es útil si lo traduces a una decisión que puedas evaluar.

Una demostración de Pi o Claude Code tampoco asegura idéntica experiencia en tu versión. El curso fija argumentos de Pi 1.0.0 contrastados y un laboratorio MCP 2.3.0 probado. Un tutorial anterior puede utilizar otro paquete o clases antiguas. Consulta documentación de la versión antes de editar para «arreglar» un error de montaje. La novedad de una publicación no demuestra que sus comandos correspondan a tu entorno.

**Actividad de lectura crítica.** Elige una afirmación comprobable, escribe qué observarías si fuera cierta y qué resultado la debilitaría. Aplica ambos a una tarea pequeña. Conserva una conclusión limitada, por ejemplo «en este caso, definir IDs antes evitó aceptar una lista con la misma longitud y elementos equivocados». Evita «la metodología siempre funciona», que el experimento no demuestra.

## 5. Aprende con ayuda y comprueba qué puedes hacer sin ella

Puedes usar una IA para recibir pistas, comparar dos enfoques o pedir un contraejemplo. También puedes pedir una solución completa. El efecto sobre el aprendizaje depende de qué actividad mental sigues realizando. Si miras la solución antes de predecir, pierdes información sobre lo que sabías hacer. Intenta primero una expectativa y explica una duda concreta; luego contrasta la ayuda.

Una progresión voluntaria útil tiene cuatro momentos: ejemplo resuelto, problema semejante con una pista, modificación nueva y explicación sin apoyo. No necesitas completarlos en una sesión. Si aparece fatiga, detente con una nota que diga qué funciona, qué falla y qué decisión está pendiente. Al retomar, reconstruye la regla antes de pedir otra generación. El cansancio no es evidencia de que una tecnología sea inútil, pero sí un dato de tu proceso.

El «efecto de automatización» puede llevarte a aceptar una salida porque viene de una herramienta. Un mecanismo práctico para frenarlo es escribir la expectativa antes de ver el resultado y buscar una entrada que pueda contradecirlo. Evita invertir el ritual: si redactas una justificación después para defender cualquier salida, la revisión se convierte en confirmación.

**Ejercicio de recuperación.** Cierra el libro e identifica por escrito tres responsabilidades: quien decide el comportamiento, quien produce el cambio y quien aporta evidencia de ejecución. Después abre tu último diff y señala una línea que puedas explicar y otra que no. Investiga la segunda con documentación o una pregunta precisa. No necesitas entregar esta nota: sirve para decidir qué estudiar a continuación.

**Contraste resuelto.** «El agente escribió una prueba, por tanto entiendo el caso» no se sigue de la acción. «Puedo explicar por qué T-C queda fuera con ocultar leídos y vuelve al permitirlos» aporta una evidencia personal de comprensión. Ninguna frase aislada mide todo tu dominio; combinar predicción, ejecución y transferencia da una imagen más útil.

En el trabajo profesional seguirás consultando documentación y herramientas. La autonomía no consiste en memorizar APIs ni evitar ayuda: consiste en formular el problema, evaluar una propuesta y saber qué falta por comprobar. Poder continuar cuando no hay conexión o presupuesto también reduce dependencia de una interfaz concreta.

## 6. Proyecto voluntario de transferencia y cierre

Si quieres integrar los cinco libros, crea una copia independiente del laboratorio y añade selección por intervalo inclusivo de prioridad. Mantén IDs, orden y la opción de lectura. Rechaza mínimo mayor que máximo; no reordenes silenciosamente los argumentos. Esta actividad no es la entrega ordinaria ni una recuperación, no puntúa y no necesita enviarse al profesor. Dedícale el tiempo que quieras.

Antes de implementar escribe tres casos: intervalo 2–3 mostrando leídos devuelve T-A/T-D; 1–4 ocultando devuelve T-A/T-B/T-D; 4–4 mostrando devuelve T-C. Añade el caso inválido. Decide archivos permitidos y divide el trabajo en política, comprobación y, si quieres, interfaz. Puedes realizarlo manualmente o pedir un incremento a un agente autorizado; identifica la vía real utilizada.

Revisa el diff completo. Ejecuta las pruebas de la política anterior y las nuevas. Introduce una mutación en una copia para mostrar qué expectativa la rechaza y restaura después la implementación válida. Si expones la función mediante MCP, actualiza también el esquema y la comprobación del cliente: un cambio en la política puede requerir modificar el contrato de integración. No conectes servicios reales para esta práctica.

Como revisión personal, responde cuatro preguntas con hechos: ¿qué decisión era ambigua?, ¿qué contraejemplo rechazó una solución plausible?, ¿qué cambió realmente en los archivos?, ¿qué no se ha comprobado todavía? Si has usado un modelo, añade qué aportó y qué tuviste que corregir. Si no lo has usado, no inventes una sesión: la resolución manual también permite aprender el proceso.

Puedes terminar aquí aunque queden capítulos o experimentos sin realizar. El bloque obligatorio de PM7 conserva sus seis horas, su producto y su dossier. Esta ampliación queda como material de consulta al que volver cuando una situación real haga relevante alguno de los conceptos. Haberla recorrido no añade nota; poder reconstruir las razones te permite trabajar con más criterio.
