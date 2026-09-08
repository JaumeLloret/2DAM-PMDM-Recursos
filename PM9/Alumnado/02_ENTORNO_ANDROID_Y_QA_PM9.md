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
