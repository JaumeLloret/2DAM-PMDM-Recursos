# Ejemplos guiados · Construye, comprueba y explica

## Antes de empezar · De Dart o Java a GDScript

Estos ejemplos se realizan **dentro de los bloques de la ruta**, sobre tu copia de `PM9_STARTER.zip`. Empieza por este apartado y el ejemplo 1 durante A02–A03; continúa con el resto cuando lo indique la ruta. No son siete entregas nuevas. Conserva las comprobaciones en el mismo dossier.

Ya conoces variables, métodos, condiciones y objetos de Java o Dart. GDScript utiliza esas ideas con otra sintaxis: los bloques se delimitan por **sangría**, una función empieza por `func` y un archivo `.gd` define una clase. No necesitas aprender Python. Usa una sangría uniforme; el editor de Godot la mantiene al pulsar Tab.

| En el proyecto | Qué significa | Dónde lo ves |
|---|---|---|
| `extends RefCounted` | Clase de datos con referencias; sus instancias se crean con `.new()` | `scripts/rules.gd`; no es un nodo de la escena |
| `extends Node3D` | Nodo con posición, rotación y escala 3D | `scripts/main.gd` |
| `var lives: int = 3` | Variable entera con valor inicial | Estado de la ronda |
| `func hit() -> bool:` | Método que devuelve verdadero o falso | Una operación acepta o rechaza el evento |
| `enum Phase { READY, PLAY, PAUSED, WON, LOST }` | Nombres para estados de la ronda | `Rules.Phase.PLAY` |
| `preload("res://scripts/rules.gd")` | Carga el script desde la raíz del proyecto | `res://` es la carpeta de `project.godot` |
| `@export var pickup_id: String` | Propiedad editable por instancia en el Inspector | Cada baliza tiene su propia identidad |
| `$Pickups` | Acceso al nodo hijo `Pickups` del nodo de este script | Abre `main.tscn` para contrastar la ruta |

**Qué ejecuta el motor.** `_ready()` se llama al quedar listo el nodo; ahí se conectan señales. `_process(delta)` se llama por fotograma y `delta` expresa segundos transcurridos. `_physics_process(delta)` sigue los pasos de física. `body_entered` es una señal de un área cuando entra un cuerpo; `.connect()` indica qué función la atenderá. El controlador conecta la señal una vez y pregunta a la regla antes de cambiar la escena.

Abre `scripts/main.gd` y localiza `cell.body_entered.connect(_on_pickup.bind(cell))`. El motor aporta `body`; `bind(cell)` añade la baliza concreta como último argumento. Así `_on_pickup(body, cell)` sabe qué cuerpo entró y qué instancia produjo el aviso. El método consulta `rules.collect(cell.pickup_id)`: el `bool` devuelto decide si ocultar la baliza y actualizar el mensaje. No sumes otro contador en el HUD.

**Cómo ejecutar los comandos.** Sitúa la terminal en la carpeta que contiene `project.godot`. En los ejemplos, `godot` significa el ejecutable de Godot 4.7.2 Standard de tu equipo. Si no está en PATH, usa su ruta completa. En PowerShell una ruta entre comillas se ejecuta anteponiendo `&`, por ejemplo `& "C:\Herramientas\Godot\Godot_v4.7.2-stable_win64.exe" --version`. En Linux puedes usar `"/ruta/Godot_v4.7.2-stable_linux.x86_64" --version`; en macOS, el ejecutable está dentro de `Godot.app/Contents/MacOS/Godot`. Sustituye las rutas de ejemplo por las tuyas.

Ejecutar con `--headless` significa hacerlo **sin ventana**. Sirve para aislar lógica y pruebas; F5 sirve para observar el juego. La primera línea de salida identifica el motor. Un error de sangría, una ruta inexistente o un nombre con mayúsculas distintas son fallos de preparación: corrige el primer error de Salida antes de seguir. En G01 anota la versión y tu primera explicación del recorrido señal → regla → escena → HUD.

## 1. Comprobar una regla sin escena

**Objetivo (A03).** Aprender a ejecutar un caso, distinguir resultado esperado de resultado obtenido y entender la secuencia **comprobar → cambiar estado → devolver resultado**. Primero ejecuta la prueba de arranque suministrada:

```text
godot --headless --path . --script tests/smoke.gd
```

