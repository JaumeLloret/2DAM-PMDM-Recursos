# Comprueba lo que genera la IA: pruebas, diseño y mantenimiento

**Profundización voluntaria, sin nota, sin entrega y fuera de las 6 horas de PM7.** Este libro utiliza el laboratorio descargable de la ampliación. No modifica las evidencias D01–D08 ni exige un nuevo proyecto. Puedes estudiar los casos en papel; ejecutar los experimentos es otra posibilidad. El aprendizaje consiste en justificar por qué una comprobación distingue un programa correcto de otro que solo parece funcionar.

## 1. El oráculo debe poder contradecir al programa

Un test necesita una entrada, una ejecución y una expectativa. El **oráculo** es el criterio que permite decidir si la salida es aceptable. Si copias en la expectativa la misma expresión que quieres comprobar, ambas pueden compartir el defecto. La prueba dará verde porque dos errores coinciden. Una expectativa independiente se obtiene de la regla y de ejemplos decididos antes de mirar la salida.

En el laboratorio hay cuatro avisos. T-A y T-D tienen el mismo título, prioridad 3 y están sin leer; T-B tiene prioridad 1 y está sin leer; T-C tiene prioridad 4 y está leído. Con prioridad mínima 3 y ocultar leídos, la salida correcta es **T-A, T-D**, en ese orden. El contrato combina prioridad suficiente **y** visibilidad por lectura. La identidad es el ID, no el título. Estas decisiones permiten anticipar la respuesta sin ejecutar Python ni consultar un agente.

Escribe la tabla antes del comando:

| ID | Prioridad ≥ 3 | Sin leer | Debe aparecer |
|---|---|---|---|
| T-A | Sí | Sí | Sí |
| T-B | No | Sí | No |
| T-C | Sí | No | No |
| T-D | Sí | Sí | Sí |

Una prueba que solo diga «hay resultados» no distingue AND de OR: ambas implementaciones devuelven algo. Una prueba que compare únicamente el número de elementos puede aceptar dos avisos equivocados. Comparar IDs y orden concreta mejor esta regla. Esto no significa que todo test deba comparar un objeto entero: comprueba las propiedades que forman parte del contrato y evita fijar detalles accidentales, como un texto decorativo que el producto permite cambiar.

El agente puede proponer casos, pero revisa la expectativa como una decisión separada. Pregúntale por un contraejemplo y compruébalo tú. Si el requisito sigue siendo ambiguo, un test no lo resuelve por autoridad técnica: hace falta decidir el comportamiento. Tampoco conviertas la primera salida observada en el resultado esperado solo para conseguir verde.

**Ejercicio resuelto.** Cambias el mínimo a 4 y permites mostrar leídos. ¿Qué IDs esperas? Solo T-C. Una implementación que devuelve también T-A incumple el mínimo; una que no devuelve nada puede haber conservado indebidamente el filtro de lectura. Son diagnósticos distintos y conducen a revisiones distintas.

## 2. Tres mutantes enseñan más que una colección de verdes

Una **mutación** introduce un defecto pequeño y controlado para comprobar si las pruebas lo detectan. No pretende imitar todos los fallos reales. En este laboratorio las variantes están escritas de antemano: `or` cambia la combinación, `limite` usa un límite exclusivo e `identidad` fusiona títulos iguales. No son salidas de un modelo. La implementación `correcta` es la referencia del experimento.

Desde la carpeta Laboratorios ejecuta `python comprobar.py --variante correcta`. Debe terminar con seis pruebas superadas y código de salida 0. Después ejecuta cada una de las otras variantes. Deben aparecer fallos de aserción y terminar con código distinto de 0. Aquí el rojo es el resultado esperado del experimento: has mostrado que el conjunto de pruebas rechaza un defecto conocido. Si una variante defectuosa pasa todo, investiga qué propiedad no estás observando; no lo celebres como una mejora.

| Variante | Cambio preparado | Contraejemplo que lo separa |
|---|---|---|
| `or` | Basta prioridad o visibilidad | T-B o T-C entran indebidamente con mínimo 3 y ocultar leídos |
| `limite` | `>` en vez de `>=` | T-A y T-D, justo en prioridad 3, desaparecen |
| `identidad` | Fusiona por título | Se pierde uno de T-A/T-D aunque tienen IDs distintos |

Lee el nombre de cada test fallido. No reduzcas todo el proceso a contar rojos. Puede que un test detecte varias variantes y otros sigan verdes. El test que comprueba que la fuente no se modifica protege una propiedad distinta: una función podría devolver los IDs correctos y dejar la colección original alterada, causando un defecto en la siguiente pantalla.

Las mutaciones también descubren pruebas frágiles. Si un test falla por el nombre de una variable, sin cambiar el comportamiento, probablemente está acoplado a un detalle interno. Si no falla al excluir todos los valores del límite, falta una expectativa de frontera. El objetivo es sensibilidad al comportamiento incorrecto y estabilidad ante cambios internos legítimos.

