# Guía de PM3: empieza aquí

## Tu recorrido

Vas a mejorar una aplicación de tareas llamada **AulaFlow**. Al principio funciona, pero solo tiene una barra inferior, guarda algunos datos en una pantalla y necesita mejorar cómo abre el detalle. Al terminar se adaptará al espacio, compartirá el estado y explicará qué ocurre al pulsar cada control. Todo se hace con datos de demostración, sin cuentas ni conexión a servicios.

**Empieza por «Descarga y abre el proyecto», el siguiente capítulo de este libro.** Tu primer objetivo es ver la aplicación abierta; todavía no tienes que corregirla. Después responde Comprueba tu punto de partida (consulta en AULES).

El curso se recorre por cinco subsecciones:

1. **Empieza y prepara tu proyecto:** abre el proyecto y comprueba lo que ya sabes.
2. **Construye pantallas adaptables:** aprende con un ejemplo pequeño y realiza la práctica 1.
3. **Conecta pantallas y comparte datos:** aprende navegación y estado; aplícalos a AulaFlow.
4. **Comprueba y mejora tu aplicación:** realiza la práctica 2 y el cuestionario final.
5. **Prepara y envía tu entrega:** comprueba y envía el proyecto con sus evidencias.

La ruta completa ocupa **720 minutos**. No tienes que terminar un libro de teoría para empezar otro de ejercicios: cada explicación lleva su ejemplo y su práctica al lado. Las actividades que dicen **«Ahora prueba tú»** son entrenamiento; guarda el trabajo en el cuaderno, sin crear una entrega distinta por ejercicio.

### Cuándo trabajamos y cuándo entregas

Apertura: 18/10/2026. Entrega recomendada: 01/11/2026 23:59. Cierre de recepción: 02/11/2026 23:59. Talleres: 20 y 27/10/2026, 19:30–20:25; 45 min efectivos y alternativa autónoma. Zona horaria Europe/Madrid.

Las prácticas 1 y 2 duran **45 minutos efectivos cada una**. Puedes hacerlas en el taller o desde casa: son alternativas y producen la misma evidencia. La franja presencial incluye diez minutos de margen. La asistencia no desbloquea recursos exclusivos.

### El tiempo de cada parte

- Preparación y diagnóstico: **30 min**.
- Primeras explicaciones y ejercicios de pantalla: **80 min**.
- Adaptación y controles: **75 min**.
- Práctica 1, presencial o desde casa: **45 min**.
- Navegación: **90 min**.
- Estado compartido: **100 min**.
- Repositorio local y preparación del proyecto: **75 min**.
- Integración de AulaFlow: **110 min**.
- Revisión, autoevaluación y preparación de entrega: **70 min**.
- Práctica 2 y cambio individual: **45 min**.

Los tiempos son una distribución del trabajo, no diez entregas. La preparación de la entrega puede comenzar antes de la práctica 2; incorpora después su evidencia y envía el conjunto. Mantén tu copia del proyecto durante toda la unidad.

## Descarga y abre el proyecto

**Objetivo: abrir AulaFlow y recorrer sus tres pantallas.** El archivo necesario está en la descripción del libro, encima del capítulo: **AulaFlow UI Shell (ZIP)**. Descárgalo y descomprímelo. No trabajes dentro del archivo comprimido.

1. En VS Code o Android Studio, elige **Abrir carpeta**.
2. Abre `aulaflow_flutter_ui_shell`, la carpeta que contiene `pubspec.yaml`, `lib` y `test`. `pubspec.yaml` identifica el proyecto; `lib` contiene la aplicación y `test` sus pruebas iniciales.
3. Abre la terminal del editor. Comprueba que estás situado en esa carpeta.
4. Ejecuta `flutter --version` y `flutter devices`. Si el comando no existe o no hay un destino utilizable, ve a [Ayuda de ejecución](13_GUIA_INICIO_Y_AYUDA_PM3.md).

Si vas a usar Android y aún no existe la carpeta `android`, ejecuta una sola vez:

```bash
flutter create . --platforms=android --project-name aulaflow_flutter_ui_shell_starter
```