La salida esperada contiene `PASS_SMOKE: baseline only, not game acceptance`. Solo comprueba estado inicial, inicio y pausa. **Todavía no comprueba los TODO de recogida, daño y victoria.**

### Un ejemplo completo pequeño para entender las guardas

Crea `tests/demo_guardas.gd` en tu copia y escribe este programa. Representa una entrada que acepta una sola vez dos pases conocidos; no sustituye las reglas del juego. Predice qué llamadas devolverán `true` antes de ejecutarlo.

```gdscript
extends SceneTree

class Entrada:
    extends RefCounted
    var abierta: bool = false
    var vistos: Dictionary = {}

    func registrar(id: String) -> bool:
        if not abierta or id not in ["PASE-1", "PASE-2"] or vistos.has(id):
            return false
        vistos[id] = true
        return true

func _initialize() -> void:
    var entrada := Entrada.new()
    var correcto: bool = not entrada.registrar("PASE-1")
    entrada.abierta = true
    correcto = entrada.registrar("PASE-1") and correcto
    correcto = (not entrada.registrar("PASE-1")) and correcto
    correcto = (not entrada.registrar("DESCONOCIDO")) and correcto
    correcto = entrada.vistos.size() == 1 and correcto
    print("GUARDAS_OK" if correcto else "GUARDAS_FALLO")
    quit(0 if correcto else 1)
```

```text
godot --headless --path . --script tests/demo_guardas.gd
```

La salida esperada es `GUARDAS_OK`. El diccionario actúa como conjunto: la clave indica que ya se aceptó el pase. Las guardas rechazan antes de mutar; el `return true` comunica que hubo un cambio. Cambia en la **copia de ensayo** el segundo ID repetido por `PASE-2` sin cambiar la expectativa de tamaño. Debe aparecer `GUARDAS_FALLO`. Explica el fallo y restaura el ensayo. No cambies una expectativa solo para ocultar un error.

### Tu primera prueba del juego

Crea `tests/mi_revision.gd`. Este caso sí usa `scripts/rules.gd` del Starter y puede pasar antes de completar los TODO:

```gdscript
extends SceneTree
const Rules = preload("res://scripts/rules.gd")
var fallos: int = 0

func comprobar(condicion: bool, caso: String) -> void:
    if not condicion:
        fallos += 1
        printerr("FALLO: " + caso)

func _initialize() -> void:
    var ronda := Rules.new()
    comprobar(ronda.phase == Rules.Phase.READY, "estado inicial")
    ronda.start()
    ronda.toggle_pause()
    ronda.tick(10.0)
    comprobar(is_equal_approx(ronda.remaining, 60.0), "pausa conserva tiempo")
    ronda.start()
    ronda.tick(61.0)
    comprobar(ronda.phase == Rules.Phase.LOST, "tiempo agotado pierde")
    comprobar(is_zero_approx(ronda.remaining), "tiempo limitado a cero")
    print("REVISION_OK" if fallos == 0 else "REVISION_FALLO")
    quit(0 if fallos == 0 else 1)
```

Ejecuta `godot --headless --path . --script tests/mi_revision.gd`. Espera `REVISION_OK` y salida 0. El programa reúne fallos y termina con código 1 si alguno falla; conserva tanto mensajes como código de salida cuando diagnostiques. En PowerShell puedes consultar `$LASTEXITCODE` justo después; en bash, `echo $?` inmediatamente después.

**Transferencia a A04.** En `rules.gd`, completa los TODO conservando las guardas: recogida registra una identidad aceptada; daño resta una vida y establece la inmunidad indicada en las reglas del juego; entrega cambia a victoria solo cuando se cumple el requisito. `main.gd` ya llama esos métodos. Amplía tu prueba con ID duplicado y desconocido, entrega prematura, impactos dentro/fuera de inmunidad y reinicio. Escribe esperado antes de ejecutar. G03 conserva casos y resultado; G07 reutiliza las regresiones. Un test de reglas no observa colisiones ni sonido.

## 2. Crear una instancia que sea otro objeto

**Objetivo (T1/A04).** Reutilizar la escena de baliza, configurar identidad y comprobar una relación de eventos.

