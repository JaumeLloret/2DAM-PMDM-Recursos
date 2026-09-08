# Teoría autosuficiente · Arquitectura y selección de motores

## 1. Motor, editor, runtime y proyecto

Un motor ofrece servicios reutilizables para ejecutar un juego: representación, entrada, físicas, audio, recursos y ciclo de actualización. El editor permite construir y revisar el proyecto mediante escenas, propiedades y herramientas. El runtime es la parte que ejecuta el producto exportado; no necesita mostrar las herramientas del editor. El proyecto reúne escenas, scripts, recursos y configuración. Un archivo de script no es por sí solo todo el juego.

En Godot importas project.godot, que fija la escena principal y el renderer. El panel de escenas muestra jerarquía; el sistema de archivos muestra recursos; el inspector muestra propiedades; la vista 2D/3D permite inspección espacial; salida/depurador muestran mensajes y fallos. Cambiar un archivo en el editor no demuestra que el runtime exportado se comporte igual en un móvil. La exportación es un paso con requisitos propios.

Una herramienta headless ejecuta el motor sin ventana gráfica. Puede cargar escenas, scripts y simulación; sirve para ciertas verificaciones reproducibles. No observa legibilidad, render de una GPU, sonido escuchado ni interacción táctil real. En tu dossier separa esos niveles de evidencia.

## 2. Nodos, escenas e instancias

Un nodo tiene identidad, propiedades y posición en el árbol; puede representar una función especializada. Una escena guarda un árbol con una raíz. Instanciar una escena crea objetos que pueden vivir dentro de otra; la composición evita copiar una estructura completa a mano. El árbol lógico explica pertenencia y ciclo de vida: si eliminas un padre, sus hijos forman parte de ese conjunto.

Motor Lab 3D tiene Platform, Pivot/Probe, SampleBody, Sensor, Camera, Sun y HUD. Platform es un cuerpo estático con visual y forma; Probe es solo visual; SampleBody combina cuerpo dinámico, malla y forma; Sensor detecta entrada sin convertirse en suelo. Identificar nombre y tipo es el inicio; lo relevante es explicar qué responsabilidad cumple y cómo se conecta con otras.

En el minijuego existente SignalGame, Rows contiene controles y etiquetas, mientras Tone es un reproductor de audio. El árbol no dice por sí solo la regla A-B-A: esa lógica está en el script. Para analizar un juego necesitas estructura y comportamiento, no una captura de la lista de nodos sin explicación.

## 3. Recursos y dependencias

Un recurso almacena datos reutilizables: malla, material, forma, audio o escena empaquetada. Dos nodos pueden referenciar el mismo recurso. En Motor Lab Probe y ProbeCopy comparten copper.tres. Cambiar roughness en ese archivo afecta a ambos usuarios de la referencia; cambiar position de Probe afecta solo a esa instancia espacial. Esa diferencia explica por qué un cambio visual se propaga aunque no hayas seleccionado el otro nodo.

Una dependencia se representa como “escena usa script/material/forma”. No es lo mismo que el parentesco “Pivot contiene Probe”. Dibuja ambos mapas con etiquetas distintas. Una ruta rota a copper.tres puede impedir cargar el material; mover Pivot no cambia la ruta del recurso. Antes de renombrar archivos revisa referencias y usa operaciones del editor que mantengan la coherencia.

Para experimentar con un material independiente necesitas una copia propia del recurso o hacerlo único en el editor, y registrar esa decisión. No dupliques todo el proyecto para cambiar una propiedad de una superficie. En PM8 basta comprender y contrastar una dependencia compartida; PM9 aplicará materiales al juego propio.

## 4. Representación lógica y espacial

La relación padre/hijo es lógica; la transformación compone posición, rotación y escala. Un hijo tiene coordenadas locales respecto al padre y coordenadas globales en el mundo. Con solo traslaciones, global = traslación del padre + local; si hay giro o escala, primero transforma el vector local y después suma la traslación. No sumes ángulos y posiciones como si fueran la misma magnitud.

