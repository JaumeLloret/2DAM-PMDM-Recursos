# Teoría autosuficiente · Construir y verificar un juego móvil 3D

## 1. Diseñar un bucle que pueda terminarse

Un juego pequeño necesita objetivo, acciones, restricciones, feedback y final. Balizas del muelle limita el mundo a un recinto: tres esferas, dos peligros y una zona de entrega. El jugador mueve un personaje, recoge objetos únicos, conserva tres vidas y dispone de 60 segundos. La victoria necesita los tres IDs y entrada al muelle; recogerlos sin entregar todavía no gana. La derrota ocurre por tiempo o vidas, con una causa visible.

Escribe primero reglas que distingan situaciones: tocar dos veces la misma esfera no aumenta progreso; llegar antes al muelle no gana; una entrada tras victoria no reabre la ronda; reiniciar restablece todo. Estos ejemplos guían implementación y pruebas. No añadas enemigos complejos, red, inventario persistente o arte nuevo para parecer más completo. El alcance debe caber en 720 min y dejar tiempo para Android, medición y documentación.

G01 no es una novela de diseño. Incluye objetivo, controles, estados, condiciones, distribución y casos de prueba. Los IDs CELL-A/B/C son identidades técnicas del juego original, sin relación con catálogo contractual o AulaTokens. No se fuerza el dominio AulaFlow ni una aceptación de PI dentro de la práctica de juegos.

## 2. Separar reglas, escena y presentación

rules.gd guarda datos y decisiones de ronda en un RefCounted: fase, tiempo, vidas y conjunto de recogidas. main.gd coordina nodos/eventos y convierte resultados en UI/sonido. player.gd mueve el CharacterBody3D. pickup.gd anima un objeto y expone identidad. tone.gd prepara audio. Las escenas y materiales guardan estructura/apariencia. Esta separación permite comprobar reglas sin depender de una colisión física y después verificar la integración real del motor.

Una señal del área no debería sumar progreso por su cuenta y además pedir al controlador que lo sume: produciría doble conteo. El controlador consulta la regla y solo si acepta oculta/desactiva el objeto. La UI lee el estado resultante, no mantiene otro contador independiente. Una fuente de verdad reduce desajustes como mostrar 3/3 cuando el conjunto contiene dos IDs.

GDScript usa funciones, condiciones, arrays/diccionarios y tipos del motor. Un enum nombra estados y evita números sin significado. Un Dictionary usado como conjunto relaciona ID con presencia. La regla pregunta si el ID está permitido y si ya existe antes de añadirlo. El detalle de representación debe poder explicarse y modificarse en la defensa individual.

## 3. Máquina de estados y transiciones

READY muestra preparación; PLAY permite movimiento, tiempo y eventos; PAUSED conserva la ronda; WON y LOST son terminales hasta reiniciar. start establece los datos iniciales. toggle_pause solo alterna PLAY/PAUSED. tick ignora pausa y deltas negativos, resta tiempo y lo limita a cero. Las operaciones de recogida, daño y entrega comprueban fase antes de cambiar datos.

La pausa necesita coherencia entre reglas y simulación. Esta implementación mantiene estado local: desactiva movimiento del personaje y animación/avance de objetos cuando no está PLAY, mientras la UI sigue disponible. No basta con congelar una etiqueta del cronómetro. Al perder foco, se pausa y se liberan acciones para evitar un movimiento retenido al volver. Reanudar no debe fabricar una entrada o borrar progreso.

Los finales deben ser estables. Si tick se ejecuta después de WON no debe transformar victoria en derrota por tiempo. Si se toca una baliza después de LOST no debe avanzar. Si un evento puede llegar más de una vez, sus guardas hacen la operación idempotente: repetirlo no produce un segundo efecto. Es una propiedad del comportamiento, no un requisito de contar tests.

## 4. Crear objetos e instancias con identidad

Una escena pickup.tscn combina Area3D, malla y forma. El starter instancia CellA; crea B y C a partir de esa escena, asigna sus IDs y posiciones y comprueba que no son tres copias con el mismo identificador. La geometría compartida no implica identidad compartida. Un recurso SphereMesh puede reutilizarse; la posición y pickup_id pertenecen a cada instancia.

La distribución de referencia usa A (-4,0.9,-3), B (3,0.9,-4), C (4,0.9,3), personaje inicial (-4,0.7,4) y muelle (0,0.75,4.5). Las coordenadas permiten reproducir el recorrido sin depender de una imagen. Los conos están en (0,0.6,0) y (2,0.6,2). Mantén margen respecto a paredes y comprueba que el camino sea practicable.

