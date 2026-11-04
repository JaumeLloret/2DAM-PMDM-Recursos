# Personaliza y conecta: reglas, skills, MCP y subagentes

**Profundización voluntaria, sin nota, sin entrega y fuera de las 6 horas de PM7.** No necesitas configurar una cuenta ni contratar un proveedor para comprender este libro. El laboratorio MCP utiliza dos procesos locales y datos DEMO; no llama a un modelo. Las instrucciones de Pi son una vía adicional para quien disponga de acceso autorizado. Cada herramienta se introduce para resolver una necesidad concreta.

## 1. Una sesión reproducible empieza por su entorno

El vídeo muestra una pantalla; tu experimento necesita identificar el programa que la produce. Registra aplicación, versión, carpeta, modelo si lo hay, herramientas ofrecidas, contexto aportado y objetivo. Un mismo nombre comercial puede cambiar de CLI o capacidades. La edición ordinaria fija Pi 1.0.0, paquete `@earendil-works/pi-coding-agent`, con Node.js 22.19 o posterior. No mezcles sus argumentos con los de la documentación de una edición posterior.

En una copia de prácticas sin credenciales ajenas, `pi --version` y `pi --help` permiten contrastar el montaje. El ejemplo de revisión usa:

```bash
pi --no-extensions --no-skills --no-prompt-templates --no-context-files --tools read
```

Se ofrece lectura al modelo, sin terminal ni edición. Como no se cargan archivos de contexto, debes aportar explícitamente contrato y rutas. No es razonable exigir al agente que respete una decisión que nunca recibió. Pide leer `politica.py` y `comprobar.py`, explicar el resultado de mínimo 3 con ocultar leídos y proponer un contraejemplo, sin modificar archivos. No atribuyas ejecución de tests a una respuesta que solo redacta el comando.

Para un cambio autorizado en una copia distinta puedes ofrecer `read,edit` y ejecutar tú las pruebas. La herramienta de lectura no constituye aislamiento del sistema. En 1.0.0 no se utiliza `--no-mcp`: no figura en su ayuda contrastada. `--no-extensions` desactiva también las extensiones integradas y aquí no se añaden otras explícitamente. Las credenciales, cuando hagan falta, se configuran en el mecanismo autorizado de la aplicación; nunca dentro del encargo o de Git.

