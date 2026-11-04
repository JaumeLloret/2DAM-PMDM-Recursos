# Proyecto AulaFlow: construye tu aplicación paso a paso

## Prepara una copia y comprueba el punto de partida

Estás en la integración. Ya has practicado pantallas, rutas y estado. Retoma TU copia de AulaFlow. El ZIP de la descripción contiene el mismo starter de la guía: úsalo solo si necesitas recuperar el punto de partida, sin sobrescribir tu trabajo.

El starter funciona, pero tiene deudas deliberadas: solo navegación inferior, mapa mutable pasado al detalle, filtro en la vista, tablero estático y fixtures conocidos directamente. Tu misión es convertirlo en una aplicación local adaptable y coherente. Los datos DEMO son ficticios; no introduzcas datos personales.

Este laboratorio ocupa 110 minutos de integración dentro de las 12 horas. La explicación y los ensayos previos ya forman parte de los otros bloques de la ruta; no debes repetirlos como trabajo adicional. Los tiempos orientan el reparto: si un fallo impide ejecutar, documenta el primer error antes de continuar.

**Primer tramo · 10 min.** Haz una copia o commit. Ejecuta `flutter pub get`, `flutter analyze`, `flutter test` y `flutter run`. Recorre Tareas, Tablero, Ajustes y un detalle. Anota versiones, comandos y resultado en el registro de Plantillas PM3. Debes ver los datos DEMO-201, DEMO-202 y DEMO-203. Esta es tu referencia antes del cambio, también llamada *baseline*.

Si no arranca, usa [Ayuda de ejecución](13_GUIA_INICIO_Y_AYUDA_PM3.md). Si ya habías avanzado, conserva tu versión y documenta qué funciona; no reinicies todo para parecerte al ZIP.

## Adapta la navegación y conecta el detalle por id

**Segundo tramo · 20 min.** Construye una sola lista de destinos con etiqueta, icono y ruta. Usa `LayoutBuilder` para elegir barra inferior por debajo de 600 px y lateral desde 600. Apóyate en el ejemplo que ya probaste, comprendiendo qué cambias al trasladarlo a AulaFlow.

Prueba a 390 y 900. Selecciona Tablero antes de cambiar el ancho. Debe conservarse Tablero; el contenido ocupa el espacio restante y no queda debajo de la navegación. Guarda ambas capturas. Si desaparece, reduce temporalmente el cuerpo a un texto por destino y comprueba índice y ruta antes del layout completo.

**Tercer tramo · 15 min.** Cambia `/detail` más `extra` por `/tasks/:id`. Crea primero el detalle que recibe el id y muestra ese valor. Después consulta el dato compartido. No sigas transportando el mapa mutable como una segunda fuente.

Prueba DEMO-201 y un id inexistente. El primero debe abrir la tarea correcta; el segundo, una explicación y una salida a Tareas. Guarda el patrón y ambos resultados. Si necesitas recordar el contrato, vuelve a [Una ruta identifica una pantalla y un dato](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md).

## Une lista y tablero mediante un estado compartido

**Cuarto tramo · 25 min.** Crea `TasksViewModel` con `ChangeNotifier`. Extrae tareas, filtro y orden; deja en las vistas solo el estado de presentación que no se comparte. Las vistas escuchan la misma instancia y llaman a métodos en vez de mutar directamente la colección.

Empieza por el filtro: cambia `onlyPending` y verifica lista y contador del tablero. Después conecta ordenación y actualización desde el detalle. El filtrado y la ordenación se calculan fuera de `build`, en el ViewModel. El tablero deriva sus cifras de las mismas tareas; no mantiene contadores estáticos que intentas sincronizar a mano.

**Quinto tramo · 15 min.** Define el contrato `TaskRepository`, crea su implementación en memoria y pásala al ViewModel por constructor. Construye esa dependencia una vez en el punto de composición de la aplicación. No la recrees en cada reconstrucción.

Comprueba que puedes sustituirla por un fake. En PM3 no hace falta servicio remoto. Si una capa solo repite otra llamada sin una responsabilidad, explica por qué la eliminas. Conserva un diagrama antes/después con una frase por responsabilidad.

Resultado esperado: lista y tablero coinciden al filtrar y al completar una tarea; volver del detalle conserva el estado exigido. Si no ocurre, sigue [Un dato compartido necesita un dueño](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md) y localiza qué instancia lee cada pantalla.

## Añade confirmación y representa los estados de la aplicación

**Sexto tramo · 15 min.** Conecta el diálogo cancelable, el comando que cambia la tarea y el `SnackBar`. Consulta [Interacción, vacío y error](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md) si necesitas recuperar el patrón. No muestres «actualizada» antes de que la operación tenga éxito.

Distingue carga, resultado con datos, resultado vacío y fallo. Provoca el fallo mediante el fake del repositorio, no desconectando servicios que esta aplicación local no utiliza. Reintentar debe volver a ejecutar la operación de carga. El estado vacío de un filtro debe ofrecer quitarlo.

Guarda estos cuatro pares de resultado: Cancelar no modifica; Confirmar modifica una vez; filtro sin coincidencias no es error; fake que falla sí permite reintentar. Explica el recorrido evento → comando → estado → aviso → reconstrucción.

Si el diálogo no cambia datos, comprueba primero el comando fuera del diálogo. Si cambia dos veces, localiza las dos llamadas y elimina la duplicación. No soluciones una reconstrucción ausente añadiendo cambios de estado dentro de `build`.

## Comprueba el conjunto y decide si puedes cerrar

**Último tramo · 10 min.** Comprueba una vez cada caso y registra el resultado real:

| Caso | Resultado que debes observar |
|---|---|
| 390 y 900 px | bar/rail, contenido completo, mismo destino |
| Texto ampliado | etiquetas y acciones disponibles |
| Teclado | destinos, filtro y diálogo alcanzables con foco visible |
| Id válido e inválido | tarea correcta / explicación y salida |
| Filtro y orden | lista y tablero coherentes |
| Cancelar y confirmar | cero cambios / un cambio y feedback |
| Vacío y fallo | mensajes distintos y acciones útiles |
| Analizador y tests | comandos ejecutados y salida conservada |

El producto mínimo incluye lista, tablero, ajustes y detalle; adaptación; id estable; filtro y orden observables; ViewModel escuchable; repositorio inyectado; diálogo, feedback y estados coherentes. No añadas REST, login, persistencia, sensores ni capas ajenas al problema.

Continúa en PM3 · Práctica 2: localiza y corrige un fallo (consulta en AULES). Después harás la autoevaluación y prepararás el envío. La lista definitiva de archivos está en PM3 · Entrega tu aplicación y sus evidencias (consulta en AULES); no prepares otra entrega para este libro.

**Ampliación opcional, sin carga obligatoria.** Solo si el mínimo funciona: cambia razonadamente el umbral, compara ordenaciones o añade un caso de prueba para un id inválido. Conserva el mínimo anterior para demostrar que la mejora no lo rompe. Puedes omitir esta ampliación y cerrar PM3 con la misma evidencia obligatoria.