Crear un objeto incluye definir tipo, forma, apariencia, identidad y relación de eventos. Una malla sin forma puede verse pero no detectarse; una forma enorme puede recoger a distancia no prevista. Usa el inspector y una ejecución de prueba para contrastar lo que construyes. G02 registra qué creaste y por qué, no solo el resultado de abrir un starter ajeno.

## 5. Materiales y recursos con intención

Un StandardMaterial3D define color y respuesta a luz, entre otras propiedades. La solución usa materiales separados para suelo, personaje, baliza, peligro y muelle. Cambiar una superficie no debe recolorear accidentalmente todo el nivel. Crea o duplica el recurso adecuado, asigna roughness y comprueba sus usuarios. No confundas apariencia de rugosidad con fricción física.

Las formas también transmiten significado: esferas recogibles, conos peligrosos y muelle señalado. El HUD verbaliza objetivo/resultado; no se depende únicamente de rojo/verde. Los iconos táctiles SVG son originales y tienen flechas de alto contraste. El tono no es imprescindible para entender qué ocurrió. Esta redundancia ayuda a usar el juego con sonido apagado o dificultad para distinguir colores.

No se requieren texturas descargadas ni modelos externos. Si amplías con un asset, registra autor, fuente y licencia antes de incluirlo. La licencia MIT del motor y sus componentes no elimina las obligaciones de otros recursos. Conserva LICENSES.md y avisos cuando distribuyas un runtime. No uses imágenes de personas o datos reales para decorar la práctica.

## 6. Movimiento, gravedad y colisión

CharacterBody3D recibe una velocidad calculada por script y move_and_slide aplica el desplazamiento con respuesta a colisiones. No es un RigidBody3D que caiga por gravedad automáticamente. El script resta gravedad a velocity.y mientras no está en suelo; cuando lo está, controla la componente vertical. Horizontalmente convierte input 2D a XZ y limita longitud a uno para que la diagonal no sea más rápida.

La velocidad se expresa por segundo. move_and_slide utiliza la velocidad del cuerpo y el paso físico; no multipliques de nuevo todas sus componentes por delta al pasarlas como si fueran un desplazamiento. Sí se multiplica la aceleración gravitatoria por delta para actualizar velocidad. Confundir ambas magnitudes hace que el personaje avance demasiado poco o dependa del framerate.

El suelo y paredes usan cuerpos estáticos en capa 1; el personaje está en capa 2 y consulta capa 1. Balizas/peligros/muelle son áreas que consultan capa 2. Los conos detectan daño, no son paredes que empujen al personaje. La inmunidad de 1.2 s limita daño repetido; al recibir un impacto aceptado, se regresa a una posición segura. G04 explica estas decisiones y prueba colisión real del motor, sin llamar hardware físico a una simulación.

## 7. Input móvil y pérdida de foco

Las acciones move_left/right/up/down abstraen teclas y botones. El teclado usa WASD/flechas; TouchScreenButton asigna la misma acción al tacto y admite varias pulsaciones táctiles. Se colocan en un grupo Node2D cuya posición se recalcula con el tamaño del viewport; estos nodos no tienen las anclas de Control. Los menús sí usan Button y contenedores de UI.

El proyecto permite ensayo con puntero mediante emulación táctil, pero eso no demuestra funcionamiento en un teléfono real. Comprueba pulsación, liberación, deslizamiento fuera del área, dos direcciones, pausa y retorno de foco en el destino. El código libera acciones al pausar/reiniciar; si detectas un movimiento retenido, reproduce el evento y corrige antes de declarar QA superada.

No necesitas permisos de cámara, ubicación, micrófono o contactos. La app no usa red ni cuentas. Una exportación debug puede requerir herramientas del entorno, pero no autoriza a publicar identificadores de dispositivo. Usa etiquetas saneadas del equipo y guarda el serial solo en la terminal local cuando sea necesario para instalar.

## 8. Cámara, iluminación y HUD

La cámara ortogonal de referencia encuadra el recinto; su posición y orientación se fijan para ver objetos y rutas. La luz direccional y ambiente permiten leer volúmenes. Ajusta un parámetro cada vez: tamaño de cámara, ángulo o intensidad; explica qué mejora y qué puede ocultar. Una cámara bonita que esconde el objetivo no cumple el propósito.

HUD muestra fase, progreso, vidas, tiempo y mensajes. Los botones Iniciar/reiniciar, Pausa/Continuar y Silenciar mantienen acciones disponibles según fase. Los controles táctiles quedan separados de los botones de menú y se adaptan al viewport. Comprueba superposición, tamaño de texto y zonas seguras en paisaje; no asumas que una captura 960×540 cubre todos los teléfonos.

