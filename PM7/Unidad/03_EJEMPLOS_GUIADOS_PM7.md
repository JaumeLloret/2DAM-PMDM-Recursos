# Ejemplos guiados · PM7

Son demostraciones reproducibles de decisiones de proceso. No son un historial de uso real de un agente o de un equipo. Realiza tu intento antes de consultar el resultado razonado. Registra únicamente los comandos que ejecutes tú.

## 1. Convertir “buscador útil” en un contrato

Entrada: catálogo A “Revisión de cámara” pendiente, B “Preparar documentación” terminada, C “Revision de cámara” terminada, D “Plan de mañana” pendiente. Petición: “Quiero encontrar rápidamente lo que falta”. Paso 1: subraya términos ambiguos: encontrar, rápidamente, falta. Paso 2: pregunta por campo, coincidencia, estado y orden. Paso 3: escribe un ejemplo que distinguiría dos respuestas: REVISION sobre A/C prueba la regla de acentos; consulta cámara + pendientes prueba la combinación.

Resultado razonado: búsqueda por subcadena de título y filtro de estado combinados con AND; vacío muestra todos los del estado seleccionado y conserva orden original. “Rápidamente” queda fuera de una promesa de milisegundos sin dispositivo/medición; la feature se acota a los cuatro datos DEMO. Error frecuente: convertir “falta” directamente en un filtro permanente de pendientes sin preguntar. Comprobación: otra persona puede predecir IDs visibles con cada entrada sin leer código.

## 2. Encargo acotado y modo manual equivalente

Entrada: S1–S5 cerrados en la spec. Prepara este encargo como texto de práctica: “Implementa selectEntries y searchKey en lib/catalog.dart, más test/search_test.dart para S1–S5. No cambies UI, dependencias ni configuración. Conserva ñ distinta de n. Ejecuta las pruebas si tienes terminal; si no, identifica los comandos como pendientes. Entrega diff y dudas”. Revisa permisos antes de usar cualquier agente.

Si hay herramienta autorizada, ejecuta solo ese incremento y conserva salida saneada. Si no la hay, implementa manualmente las mismas reglas y anota MANUAL. El resultado esperado es una función pura que devuelve una nueva lista y no muta la entrada. No hay un número mínimo de prompts. Comprobación: el diff solo contiene los archivos previstos y las aserciones cubren ambos estados de S3. Error frecuente: aceptar una actualización de pubspec porque el agente la propone aunque el SDK baste.

## 3. Una revisión descubre una desviación con tests verdes

Entrada didáctica de diff: `return titleMatches || stateMatches;`. Un test existente solo usa consulta vacía y estado todas; pasa con OR y con AND. Antes de ejecutar, predice consulta cámara + pendientes: con OR también aparecerían C por texto y D por estado. Eso contradice S3, que espera solo A. Añade un caso discriminante y cambia OR por AND en tu copia de ensayo.

Registro de revisión modelo: “En selectEntries, la unión permite elementos que no cumplen ambas condiciones; afecta S3. Añadir consulta cámara/pendientes, esperar A; corregir combinación”. No afirmes que has encontrado ese bug en tu proyecto si no existía: el ejemplo es sintético. Comprobación: explica por qué el test anterior estaba verde y qué nuevo caso cambia la confianza.

## 4. Limpiar texto tiene una decisión propia

Entrada: consulta cámara con filtro pendientes deja A visible. Una propuesta limpia texto y además vuelve a estado todas. D02 dice que se conserva estado. Reproduce primero el comportamiento esperado: tras limpiar deben verse A y D, contador 2 de 4. Inspecciona el callback del botón y comprueba que solo borra el controlador de texto. Ejecuta la prueba widget correspondiente en tu implementación.

Documenta S7 → decisión “limpiar conserva estado” → tarea UI → prueba de interacción. Error frecuente: juzgar la propuesta como “más cómoda” y cambiar la regla sin consulta. Si se quisiera otro comportamiento, habría que versionar D02/D01 y actualizar pruebas; no es una corrección silenciosa.

## 5. Escribir una PR que se pueda revisar

Entrada: implementación y pruebas disponibles. Redacta cinco párrafos breves: necesidad, comportamiento acordado, archivos/cambios, comandos realmente ejecutados con corte, pendientes/límites. Ejemplo de verificación prudente: “flutter analyze y flutter test ejecutados en el corte local indicado en D05; publicación y pruebas de emulador pendientes”. Sustituye esa frase por tus resultados reales, no por un texto decorativo.

Añade enlace relativo al dossier y señala la decisión de ñ como límite conocido. Pide revisión del comportamiento y de la coherencia documental. Comprobación: el revisor puede saber si está ante una PR propuesta, revisada o fusionada; no confunde un APK con instalación física. Error frecuente: marcar una checklist completa solo porque el agente terminó su respuesta.
