# Ejemplos reproducibles · PM9

Usa Godot 4.7.2 y una copia de trabajo. `godot` representa el ejecutable fijado disponible en tu PATH; en otro sistema sustituye ese nombre por su ruta/nombre exacto. Conserva tu corte y resultado; una predicción o salida modelo no es ejecución propia.

## 1. Comprobar una regla sin escena

Ejecuta el smoke público: `godot --headless --path . --script tests/smoke.gd`. Debe confirmar READY, start y pausa, no la aceptación del juego. Abre ese script: crea Rules, inicia, guarda tiempo, pausa, llama tick y comprueba que el tiempo se conserva. Añade en tu copia un caso de timeout: reinicia, aplica un delta mayor que duración y espera LOST con tiempo cero. Ejecuta de nuevo y registra el resultado real.

Explicación: la regla no necesita imagen ni colisión para discriminar pausa/tiempo. Eso no valida el movimiento del personaje ni el APK. Si una aserción falla, conserva entrada/esperado/corte y corrige la regla; no borres la aserción. Error frecuente: avanzar tick después de WON y cambiar el final; añade un caso terminal cuando implementes victoria.

## 2. Crear una instancia que sea otro objeto

Abre main.tscn. El starter contiene Pickups/CellA, instancia de pickup.tscn. Crea otra instancia bajo Pickups, nómbrala CellB, asigna pickup_id CELL-B y posición (3,0.9,-4). Conserva la escena base y cambia propiedades de la instancia. Ejecuta después de implementar recogida; tocar A y B debe registrar dos IDs, no dos señales del mismo ID.

Resultado esperado: geometría compartida, identidades y transformaciones distintas. Si duplicas y olvidas el ID, las reglas evitan doble conteo y el juego no podrá reunir tres identidades. El fallo es de configuración de escena, no motivo para retirar la guarda de duplicados. Documenta esa diferencia en G02/G07. Repite con C siguiendo el laboratorio, sin añadir una cuarta baliza fuera de alcance.

## 3. Velocidad, diagonal y pared

En player.gd localiza input, conversión XZ, limit_length y move_and_slide. Predice qué pasaría si un vector (1,1) no se limitara: su longitud sería mayor que uno y podría aumentar la velocidad diagonal. El código utiliza Input.get_vector y limita la dirección, conservando una velocidad máxima. En una copia, compara recorrido recto/diagonal con mismas condiciones sin afirmar precisión física desde pulsaciones manuales.

Después mantén movimiento hacia una pared: debe bloquear el avance del CharacterBody3D. Comprueba forma, capas y máscaras. Si atraviesa, no “arregles” el dibujo del muro: revisa componente físico. El test del motor puede aplicar acciones y esperar pasos de física; es simulación ejecutada, no observación del tacto de un móvil.

## 4. Audio una vez por evento

El starter genera un tono collect. Abre tone.gd, identifica frecuencia, número de muestras y envolvente. Añade hit, win y lose a la preparación, conservando volumen moderado y tipos adecuados. Los puntos de llamada están ligados a transiciones/acciones aceptadas; verifica que no se reproduce win en cada frame.

Prueba silencio: cambiar muted impide reproducir y detiene un tono activo, pero no modifica vidas ni progreso. En entorno con audio, escucha eventos y registra si son distinguibles y apropiados; si solo ejecutas headless, anota recurso generado/llamada y PENDIENTE_AUDIO_REAL. Texto y contador deben seguir informando sin sonido.

## 5. Preparar un APK sin confundirlo con instalación

Comprueba Godot/templates 4.7.2 y rutas JDK/SDK. Abre preset Android de entrenamiento y confirma identificador propio de la app, arquitecturas y exclusión de tests/QA. Exporta debug a una carpeta de salida externa a las fuentes: `godot --headless --path . --export-debug Android <RUTA_SALIDA_APK>`, con entorno previamente configurado. Registra comando, versión, resultado y hash.

Si falta firma debug o SDK, consulta el diagnóstico y configura el entorno conforme a la guía; no copies claves de release. Un APK válido aún necesita instalación y recorrido en dispositivo autorizado. Si la firma de una instalación de entrenamiento previa difiere, acuerda sustituir únicamente esa app propia, sabiendo que desinstalar borra sus datos locales; esta práctica no guarda información real. Nunca borrar otras apps para resolver el conflicto.

## 6. Comparación de optimización acotada

Elige sombras de Sun activadas frente a desactivadas. Fija equipo, modo, resolución, renderer, ruta y duración. Calienta el proyecto y realiza tres recorridos comparables por variante; registra valores observados de tiempo de frame/monitor y lectura visual. Cambia solo sombras. Concluye si la diferencia es consistente y si conserva legibilidad; si no hay diferencia clara, dilo.

Otra opción focal es repetir reinicio doce veces y observar número de nodos/recursos. Un recuento estable demuestra solo ausencia de acumulación de esos nodos en ese ensayo. No garantiza ausencia de toda fuga, ni rendimiento de hardware no probado. G07 conserva base, cambio, evidencia y límite; no necesita una mejora inventada para ser válido.