**Después de cada `flutter create`, también cuando añadas Web o Windows, revisa `test/widget_test.dart`.** Si sigue siendo el ejemplo de contador (referencias a `MyApp`, textos `0`/`1` e `Icons.add`), retira solo ese archivo desde el editor. Conserva `test/starter_smoke_test.dart` y las pruebas propias o adaptadas. El [README del starter](../Alumnado/Starter/aulaflow_flutter_ui_shell/README.md) explica cómo reconocerlo. Repite `flutter analyze` y `flutter test` antes de ejecutar la app.

El punto significa «en esta carpeta». El comando prepara los archivos de plataforma; conserva el código de `lib`. Después:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

`pub get` descarga las dependencias declaradas; `analyze` busca problemas de código; `test` ejecuta las pruebas suministradas; `run` abre la aplicación. Ejecuta un comando cada vez y espera su resultado. Si falla uno, conserva su primer error antes de continuar.

### Qué debes ver

La ventana muestra **AulaFlow UI starter** y los destinos **Tareas, Tablero y Ajustes**. En Tareas hay datos `DEMO-201`, `DEMO-202` y `DEMO-203`. Pulsa una tarea para abrir el detalle y vuelve atrás. Que todavía no haya menú lateral es parte del estado inicial, no un fallo de instalación.

Guarda en el cuaderno las versiones, el destino elegido y el resultado de los cuatro comandos. Conserva una copia llamada, por ejemplo, `aulaflow-inicial`; continúa trabajando en otra copia. El cuaderno está dentro de **Plantillas PM3 (ZIP)**, en los materiales comunes de este libro.

Continúa con «Prueba dos anchuras y el teclado». Al terminar la guía, responde el diagnóstico. Una respuesta incorrecta sirve para detectar qué tendrás que estudiar.

## Prueba dos anchuras y el teclado

En esta unidad «390» y «900» significan **píxeles lógicos de ancho**. Sirven para comparar una ventana estrecha y otra ancha; no son modelos concretos de teléfono.

### Prueba rápida en Chrome

Si no existe `web`, desde la carpeta del proyecto ejecuta:

```bash
flutter create . --platforms=web
```

**Después de cada `flutter create`, también cuando añadas Web o Windows, revisa `test/widget_test.dart`.** Si sigue siendo el ejemplo de contador (referencias a `MyApp`, textos `0`/`1` e `Icons.add`), retira solo ese archivo desde el editor. Conserva `test/starter_smoke_test.dart` y las pruebas propias o adaptadas. El [README del starter](../Alumnado/Starter/aulaflow_flutter_ui_shell/README.md) explica cómo reconocerlo. Repite `flutter analyze` y `flutter test` antes de ejecutar la app.

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

En Chrome abre las herramientas de desarrollo, activa la barra de dispositivos y escribe **390 × 800**. Observa la navegación. Cambia después a **900 × 700**. En el proyecto inicial puede seguir apareciendo la barra inferior: aprenderás a cambiarla.

No cambies el ancho de un widget para imitar estas pruebas: redimensiona la ventana o su zona de visualización. Anota qué tamaño probaste y qué ocurrió.

### Texto y acceso

En Android, abre Ajustes → Accesibilidad → Tamaño de visualización y texto y aumenta el tamaño de fuente. Vuelve a la aplicación: las acciones deben seguir disponibles. Registra el nivel real; no escribas «200 %» si el dispositivo no muestra ese porcentaje.

En un destino con teclado, usa **Tab**, **Mayús+Tab**, **Enter** y **Espacio**. Debes reconocer qué control tiene el foco. Comprueba también un diálogo: cancelar debe dejar los datos como estaban.

Guarda dos capturas de la aplicación, compacta y ancha, y una nota sobre texto ampliado y teclado. No incluyas cuentas ni rutas personales en las capturas.

## Ayuda de ejecución

Si un paso se bloquea, busca aquí **el primer síntoma**. Prueba una sola acción y vuelve a ejecutar el mismo caso. Tras quince minutos sin avanzar, pide ayuda con el comando, el primer mensaje, el resultado esperado y lo que has probado.

### No se reconoce flutter