Continuar una conversación y revertir archivos son operaciones diferentes. Pi documenta continuación, selección de sesión y ramificación de conversación; consulta [sesiones](https://pi.dev/docs/latest/sessions) para la edición instalada. Volver a un punto de la conversación no garantiza que el repositorio vuelva al mismo corte. Antes de editar revisa carpeta y diff. Una respuesta anterior puede describir archivos que ya cambiaron.

**Experimento conceptual.** Dos conversaciones afirman haber corregido el filtro. Solo una tiene un diff y una ejecución del contrato asociadas al corte. ¿Qué puedes concluir? La primera tiene evidencia revisable de esa acción; la otra contiene una afirmación pendiente de verificar. La apariencia de la interfaz no sustituye la trazabilidad.

## 2. Reglas, plantillas y skills: instrucciones con distintos ciclos

Una regla de proyecto expresa acuerdos relativamente estables: cómo ejecutar pruebas, qué carpetas pertenecen al producto o qué operación necesita decisión humana. Una plantilla facilita formular un encargo recurrente. Una **skill** agrupa instrucciones y, a veces, recursos o scripts para un procedimiento reutilizable. Su utilidad depende de cuándo se carga, qué contiene y si la aplicación la entiende. Ninguno de esos archivos concede por sí solo permisos del sistema.

El laboratorio incluye `AGENTS.ejemplo.md` y `revision-contrato/SKILL.ejemplo.md`. Son documentos de estudio: **no se instalan ni se cargan automáticamente** con esos nombres. Abre ambos antes de plantearte adaptar un mecanismo real. El primero delimita datos DEMO, contrato vigente y comandos. El segundo organiza una revisión: leer regla, predecir IDs, comparar código, ejecutar comprobaciones autorizadas y explicar límites. El procedimiento no dice «acepta siempre la respuesta» ni sustituye la expectativa por lo que devuelva el programa.

El formato [Agent Skills](https://agentskills.io/specification) describe un archivo `SKILL.md` con metadatos y cuerpo. Una descripción ayuda a seleccionar el procedimiento; el cuerpo explica cómo realizarlo. Los detalles de descubrimiento y activación dependen del cliente. Consulta [skills de Pi](https://pi.dev/docs/latest/skills) antes de copiar rutas o comandos. Un campo como `allowed-tools` no debe presentarse como una garantía universal de aislamiento: comprueba qué interpreta y aplica realmente tu aplicación.

Un buen procedimiento evita repetir información mutable. En lugar de copiar cuatro veces el contrato, remite al archivo canónico y exige comprobar su versión. Si una skill conserva el requisito antiguo, puede propagarlo con mucha consistencia. La reutilización amplifica tanto aciertos como errores. Versiona estos documentos, revisa su diff y retira pasos que ya no correspondan al entorno.

**Ejercicio resuelto.** Una revisión frecuente olvida comprobar identidad por ID. ¿Añades una regla global de veinte páginas? Para este caso, basta un paso concreto en la revisión de contrato y un ejemplo con T-A/T-D. Una norma general enorme puede cargarse en tareas ajenas y consumir atención sin aportar una decisión. La mejor ubicación es la que hace aparecer la información cuando cambia el juicio.

## 3. MCP distingue herramientas, recursos y plantillas

Model Context Protocol define mensajes e interfaces para conectar aplicaciones con capacidades externas. En este laboratorio hay un cliente Python y un servidor Python que se comunican por **stdio**: los canales estándar del proceso. El cliente inicia el servidor, consulta lo que ofrece y solicita operaciones. No hay navegador, puerto HTTP público ni proveedor de modelo. Es una integración real aunque no incluya generación de texto.

Una **herramienta** representa una operación invocable con argumentos; un **recurso** ofrece contenido identificado por una URI; una **plantilla de prompt** organiza mensajes a partir de parámetros. En nuestro caso `seleccionar_avisos` calcula IDs, `avisos://regla` expone la regla y `revisar_criterio` construye una petición de revisión. Recuperar esa plantilla no significa que un modelo la haya contestado. Obtener una lista de herramientas tampoco significa haberlas ejecutado.

| Capacidad del laboratorio | Solicitud del cliente | Evidencia observable |
|---|---|---|
| Herramienta `seleccionar_avisos` | Mínimo 3, ocultar leídos | Contenido estructurado con T-A y T-D |
| Herramienta `consultar_aviso` | ID conocido o inexistente | Registro o error de herramienta |
| Recurso `avisos://regla` | Lectura de la URI | Texto de la política |
| Plantilla `revisar_criterio` | Criterio de revisión | Mensajes preparados; sin inferencia |

Un esquema de argumentos ayuda a validar estructura y tipos. No demuestra que la operación respete la intención de producto. La herramienta podría devolver IDs incorrectos con JSON perfectamente válido. Por eso el cliente compara también un resultado independiente. La integración y la regla necesitan observaciones distintas.

Separa **versión del SDK** y **versión del protocolo**. La referencia de esta ampliación fija el paquete Python `mcp==2.3.0`; la ejecución contrastada informó protocolo `2026-07-28`. No son números intercambiables. La línea 2 del SDK utiliza `MCPServer` y `Client`; numerosos tutoriales anteriores enseñan APIs distintas. Tampoco presentes una negociación inicial con estado como obligación idéntica de todas las revisiones y transportes. Consulta el [SDK oficial](https://py.sdk.modelcontextprotocol.io/) y su [cliente](https://py.sdk.modelcontextprotocol.io/client/) para el corte que ejecutas.

**Comprensión.** ¿MCP decide por sí solo si una operación de borrado es apropiada? No. El protocolo transporta solicitudes y resultados; los controles de la aplicación, la autorización y los permisos efectivos deben limitar la acción. Para este ejercicio el servidor solo expone lectura y cálculo sobre una tupla DEMO, sin escrituras ni conexión a cuentas.

## 4. Sigue la ejecución real del servidor y el cliente

Descarga el ZIP del laboratorio y sigue su página de preparación. La vía MCP requiere Python 3.12 y un entorno virtual; las tres prácticas previas usan únicamente la biblioteca estándar. Instala la dependencia fijada en ese entorno y ejecuta `cliente_mcp.py`. No ejecutes primero el servidor en otra terminal: el cliente lo inicia como subproceso usando el mismo intérprete y una ruta absoluta calculada desde su archivo. Así se evita conectar por error con otro servidor.

Abre `servidor_mcp.py`. `MCPServer` registra dos funciones como herramientas, una como recurso y otra como plantilla. `seleccionar_avisos` devuelve un modelo Pydantic con los campos `ids` y `total_fuente`; se registra con salida estructurada. La forma declarada permite al cliente leer esos campos sin extraer números de una frase. La selección sigue delegándose en la política, de modo que una modificación de esta puede producir JSON válido y semántica incorrecta.

Abre ahora `cliente_mcp.py`. Comprueba la versión instalada antes de conectar, enumera las herramientas, lee la regla, llama a la selección y compara `ids` con T-A/T-D. Después solicita un ID inexistente y exige una señal de error; por último recupera la plantilla y confirma que contiene mensajes. La salida `PASS` solo se imprime si se cumplen esas comprobaciones. El campo `modelo_ejecutado` debe ser `false`.

El caso inexistente provoca una traza de diagnóstico en **stderr** del servidor. Está previsto: el cliente verifica que llega como error de herramienta. La salida final en stdout debe indicar `error_controlado: true` y el proceso terminar con código 0. Una excepción que interrumpa al cliente antes de ese informe es un problema diferente. Los mensajes del servidor no deben escribirse indiscriminadamente en stdout, porque ese canal lleva el intercambio MCP en este transporte.

**Predice antes de tocar.** Si sustituyes AND por OR en una copia de `politica.py`, ¿desaparecerá la herramienta del catálogo? No: su registro puede permanecer idéntico. ¿Qué debería fallar? La comparación semántica de IDs. Si cambias el nombre de la herramienta, en cambio, puede fallar la comprobación del catálogo antes de llegar a invocarla. Eso ayuda a localizar si el problema está en exposición, transporte o comportamiento.

Para detener el experimento no necesitas dejar un servicio instalado. El contexto del cliente cierra sus recursos al terminar. Si aparece `ModuleNotFoundError: mcp`, utiliza el Python del entorno donde instalaste `requirements-mcp.txt`. Si se informa versión distinta de 2.3.0, no mezcles ejemplos: crea el entorno indicado. Si falla la descarga de paquetes, conserva la vía sin MCP; esta ampliación no condiciona la unidad.

## 5. Subagentes: dividir trabajo sin perder la responsabilidad

Un subagente es otra ejecución a la que se delega una tarea acotada. Puede recibir un contexto distinto y devolver un resultado al coordinador. Más ejecuciones no significan automáticamente más independencia: pueden compartir requisito equivocado, datos incompletos o modelo. Tampoco desaparece el coste de coordinar y revisar. Para cambiar un operador en una función pequeña, la coordinación puede costar más que el trabajo.

Hay una división útil cuando las tareas tienen límites claros: una persona o agente propone casos desde el contrato, otra inspecciona implementación y otra revisa accesibilidad de la pantalla. La revisión de casos debería hacerse sin copiar primero la salida del programa. Al reunir resultados, el coordinador resuelve contradicciones con evidencia. No decide por mayoría de respuestas: tres revisores pueden repetir el mismo supuesto erróneo.

Define para cada encargo objetivo, entradas autorizadas, archivos editables, resultado esperado, verificaciones y condición de parada. Por ejemplo: «propón tres casos de frontera a partir de esta regla; no edites ni ejecutes». Es distinto de «haz que todo pase». Si varias ejecuciones editan el mismo archivo, pueden sobrescribirse o producir una mezcla difícil de revisar. Copias o worktrees separados ayudan a aislar cambios de Git, aunque siguen necesitando integración y pruebas después.

Un worktree no crea por sí solo un contenedor de seguridad ni un modelo diferente. Comparte el repositorio y su infraestructura de Git, pero tiene un árbol de trabajo separado. No incorpores dependencias o credenciales para resolver un conflicto conceptual. Primero decide quién es propietario del cambio y cómo se integrará. Consulta [Git worktree](https://git-scm.com/docs/git-worktree) antes de ensayar comandos en una copia de práctica.

**Ejercicio sin aplicaciones.** Reparte en tres tarjetas la revisión de intervalo inclusivo: expectativas, código y recorrido de interfaz. Escribe qué información recibe cada revisor y qué entrega. Reúne los resultados e identifica una contradicción posible. Si la única forma de resolverla es preguntar «qué agente es mejor», faltan contrato y observación. Una organización profesional conserva una responsabilidad humana clara por el resultado integrado.

## 6. Extensiones y automatización: medir antes de ampliar

Una extensión puede añadir comandos, interceptar eventos o cambiar el flujo de una aplicación. Un hook automatiza una acción en un momento determinado. Son código que ejecuta el entorno; no equivalen a un párrafo de instrucciones. Su alcance real depende de los permisos del proceso. Antes de instalarlos identifica procedencia, versión, archivos que leen, posibles conexiones y modo de desactivación. Una descripción breve no revela necesariamente todos sus efectos.

Automatizar `comprobar.py` después de editar puede acortar el feedback. Automatizar una publicación cada vez que aparezca verde necesita decisiones adicionales: el verde de seis pruebas no demuestra revisión completa ni autorización del destino. Escala la automatización al efecto. En este laboratorio no se instala ninguna extensión ni se configura publicación automática; puedes dibujar el flujo y discutir qué señal falta antes de cada acción.

Un fallo repetido no siempre exige otra herramienta. Si el agente olvida la regla, revisa contexto. Si no puede leer el archivo correcto, revisa ruta y permisos. Si la regla está bien pero el test es débil, revisa el oráculo. Añadir MCP a una función local no mejora automáticamente su corrección; tiene sentido si necesitas una frontera de integración, reutilización entre clientes o acceso controlado a una capacidad externa.

**Caso resuelto.** Quieres que tres aplicaciones consulten el mismo catálogo DEMO. Un servidor con operaciones pequeñas puede ofrecer una interfaz común. Quieres corregir un `>=` en tu archivo: una edición y sus pruebas son suficientes. La elección de herramienta se justifica por la necesidad. Esta distinción permite aprovechar novedades sin convertir cada tendencia del vídeo en una dependencia obligatoria del proyecto.

Al cerrar, explica la diferencia entre instrucción de proyecto, skill, extensión, herramienta MCP y subagente usando una acción observable para cada una. Si dos conceptos te parecen iguales, pregunta quién carga el contenido, quién ejecuta código, qué datos entran y qué permisos actúan. Esas preguntas siguen siendo útiles cuando cambian marcas o interfaces.