**Ampliación en papel.** Diseña una cuarta mutación que invierta el orden de los resultados. Predice qué expectativa la detectaría. Después considera si el orden estaba realmente pactado. En nuestro laboratorio sí: se conserva el de la fuente. En otra aplicación podría ser irrelevante y comparar conjuntos sería apropiado. No traslades un oráculo sin trasladar también el contrato.

## 3. Propiedades y capas: qué demuestra cada prueba

Los ejemplos concretos explican situaciones reconocibles. Las **propiedades** describen relaciones que deberían mantenerse en familias de entradas. Si subes el mínimo manteniendo el resto igual, los IDs seleccionados no deberían ganar elementos que antes no cumplían prioridad. Si activas ocultar leídos, no deberían aparecer IDs nuevos. Seleccionar no debe mutar la fuente. Estas relaciones permiten pensar casos que no estaban en la primera tabla.

Una propiedad necesita condiciones. Si entre dos ejecuciones recibes avisos nuevos o cambia la prioridad, la relación anterior ya no compara el mismo problema. Y una salida siempre vacía satisface varias relaciones de reducción aunque sea incorrecta. Combina propiedades con ejemplos que exijan resultados positivos. Una familia de pruebas puede compartir una laguna; más cantidad no equivale automáticamente a mayor capacidad de detección.

En una aplicación Flutter distingue al menos tres planos. Una prueba de la función de selección observa la regla con datos. Una prueba de widget puede comprobar que el control cambia el estado y se representa la lista esperada. Una prueba de integración recorre la aplicación y sus dependencias. Que la función sea correcta no demuestra que el interruptor esté conectado a ella; que el widget funcione con un repositorio falso no demuestra la respuesta de un servicio real.

| Pregunta | Comprobación proporcionada | Límite que debes declarar |
|---|---|---|
| ¿Se aplica AND con límite inclusivo? | Test de función con IDs independientes | No observa interacción de pantalla |
| ¿El control cambia la lista? | Test de widget con estado inicial conocido | Depende del montaje usado |
| ¿Se conserva la decisión al navegar? | Recorrido de integración | Solo cubre ese recorrido y entorno |
| ¿La interfaz es utilizable con teclado y lector? | Revisión de semántica e interacción accesible | Necesita observaciones específicas |
| ¿Se instala y ejecuta en un dispositivo? | Prueba en ese dispositivo | No equivale a todos los dispositivos |