Abre otra terminal y ejecuta `flutter --version`. Si tampoco funciona, revisa que la carpeta `bin` del SDK esté en PATH. Reinicia la terminal después de corregirlo. No reinstales el proyecto ni borres sus archivos para resolver un problema de PATH.

### No aparece un dispositivo

Ejecuta `flutter devices`. Para Android, abre Android Studio → Device Manager, inicia el emulador y espera a su pantalla de inicio antes de repetir el comando. Si el emulador no arranca, conserva el primer error y comprueba virtualización y memoria. Puedes usar Chrome temporalmente con el procedimiento del capítulo anterior.

### Falla pub get, analyze o test

Comprueba primero que la terminal está en la carpeta con `pubspec.yaml`. En `pub get`, conserva el bloque que empieza por `Because`. En `analyze`, lee el primer diagnóstico y su archivo/línea; no desactives todas las reglas. En `test`, anota el nombre de la prueba y la diferencia entre lo esperado y lo observado.

### La pantalla desborda

Vuelve a [Cómo repartir el espacio de una fila](14_PANTALLAS_APRENDE_PRACTICA_PM3.md). Reduce el caso al texto y sus vecinos. Un ancho fijo o un scroll horizontal añadido sin explicación pueden ocultar el síntoma sin resolverlo.

### La ruta o el estado no funcionan

Para una ruta, vuelve a [Abre un detalle por su identificador](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md). Para un filtro que no se conserva, vuelve a [Una decisión compartida entre pantallas](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md). Comprueba que lees y modificas la misma instancia antes de añadir otra variable.

### No aparece el diálogo o el mensaje

Vuelve a [Confirma una acción y explica su resultado](15_NAVEGACION_ESTADO_APRENDE_PRACTICA_PM3.md). Comprueba el contexto utilizado, el resultado de cancelar/aceptar y `context.mounted` después de un `await`.

Si el entorno sigue bloqueado, registra **PENDIENTE_ENTORNO** con el primer error. Puedes avanzar en predicción y lectura, pero no presentes una ejecución ajena como propia. Acuerda con el profesor cómo completar la comprobación pendiente. No publiques contraseñas, correos ni datos de otros alumnos.

## Palabras que encontrarás

- **Interfaz o UI:** lo que la persona ve y utiliza en la aplicación.
- **Widget:** una descripción de una parte de esa interfaz.
- **Estado:** datos que determinan lo que muestra la aplicación en un momento dado.
- **Estado de una funcionalidad:** datos que comparten varias pantallas, como el filtro de tareas.
- **Barra inferior / NavigationBar:** destinos principales en una ventana estrecha.
- **Menú lateral / NavigationRail:** otra representación de esos mismos destinos cuando hay espacio.
- **View:** widgets que presentan datos y reciben acciones.
- **ViewModel:** objeto que conserva el estado de una funcionalidad y ofrece operaciones para cambiarlo.
- **Repositorio:** objeto que permite obtener o modificar datos sin que la pantalla conozca dónde se guardan.
- **Inyección por constructor:** recibir una dependencia al crear el objeto, en lugar de construirla dentro.
- **Fake:** una implementación pequeña de prueba que permite provocar una situación, como un error.
- **Punto de partida comprobado:** copia que sabes ejecutar y a la que puedes volver si un cambio falla.

Usa los nombres técnicos para identificar las clases, pero explica tus decisiones con tus palabras. No tienes que memorizar este glosario antes de empezar.

## Qué conservar y cómo terminar

El entrenamiento se guarda en tu cuaderno. La entrega reúne **tu aplicación, las decisiones, el registro de comprobaciones y el cambio individual**. No hay una entrega por cada ejemplo o ejercicio.

El cambio individual dura **23 minutos sin agente** y forma parte de la práctica 2 de 45 minutos. Si asistes, puede observarse en directo. Desde casa recibirás la variación por AULES y conservarás predicción, cambio, ejecución y explicación. La asistencia no cambia el criterio.

Antes de enviar, completa Comprueba lo que has aprendido (consulta en AULES) y revisa Entrega tu aplicación y sus evidencias (consulta en AULES). Allí encontrarás la lista única de archivos y comprobaciones. Después de guardar el envío, ábrelo y conserva el justificante.
