# Entorno, Android y QA · PM9

## Referencia reproducible

Godot **4.7.2.stable.official.ed1daf0bf**, edición estándar/GDScript, Compatibility. Versión estable revalidada el 07/09/2026 en PM8; usar el [archivo oficial 4.7.2](https://godotengine.org/download/archive/4.7.2-stable/). Los templates deben ser 4.7.2, sin mezclar con dev/RC/.NET u otra versión. La campaña coteja ZIP Linux y TPZ de templates con SHA512 oficial antes de ejecutar/exportar.

Importa project.godot desde copia propia. Ejecuta el smoke con el binario fijado: `godot --headless --path . --script tests/smoke.gd`; solo confirma baseline. Ejecuta el proyecto gráficamente, completa las tareas y crea tus pruebas. Las fuentes usan GDScript, escenas, materiales e iconos SVG originales; no hay dependencias de pago ni servicios.

## Exportación de entrenamiento

Configura JDK 17 y Android SDK en ajustes del editor. La referencia usa platform-tools, plataforma Android 35 y build-tools 35.0.1; consulta la [configuración oficial Android](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html) para requisitos/rutas del sistema. Instala templates 4.7.2 mediante gestor del editor o TPZ oficial. El preset incluido usa APK debug clásico, ARM64 y x86_64, sin Gradle personalizado ni permiso de internet; excluye tests/QA y conserva LICENSES.md.

Si no existe una clave debug de entrenamiento, créala fuera de las fuentes con keytool del JDK, sustituyendo la ruta por tu carpeta temporal autorizada:

```text
keytool -genkeypair -keystore <RUTA_TEMPORAL_DEBUG.keystore> -storepass android -alias androiddebugkey -keypass android -dname "CN=Android Debug,O=Android,C=US" -validity 3650 -keyalg RSA -keysize 2048 -noprompt
```

Son credenciales convencionales de debug, sin identidad de publicación. Configura esa ruta/alias en el entorno de exportación; no subir la clave a Git ni usarla para tienda. El runner docente utiliza variables oficiales de exportación debug y una clave efímera. No se usan claves de release.

Exporta con preset Android desde el editor o `godot --headless --path . --export-debug Android <RUTA_SALIDA_APK>`. Guarda log, SHA fuente y SHA256 del APK. La firma temporal puede cambiar bytes/hash entre builds: no se promete identidad binaria, sí fuentes/versión/procedimiento repetibles. Si la compilación falla, conserva diagnóstico y repara entorno; no renombres un ZIP como APK.

## Implantación y recorrido real

Con dispositivo autorizado y oportunidad docente, instala el APK de entrenamiento y recorre: inicio, controles táctiles, liberación, colisión, recogida/daño, pausa/reanudación, victoria/derrota y reinicio. En recuperación: captura, peligro, pérdidas y limpieza. Comprueba sonido/silencio, texto, orientación paisaje y áreas seguras. Registra fecha, versión, corte/hash y etiqueta no identificadora del equipo. No publiques serial, cuentas o logs de otras apps.

Si otra instalación propia de entrenamiento tiene firma diferente, acuerda su sustitución antes de desinstalar; la eliminación borra sus datos locales. No eliminar otras apps. Sin dispositivo se mantiene PENDIENTE_DISPOSITIVO_REAL y se concierta acceso; build, emulador o captura virtual no se convierten en esa evidencia. RA5.h se contrasta con implantación auténtica.

## QA visual, audio y profiling

En editor/destino: revisar encuadre, luces/sombras, materiales, textos y controles sin depender solo de color o audio. Pulsar/soltar/arrastrar fuera, combinación de direcciones, pérdida de foco y pausa. Una captura virtual de CI, si existe, ayuda a revisar composición en esa resolución; no representa GPU, dedos o altavoces de un móvil.

Para profiling, ejecutar proyecto y abrir Debugger→Profiler; iniciar medición explícitamente. Registrar condiciones y tres recorridos comparables antes/después de un solo cambio. Contrastar comportamiento y lectura además del dato; si no se observa mejora, concluirlo. [Profiler oficial](https://docs.godotengine.org/en/stable/tutorials/scripting/debug/the_profiler.html).

Fuentes complementarias: [CharacterBody3D](https://docs.godotengine.org/en/stable/classes/class_characterbody3d.html), [TouchScreenButton](https://docs.godotengine.org/en/stable/classes/class_touchscreenbutton.html), [exportación de proyectos](https://docs.godotengine.org/en/stable/tutorials/export/exporting_projects.html) y [licencias Godot](https://godotengine.org/license/). La teoría de PM9 desarrolla el recorrido completo; las fuentes permiten verificar detalles y requisitos sin sustituir el material docente.

## Arranque concreto en Windows, Linux y macOS

En los tres sistemas descarga desde el archivo oficial la **edición Standard** de Godot 4.7.2 para tu arquitectura (no .NET ni RC), extrae la aplicación en una carpeta donde tengas permisos y comprueba la versión en el editor (Ayuda → Acerca de). No abras archivos sueltos: en Gestor de proyectos elige Importar y selecciona project.godot de una copia completa de beacon_dock. Espera a que termine la importación; comprueba renderer Compatibility. Ejecuta F5, pulsa Iniciar y mueve el personaje. Guarda la observación real en G01/G02. Si el sistema impide abrir el editor, registra el aviso exacto y consulta al docente antes de cambiar las protecciones del equipo.

- **Windows:** extrae el ZIP del proyecto con «Extraer todo» a una ruta corta de tu usuario, sin trabajar dentro del ZIP. Ejecuta Godot Standard para Windows y selecciona project.godot. Si Windows muestra una advertencia, verifica origen/versión oficial antes de continuar; no desactives antivirus. Para Android, localiza la instalación del JDK 17 y Android SDK en las rutas configuradas del editor, no en un ejemplo de Linux.
- **Linux:** extrae el ZIP, da permiso de ejecución solo al binario oficial si hace falta y ábrelo desde tu sesión gráfica; importa project.godot. Si falta OpenGL/renderer, guarda salida de terminal, sesión gráfica/versión y consulta acceso a equipo compatible. El smoke headless puede aislar reglas, pero no sustituye F5 ni prueba GPU.
- **macOS:** extrae y abre la aplicación Standard correspondiente a Intel o Apple Silicon; importa project.godot desde una carpeta de trabajo en tu usuario. Si Gatekeeper la bloquea, verifica procedencia oficial y usa el procedimiento permitido por el centro; no aconsejamos desactivar protecciones globales. Ejecuta la escena principal desde el botón de reproducción/F5 (en teclados donde F5 controla hardware, usa el botón del editor).

## Diagnóstico por síntoma y siguiente paso

| Síntoma | Comprueba | Evidencia y alternativa dentro de la unidad |
|---|---|---|
| No aparece project.godot o faltan escenas | ZIP completo, carpeta correcta y copia extraída | Vuelve a descargar; registra PENDIENTE_ENTORNO, solicita equipo/cita si persiste |
| Error de parseo/importación o ventana negra | 4.7.2 Standard, GDScript, Compatibility, mensaje Salida/Depurador, escena principal | Restaura copia intacta y aísla primer error; smoke solo diagnostica parte del código |
| Renderer/GPU impide F5 | Driver gráfico, Compatibility, sesión gráfica y resolución | Guarda error sin atribuir juego visible; pide equipo compatible; continúa diseño/reglas |
| Smoke pasa, pero el juego no recoge o no se ve | Solo CellA en Starter, reglas TODO, pickup_id y main.tscn | Completa B/C y reglas; anota alcance EJECUTADO_HEADLESS frente a OBSERVADO_EDITOR |
| Faltan SDK/JDK/platform-tools/build-tools | JDK 17, platform-tools, Android 35, build-tools 35.0.1 y rutas en editor | Conserva log y PENDIENTE_ENTORNO; continúa G01–G05/G07 y solicita entorno del centro |
| Falta template o export-debug falla | Template 4.7.2, preset, firma debug temporal y ruta de salida escribible | No mezcles versiones ni uses clave release; registra error y reintenta con apoyo |
| APK existe, pero no hay móvil autorizado | Hash/corte del APK y turno disponible | Registra BUILD_APK y PENDIENTE_DISPOSITIVO_REAL; solicita acceso y recorrido observado |
| No hay audio o profiler observable | Salida de sonido y Debugger→Profiler iniciado | PENDIENTE_AUDIO_REAL/PENDIENTE_PROFILING; acuerda ensayo, sin fabricar resultados |

La evidencia tiene niveles distintos: DOCUMENTADO (fuente/plan), EJECUTADO_HEADLESS (reglas/escena sin interfaz), OBSERVADO_EDITOR (juego visible en ordenador), AUDIO_ESCUCHADO (percepción real), BUILD_APK (paquete exportado) y OBSERVADO_DISPOSITIVO_REAL (instalación/recorrido en móvil autorizado). Registra versión/corte y límite en cada G. La disponibilidad de un teléfono no debe ser una barrera oculta: el docente organiza acceso o reprograma la observación y mantiene RA5.h pendiente hasta completarla.