1. En el panel Sistema de archivos abre `scenes/main.tscn`. En el árbol de escena selecciona `Pickups`.
2. Arrastra `scenes/pickup.tscn` desde Sistema de archivos sobre `Pickups`. Renombra la nueva instancia `CellB`. Comprueba que es hermana de `CellA`, no hija de ella.
3. Con `CellB` seleccionada, busca la propiedad exportada **Pickup Id** en Inspector y escribe `CELL-B`. La define `@export var pickup_id` en `scripts/pickup.gd`; el nombre del nodo y ese ID son datos distintos.
4. En **Transform → Position** escribe X=3, Y=0.9, Z=-4. Guarda `main.tscn` con Ctrl+S. Pulsa F5, Iniciar y observa ambas balizas.
5. Cuando completes recogida en A04, toca A y B: el contador debe avanzar dos veces. Mientras siga el TODO, ambas pueden verse sin aumentar el contador: ese es el límite del Starter.

Crea `CellC` en A04, con ID `CELL-C` y posición (4, 0.9, 3). Al iniciar el juego, `main.gd` recorre los hijos de `Pickups` y conecta cada `body_entered`. Si creas la instancia bajo otro padre, esa conexión no se realiza. Si duplicas una instancia y olvidas cambiar su ID, la regla rechazará la segunda recogida como duplicada. No retires esa protección para disimular el error de escena.

### De la apariencia al recurso propio (A05)

Abre `scenes/pickup.tscn`, selecciona su hijo **Mesh** y localiza **GeometryInstance3D → Material Override**. El recurso recibido es `materials/cell.tres`. En el desplegable del material elige **New StandardMaterial3D**, abre el nuevo recurso y ajusta **Albedo → Color** y **Roughness**; comienza, por ejemplo, con 0.7 de rugosidad. Guarda el recurso desde su menú como `materials/cell_personal.tres` y guarda la escena. El cambio en esta escena base alcanza a las instancias que heredan ese material. Comprueba A/B/C y registra los usuarios; para una diferencia exclusiva de B necesitarías una sobreescritura local de esa instancia.

Roughness afecta a cómo responde la superficie a la luz. La detección utiliza **Shape**, un `CollisionShape3D`: su esfera tiene radio 0.65, mientras la malla visible tiene radio 0.35. Esa diferencia permite recoger antes de que el cuerpo penetre en el dibujo. Prueba un cambio pequeño de radio, explica su efecto y conserva un tamaño que permita jugar. Un color distinto no cambia la colisión.

En G02 registra escena, ID, posición y material creado; en G04, el ensayo de forma/capas. No necesitas una memoria adicional por cada clic. Si no aparece Pickup Id, confirma que seleccionaste la raíz Area3D de la instancia y que tiene `pickup.gd` asociado.

## 3. Velocidad, diagonal y pared

**Objetivo (A05/T2).** Entender el código recibido antes de modificarlo. Abre `scripts/player.gd` y sigue `_physics_process(delta)`:

```gdscript
var input: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
var direction: Vector3 = Vector3(input.x, 0, input.y).limit_length(1.0)
velocity.x = direction.x * speed
velocity.z = direction.z * speed
if not is_on_floor():
    velocity.y -= 18.0 * delta
else:
    velocity.y = 0.0
move_and_slide()
```

Este fragmento **ya está en el archivo**: léelo allí; no lo añadas una segunda vez. `Input.get_vector` limita la longitud del vector a uno; `limit_length` mantiene esa cota al convertirlo a XZ. Por tanto, retirar solo `limit_length` **no provoca** una diagonal más rápida en este código. Si construyeras manualmente `Vector2(1,1)` sin normalizar, su longitud sería aproximadamente 1.414 y sí aparecería el problema.

Con `speed=4.5`, un segundo ideal en horizontal representa 4.5 unidades. La gravedad 18 cambia velocidad vertical por segundo: con `delta=1/60`, el cambio es -0.3 por paso mientras cae. `move_and_slide()` usa `velocity`; no vuelvas a multiplicar la velocidad horizontal por `delta`.

**Ensayo guiado.** Conserva tu versión, cambia temporalmente `speed` a 2.25 en el Inspector de Player y compara el mismo trayecto recto; después restáuralo a 4.5. Usa el mismo inicio y duración aproximada. La pulsación manual permite observar una diferencia, no medir con exactitud milimétrica. Acércate a la pared oeste y mantén izquierda: debe impedir salir del recinto. En **Depurar → Formas de colisión visibles**, contrasta dibujo y forma.