El jugador necesita distinguir pausa de derrota y conocer por qué terminó la ronda. Los textos se derivan del estado y reason, con feedback de eventos. No muestres nombres de tests, CE, IDs contractuales o detalles de CI dentro del flujo del juego: esa información pertenece al dossier técnico, no ayuda a jugar.

## 9. Audio por eventos

tone.gd genera ondas cortas con frecuencias diferenciadas y una envolvente que reduce amplitud al final. AudioStreamWAV almacena muestras; AudioStreamPlayer las reproduce. El starter prepara collect; completa hit, win y lose según eventos reales. No reproduzcas victoria en cada frame mientras el estado sea WON: debe dispararse al entrar al estado o al aceptar la transición.

El control de silencio detiene reproducción y evita nuevos tonos mientras está activo. Los mensajes/contadores conservan el significado. Preparar un AudioStreamWAV o llamar play en un test headless no equivale a escuchar el audio. G05 registra tipo de evidencia y QA auditiva pendiente hasta probar volumen, distorsión y adecuación en entorno real.

Los tonos del material son originales, sin grabaciones externas. Si cambias duración/frecuencia, explica el motivo y comprueba el resultado escuchado cuando sea posible; no atribuyas una calidad perceptiva a un gráfico de datos sin audición.

## 10. Pruebas y depuración proporcionales

Primero prueba reglas: recogida duplicada, ID desconocido, entrega prematura, pausa, tiempo cero, inmunidad y reinicio. Después integra escena: áreas detectan al personaje, pared bloquea movimiento, tres balizas permiten entregar, peligro modifica vidas y reubica. Finalmente recorre la UI/Android y observa lo que un test sin pantalla no ve.

Un test de reglas puede construir Rules sin escena; un test del motor carga PackedScene y espera frames de física. Ambos son ejecuciones reales de software con alcances distintos. Los tests docentes se reservan para validar material; el alumno crea sus propias comprobaciones y puede usar el smoke público para confirmar arranque. Un smoke no acepta el juego incompleto.

Cuando falle, conserva entrada, corte, esperado y observado. Reproduce una sola causa, corrige y añade regresión; no elimines la aserción para volver al verde. Inspecciona también el diff: una regla correcta con una escena que repite IDs seguirá fallando en integración. No se califica por cantidad de tests, cobertura, commits o líneas.

## 11. Profiling y optimización con comparación

Medir exige condiciones comparables: mismo equipo, versión, resolución, renderer, modo, recorrido y duración. Registra una base, identifica un coste y cambia una variable. Una opción acotada es comparar sombras de la luz direccional activadas/desactivadas, o repetición de reinicio y número de nodos. La mejora debe mantener legibilidad y comportamiento; no bajar calidad indiscriminadamente para anunciar más FPS.

Usa profiler/monitores del editor según entorno y captura datos saneados del recorrido. Repite para reducir el efecto de arranque/carga; distingue un pico de una tendencia. Un contador estable de nodos tras reinicio no demuestra ausencia de toda fuga de memoria, solo que no se acumulan esos nodos en el ensayo. Una tasa de frames de CI software no representa el móvil del alumnado.

En Clasificador orbital se limita a cuatro objetos simultáneos y se eliminan tras captura/salida; esa política evita crecimiento indefinido. En Balizas se reutilizan tres instancias al reiniciar. G07 explica la hipótesis, evidencia, cambio y límite; no inventa números para completar una tabla.

## 12. Android, documentación y defensa

Exportar requiere preset Android, templates exactos 4.7.2, JDK/SDK configurados y firma debug de entrenamiento. Un PCK no es por sí solo un APK instalable. Conserva versión y hash del artefacto; instalarlo y recorrerlo en un dispositivo autorizado aporta otra evidencia. La campaña no publica tienda ni usa claves de release. RA5.h exige implantación observada, no se deduce de un build verde.

G06 registra entorno, comando/preset, resultado, hash, instalación y recorrido o estados pendientes. G08 documenta diseño/desarrollo, estructura, cambios, pruebas, licencias, pasos de ejecución y límites. En I3 debes predecir, modificar una condición nueva sin ayuda generativa y ejecutar una comprobación, explicando el diff.

El juego final es completo dentro de su alcance, con QA honesta. Si falta hardware, el docente proporciona oportunidad y conserva el estado pendiente; no se fabrica una observación. El resultado técnico no concede aceptación contractual, AulaTokens o puertas del proyecto PI. PM9 concluye su propia experiencia y deja materiales listos para auditoría docente global.