En 3D de Motor Lab, Pivot está en (2,0,0) y Probe local en (1,1,0): sin giro, global (3,1,0). Al girar Pivot +90° sobre Y, el vector local (1,1,0) pasa a (0,1,-1); global (2,1,-1). Probe mantiene su posición local. Godot 3D usa Y hacia arriba; la dirección frontal convencional de cámaras es -Z. El signo importa: no lo deduzcas de cómo parece la perspectiva.

En 2D del laboratorio, Pivot (600,200) y Probe local (80,0) dan global (680,200). La pantalla 2D habitual tiene Y creciente hacia abajo. Una rotación cambia la dirección del desplazamiento; una escala del padre cambia distancias heredadas. Estos cálculos sirven como predicción y se contrastan con valores reales, no solo con un dibujo aproximado.

La cámara cambia el punto de vista; no necesariamente mueve los objetos. En un visor 3D la cámara es hija de Orbit y la maqueta es hermana de Orbit: girar Orbit cambia la vista y deja fija la maqueta. Si metieras la maqueta bajo Orbit también giraría; esa sería otra arquitectura y debe justificarse.

## 5. Visual, física y detección

Una malla o polígono dibuja; una forma de colisión define volumen para física. Tener aspecto sólido no produce colisión automáticamente. Un cuerpo estático sirve como entorno inmóvil; un cuerpo rígido responde a simulación; un área detecta solapamientos. En Motor Lab la bola cae por simulación, el suelo la sostiene y Sensor avisa de su entrada. El sensor no sustituye al suelo.

Las capas indican pertenencia y las máscaras qué capas se consultan. El laboratorio 3D usa suelo en capa 1, cuerpo en capa 2 y sensor que detecta capa 2. Si cambias la máscara del sensor, puedes perder la señal sin alterar la caída. Es una prueba discriminante: separar contacto físico de notificación. No concluyas “la física no funciona” solo porque el contador no cambia.

El cuerpo 2D y el cuerpo 3D pertenecen a sistemas distintos. Una CollisionShape2D no colisiona con un RigidBody3D aunque coincidan visualmente en pantalla. Analizar 2D y 3D requiere distinguir espacio, tipos y servicios, no cambiar únicamente el aspecto del asset.

## 6. Ciclo, entrada y señales

El motor llama funciones durante la vida de los nodos. _ready prepara conexiones cuando el nodo está en el árbol; _process recibe delta para actualización por frame; la física sigue su paso propio. Multiplicar una velocidad de giro por delta evita depender directamente del número de frames. No significa que cualquier simulación sea idéntica entre equipos o que puedas medir rendimiento desde un test sin pantalla.

Una señal comunica un evento: pressed indica activación de botón; body_entered indica detección de cuerpo. El receptor decide qué hacer. En el laboratorio, un botón alterna rotating y _process gira el padre mientras esa variable está activa. Sensor incrementa una observación al entrar SampleBody. Dibuja evento→receptor→cambio de estado para explicar comportamiento.

Entrada de teclado, puntero y táctil debe tener una respuesta clara. El minijuego permite botones visibles A/B y teclas A/B; los estados terminales deshabilitan acciones y el script ignora entradas fuera de juego. Esa doble defensa mantiene coherencia entre UI y regla. No se evalúa aún diseñar un sistema de input propio: se identifica el existente y se predice su efecto.

## 7. Bloques funcionales de un juego existente

Secuencia de señales ya está terminado dentro del proyecto. Una ronda empieza al pulsar Iniciar, exige A-B-A y termina por éxito, error o agotamiento de diez segundos. Sus bloques son entrada, estado de ronda, regla de secuencia, tiempo, presentación, audio y reinicio. _update_view convierte estado en texto/controles; choose valida la siguiente entrada; _process descuenta tiempo solo durante PLAY.