Si atraviesa la pared, revisa `Player/Shape`, el cuerpo estático de la pared y **Collision Layer/Mask**: suelo/paredes están en capa 1; Player está en capa 2 y consulta capa 1. Las áreas de baliza/peligro/muelle tienen máscara 2 para detectar al Player. Un área detecta el contacto, no actúa por sí sola como muro sólido.

Pausa durante el movimiento. `active=false` pone velocidad a cero; la ronda no resta tiempo. Vuelve a enfocar la ventana y comprueba que no queda una dirección retenida. Anota G04: cambio, esperado, observado y destino. El ratón que emula tacto ayuda a ensayar, pero el comportamiento de dos dedos se comprueba posteriormente en móvil.

## 4. Audio una vez por evento

**Objetivo (A06).** Relacionar un evento aceptado con un sonido y una información visual. Abre `scripts/tone.gd`: `_ready()` recorre inicialmente solo `["collect"]`. El diccionario de frecuencias ya contiene los cuatro nombres. Amplía la lista recorrida a `collect`, `hit`, `win` y `lose`, conservando el resto del generador. Reinicia la ejecución para que `_ready()` prepare todos los recursos.

Cada tono guarda muestras en un `AudioStreamWAV`: 22050 muestras por segundo, 3308 muestras, unos 0.15 segundos. `encode_s16` escribe cada muestra como entero de 16 bits; la envolvente reduce su amplitud al final. No necesitas generar archivos de audio externos para completar esta práctica.

En `main.gd`, busca los puntos de llamada que **ya existen**:

| Suceso | Punto de llamada | Qué debes comprobar |
|---|---|---|
| Recogida aceptada | `_on_pickup`, después de `rules.collect()` | Un tono y contador actualizado; repetido rechazado no suena |
| Impacto aceptado | `_on_hazard`, después de `rules.hit()` | `hit` o `lose`, según el estado resultante |
| Victoria | `_on_goal`, cuando `rules.deliver()` devuelve `true` | Un `win`, ronda terminal y mensaje |
| Tiempo agotado | `_process`, compara fase anterior y posterior | Un `lose` al cambiar de fase, sin repetir cada fotograma |

La detección de transición evita reproducir el final continuamente. Si falta un tono, comprueba nombre exacto y si está en `streams`, y confirma que la regla aceptó el evento. No añadas llamadas de sonido a cada fotograma para compensarlo.

**Comprueba.** Ejecuta el juego y escucha recogida, daño y finales; cambia a Silenciar mientras suena y repite un evento. El tono activo se detiene y no empiezan otros; vidas, tiempo y progreso mantienen su significado. El mensaje y las formas deben permitir jugar también con audio apagado. El volumen inicial del nodo Tone es -12 dB; si ajustas volumen/frecuencia, explica por qué y vuelve a escuchar.

En G05 registra qué eventos escuchaste y en qué equipo. Si solo pudiste generar recursos sin sonido, conserva esa comprobación y el pendiente de escucha: no inventes una percepción.

## 5. Preparar un APK e instalarlo

**Objetivo (T3/A08).** Pasar de las fuentes a un paquete y distinguirlo del recorrido real en Android. Mantén Godot y templates **4.7.2** y JDK **17**. El SDK de referencia incluye Platform 35, Build-Tools 35.0.1 y Platform-Tools. Usa la guía de entorno de esta unidad para diagnóstico y rutas por sistema.

1. En Godot abre **Editor → Manage Export Templates** e instala los templates 4.7.2. En macOS los ajustes del editor se encuentran en el menú Godot.
2. Abre **Editor Settings → Export → Android**. **Java SDK Path** apunta a la carpeta del JDK 17 que contiene `bin`; **Android SDK Path**, a la carpeta que contiene `platform-tools/adb`. No cambies el JDK de tus proyectos Flutter para configurar estos campos de Godot.
3. En **Project → Export**, selecciona el preset **Android** incluido. Comprueba `package/unique_name`, ARM64/x86_64 y **Use Gradle Build desactivado**. El preset de entrenamiento no pide internet. La firma debug se configura conforme a la guía; la clave queda fuera de las fuentes.
4. Exporta con **Export Project**, manteniendo **Export With Debug**, a una carpeta de salida externa, por ejemplo `../salidas/PM9-debug.apk`. No pulses Export PCK/ZIP: no genera una aplicación Android instalable.
5. La alternativa de terminal, desde la carpeta de `project.godot`, es:

```text
godot --headless --path . --export-debug "Android" "../salidas/PM9-debug.apk"
```

Crea antes la carpeta `salidas` y verifica que puedes escribir en ella. Registra el error literal si falta template, ruta SDK o firma. Comprueba el hash del archivo final: PowerShell `Get-FileHash ..\salidas\PM9-debug.apk -Algorithm SHA256`; Linux `sha256sum ../salidas/PM9-debug.apk`; macOS `shasum -a 256 ../salidas/PM9-debug.apk`.

**Instala con un dispositivo autorizado.** Conecta por USB, habilita la depuración USB en ese dispositivo y acepta en su pantalla la autorización del ordenador de confianza. Ejecuta `adb devices` desde Platform-Tools: necesitas estado `device`. Si muestra `unauthorized`, revisa la autorización del teléfono; si hay varios dispositivos, selecciona el adecuado con `adb -s` y conserva el identificador solo en tu terminal. Después:

```text
adb install -r "../salidas/PM9-debug.apk"
```

`Success` confirma instalación. Abre **Balizas del muelle** desde el teléfono y recorre inicio, desplazamiento, liberación de botones, pausa, tres recogidas, muelle, daño, derrota y reinicio. Ensaya dos direcciones simultáneas y pérdida/retorno de foco. Una instalación correcta no garantiza que todos esos comportamientos sean correctos.

Si la firma difiere de una instalación propia anterior, no borres aplicaciones ajenas: acuerda la sustitución de esa app de entrenamiento; desinstalar borra sus datos. Sin móvil, completa la exportación y pide turno al docente: la implantación queda pendiente. En G06 conserva versión, corte, hash, resultado de instalación y recorrido observado, sin seriales ni claves. No se exige publicar en una tienda.

## 6. Medir antes de optimizar

**Objetivo (A09).** Elegir una modificación a partir de una comparación. Usa el proyecto terminado y la misma máquina, versión, Compatibility, resolución y recorrido. Cierra cargas ajenas evidentes y evita comparar una ejecución recién importada con otra ya calentada.

1. En `main.tscn` selecciona **Sun → Shadow → Enabled** y conserva su valor inicial (`true`). Guarda el corte base.
2. Ejecuta F5. Abre el panel inferior **Debugger → Profiler**, activa **Start** y juega un calentamiento breve. La pestaña **Monitors** muestra contadores como FPS y nodos; el profiler permite examinar tiempos de CPU/física/scripts. Distingue el dato seleccionado y su unidad.
3. Define un recorrido reproducible de 20 segundos: iniciar, ir de A hacia B y volver al muelle. Repite tres veces en la variante base. Anota una medida comparable por recorrido, por ejemplo el tiempo de fotograma que observas con el mismo método de lectura. No mezcles una media de una prueba con un pico de otra.
4. Detén el juego. Desactiva únicamente **Sun → Shadow → Enabled**, guarda y repite calentamiento y tres recorridos. No cambies a la vez tamaño de ventana, velocidad y renderer.
5. Compara coste y lectura del volumen. Si el ruido de las medidas es tan grande como la diferencia, concluye que **no has demostrado mejora**. Si las sombras ayudaban a situar objetos, explica la pérdida visual antes de elegir la variante final.

| Variante | Recorrido 1 | Recorrido 2 | Recorrido 3 | Unidad y método | Lectura del juego |
|---|---|---|---|---|---|
| Sombras activas | dato propio | dato propio | dato propio | misma medida | observación propia |
| Sombras inactivas | dato propio | dato propio | dato propio | misma medida | observación propia |

No rellenes la tabla con valores de ejemplo. Si tu equipo solo permite ejecutar pruebas sin ventana, conserva pendiente la medición interactiva y solicita acceso; los FPS de ese entorno no representan tu teléfono.

**Regresión.** Tras elegir la variante, comprueba recogida, pausa y reinicio. Como ensayo alternativo, registra el número de nodos en Monitors antes y después de doce reinicios, bajo las mismas condiciones. Un recuento estable solo demuestra que esos nodos no se acumulan en ese ensayo; no prueba ausencia de toda fuga de memoria.

G07 reúne hipótesis, condiciones, datos, decisión y límite; G08 explica cómo repetirlo. Esta comparación consume el tiempo de A09 y reutiliza el mismo dossier.