En [pruebas de Flutter](https://docs.flutter.dev/testing/overview) puedes contrastar estas capas. No conviertas una compilación en una prueba de usabilidad ni un análisis estático en una demostración funcional. Ambos son valiosos: detectan clases de problemas distintas. La frase «validado» necesita decir qué se validó, con qué versión y en qué condiciones.

**Comprensión.** El análisis estático pasa y el botón no hace nada. ¿Se contradicen los resultados? No. El programa puede ser válido para el analizador y tener un flujo incorrecto. Diseña una observación que cambie el control y compare antes/después, en vez de repetir el mismo análisis esperando que encuentre otro tipo de fallo.

## 4. Diseño proporcional: dónde vive cada decisión

Un agente puede generar una solución muy breve que mezcla datos, regla y presentación, o una arquitectura de muchas carpetas sin necesidad. Evalúa el coste de cambiar una decisión. Si el mínimo de prioridad se calcula en tres widgets, una modificación puede dejar pantallas inconsistentes. Si una función pura recibe avisos y criterios y devuelve una selección, puedes discutir la regla sin reconstruir toda la interfaz.

Separar no exige añadir una capa por cada sustantivo. Para este caso bastan datos identificables, una política de selección y una interfaz que entrega los criterios. La política no necesita conocer colores ni rutas; la pantalla no necesita reimplementar el predicado. Si el proyecto crece o incorpora persistencia, puedes justificar nuevas fronteras a partir de cambios reales. La documentación de [arquitectura de Flutter](https://docs.flutter.dev/app-architecture) presenta orientaciones que debes adaptar a escala y requisitos.

Una decisión de estado especialmente útil es identificar su propietario. El control de mínimo y el de lectura pertenecen al estado de filtrado. La lista visible se deriva de fuente y criterios. Mantener otra copia mutable de la lista visible crea el riesgo de que los tres valores se contradigan. Derivar un valor sencillo suele reducir sincronización, aunque cálculos costosos pueden justificar caché con invalidación explícita. No memorices «nunca guardar derivados»: entiende qué inconsistencia evitas y qué coste pagas.

Considera `restablecerMinimo()`. El nombre no dice si debe modificar también el filtro de lectura. En la ampliación la decisión vigente conserva ocultar leídos. Un agente que reinicializa todo el estado porque resulta cómodo cambia producto. El diseño facilita respetar el contrato cuando cada operación afecta solo a los campos autorizados y las pruebas observan los demás.

**Refactorización** significa cambiar estructura preservando comportamiento pactado. Si además cambias el límite o la identidad, ya hay una modificación funcional que necesita decisión y expectativas nuevas. Haz esos cambios en pasos distinguibles. Un diff con renombrados, formateo, nueva dependencia y regla distinta dificulta localizar una regresión. La solución proporcionada puede ser una función de veinte líneas con un buen contrato; no necesita demostrar sofisticación mediante tamaño.

**Ejercicio resuelto.** El agente propone cinco interfaces para una lista estática de cuatro registros. Pídele que explique qué cambio previsto exige cada una. Si no existe un caso concreto, conserva la separación de política y presentación y aplaza la abstracción. Si dos repositorios reales requieren comportamientos intercambiables, entonces hay una razón verificable para una frontera adicional.

## 5. Revisar y depurar exige seguir datos, no opiniones

Empieza una revisión por el contrato y la superficie del cambio. Mira todos los archivos del diff: una corrección de filtro que toca credenciales o elimina tests necesita explicación. Después recorre una entrada discriminante de principio a fin. ¿Qué valor sale del control? ¿Dónde cambia el estado? ¿Qué función selecciona? ¿Qué IDs llegan al widget? ¿Qué se muestra? Este recorrido convierte «parece un problema de estado» en hipótesis localizables.

Para depurar, formula una hipótesis que pueda resultar falsa. «El interruptor no actualiza `ocultarLeidos`» se comprueba observando ese valor tras la interacción. Si cambia correctamente, revisa la siguiente frontera. Evita pedir al agente «arréglalo todo» después de cada error: puede modificar varios puntos y ocultar la causa. Una corrección pequeña permite relacionar el cambio con el efecto.

Si una prueba nueva falla antes de la corrección, conserva ese rojo como reproducción. Corrige el defecto, vuelve a ejecutar esa prueba y las relacionadas. Si el fallo era de importación, todavía no habías llegado al comportamiento: primero arregla el montaje y reproduce la aserción. No describas cualquier código de salida 1 como una prueba funcional lograda.

Cuando pidas ayuda, entrega el comando exacto, la primera parte relevante del error, la versión y el resultado esperado. Excluye secretos. Indica qué has intentado y qué ocurrió. «No funciona» deja al modelo adivinando entorno y contrato. Un registro breve de hipótesis rechazadas también evita volver sobre la misma explicación sin datos nuevos.

**Caso guiado.** Tras ocultar leídos desaparecen T-A y T-D, pero permanece T-C. La fuente tiene sus valores correctos. Una hipótesis es que se ha invertido la condición de lectura. Predice qué ocurriría al desactivar el control antes de editar. Si entonces aparecen todos los que cumplen prioridad, el contraste refuerza la hipótesis. Aun así, localiza la expresión y añade el caso que la discrimina antes de dar por terminada la revisión.

## 6. Transferir demuestra comprensión más allá de copiar

Después de arreglar el ejemplo, prueba un problema distinto en una copia: seleccionar avisos dentro de un **intervalo inclusivo** de prioridad `[minimo, maximo]`, conservando identidad, orden y la opción de ocultar leídos. Esta transferencia es voluntaria. No es una variante de examen, una nueva entrega ni una condición del dossier. No cambies los archivos ordinarios de PM7 para hacerla.

Primero define qué pasa si mínimo es mayor que máximo: para este ejercicio decide rechazarlo con `ValueError`. Con intervalo 2–3 y mostrar leídos deben salir T-A y T-D. Con 1–4 y ocultar leídos deben salir T-A, T-B y T-D. Con 4–4 y mostrar leídos debe salir T-C. El caso 4–4 distingue un intervalo inclusivo de uno que excluye sus bordes. No necesitas un agente para obtener estas expectativas.

Después implementa una función nueva y revisa que la anterior no haya cambiado accidentalmente. Puedes pedir al agente una revisión de tus expectativas, una propuesta de mutación o una explicación de un fallo. Mantén visible quién decidió el contrato. Si acepta un intervalo invertido y lo reordena automáticamente, habrá elegido otra política que no coincide con la de este ejercicio, aunque su salida parezca útil.

Termina con una explicación sin consultar la solución: qué operación combina criterios, por qué T-A y T-D siguen siendo dos elementos, qué protege la prueba de fuente inmutable y qué parte no verifica Python respecto de una pantalla Flutter. Si no puedes explicarlo, reduce el caso a dos registros y vuelve a recorrerlo. Aprender requiere poder reconstruir una razón, no recordar una cadena de comandos.

**Autocomprobación final.** Un compañero cambia solo nombres internos y pasan las pruebas: compatible con una refactorización. Cambia `>=` por `>` y falla el borde: el contrato discrimina ese defecto. Cambia las expectativas para aceptar `>` sin decisión de producto: ha cambiado la especificación para acomodarla al programa. Poder distinguir estas tres situaciones es una habilidad central al trabajar con código generado.