READY no consume ronda; PLAY acepta entradas; WON y LOST son terminales hasta reiniciar. Después de ganar, otra tecla no puede añadir puntos ni acceder fuera del array. El contador step avanza solo tras una entrada correcta. La regla de timeout no depende de que el usuario pulse un botón. Son decisiones observables que permiten analizar un ciclo de juego pequeño sin construirlo desde cero.

El tono se sintetiza y reproduce tras acierto. No es la única señal: texto y contador conservan información sin audio. En headless puede comprobarse la existencia del recurso y el cambio de estado, pero escuchar y ajustar volumen requiere QA real. En tu mapa de bloques indica qué servicios ofrece el motor y qué lógica específica escribió el autor del proyecto.

## 8. Cámara, luz, material y renderer

La cámara determina proyección y encuadre; la luz influye en superficies iluminadas; el material describe apariencia; la geometría define forma. Si un objeto parece oscuro, revisa esas relaciones antes de cambiar al azar el color. Roughness describe dispersión de reflejo en el material, no rugosidad de la forma de colisión. La apariencia final depende también de iluminación y renderer: no prometas un efecto visual idéntico sin observar el equipo.

El proyecto fija Compatibility para un laboratorio sencillo y equipos diversos. Es una elección proporcional, no una afirmación de que sea el mejor renderer para cualquier juego. PM9 verificará su juego móvil con ese entorno y registrará límites. Sombras, luces, resolución y complejidad de escena afectan coste; PM8 identifica estas variables, sin exigir un estudio de optimización completo.

Distingue render de simulación: una prueba puede confirmar coordenadas aunque no haya GPU renderizando la imagen. Un screenshot muestra un encuadre, pero no demuestra una tasa sostenida de frames. Describe siempre qué se observó, con qué condición y qué queda fuera de la conclusión.

## 9. Seleccionar con criterios y evidencia

La decisión docente fija Godot principal; tu análisis explica ajuste, límites y riesgos. Compara editor/entorno, modelo de composición, lenguaje, 2D/3D, física/audio/entrada, destino Android, licencia y mantenimiento. Cada fila necesita fuente o experimento y una conclusión limitada. No inventes puntuaciones de rendimiento para Unity si no lo has ejecutado.

Como comparación secundaria, Unity 6.3 LTS es una referencia documental vigente en su política oficial consultada; no se instala ni prueba en esta unidad. Su modelo GameObject/componentes y Godot nodos/escenas ofrecen maneras de componer comportamiento. La comparación útil es cómo representarías un bloque del laboratorio y qué herramientas/requisitos implica, no qué marca te gusta más.

Una matriz de decisión puede usar “cumple documentado”, “observado en el equipo”, “pendiente” y “limitación”. No hace falta un promedio numérico arbitrario. Si Android requiere SDK/templates/JDK, esa dependencia influye en la planificación de PM9 aunque el editor ya funcione. Si falta equipo, registra la alternativa docente; no declare incompatibilidad universal desde un fallo local.

## 10. Versión, licencia, exportación y transferencia

Fijar una versión exacta permite repetir el laboratorio. El archivo oficial de Godot 4.7.2 ofrece ediciones estándar para Windows, Linux y macOS y templates de exportación. La campaña usa GDScript estándar, sin requerir .NET. Un proyecto abierto con una versión de desarrollo más nueva puede cambiar archivos; conserva baseline y no migres automáticamente antes de comprobar compatibilidad.

Godot tiene licencia MIT; sus avisos y los de componentes deben conservarse al distribuir binarios según las fuentes oficiales. Los materiales originales y los assets externos tienen su propia procedencia. Este laboratorio usa primitivas, polígonos y tono sintetizado, sin assets de pago. No supongas que cualquier recurso encontrado en internet es reutilizable.

Android requiere herramientas y templates compatibles con la versión; empaquetar produce un artefacto, instalar y observarlo es otra evidencia. En PM8 documentas el camino y la viabilidad. PM9 realizará el juego y su implantación cuando el entorno lo permita, manteniendo QA física explícita. El handoff de Motor Lab entrega mapa, decisión, versión, límites y experimentos; no una aceptación de AulaFlow ni un juego nuevo terminado.
