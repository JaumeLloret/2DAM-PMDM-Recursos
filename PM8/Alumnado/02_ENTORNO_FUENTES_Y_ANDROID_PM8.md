# Entorno fijado, fuentes y viabilidad Android · PM8

## Versión reproducible

Revalidación 07/09/2026: **Godot 4.7.2 stable**, publicado 18/08/2026. Referencia ejecutada Linux: `4.7.2.stable.official.ed1daf0bf`. Edición estándar, GDScript, renderer Compatibility; no se requiere .NET. Descargar la edición del sistema desde el [archivo oficial 4.7.2](https://godotengine.org/download/archive/4.7.2-stable/), que ofrece Windows, Linux y macOS. No usar una versión dev/RC ni actualizar el proyecto automáticamente a otra versión.

El binario Linux x86_64 del laboratorio se descargó del release oficial y su archivo ZIP se cotejó con SHA512-SUMS.txt. SHA512 de Godot_v4.7.2-stable_linux.x86_64.zip:

```text
9aa00f7a605200940bce3027a567b782f49bd8e940dd06ae9e987bd65aee1b1467edd56ed84fcdcbdd44354bf613bdbb4e5d2913e925850368e150c59ed54c65
```

Cada sistema usa su archivo correspondiente y su checksum oficial; ese hash no sirve para el ZIP de Windows/macOS. Se ha ejecutado Linux headless, no se han observado los editores gráficos de los tres sistemas. Conserva la versión de tu equipo en L02.

## Arranque guiado

1. Extrae el editor estándar correspondiente al sistema autorizado y comprueba versión.
2. Copia el starter motor_lab a una carpeta de práctica propia. En el gestor de proyectos, importa project.godot; permite importación de recursos propios del proyecto.
3. Abre lab3d.tscn, identifica árbol/inspector/archivos y ejecuta el proyecto con su botón de ejecución. Usa controles visibles de giro, cambio de escena, reinicio y minijuego.
4. Detén ejecución antes de modificar baseline; guarda una copia o corte Git. El árbol remoto corresponde a runtime; el árbol local al recurso editado.
5. Registra error exacto y renderer si falla. No cambies motor ni elimines recursos al azar; usa equipo/cita docente si no cumple requisitos.

Como referencia mínima de editor nativo, la documentación oficial sitúa 4 GB de RAM y GPU compatible con el renderer; Compatibility se apoya en OpenGL 3.3/OpenGL ES 3.0 según plataforma. Son mínimos de referencia, no garantía de rendimiento del equipo del centro. Consultar [requisitos oficiales](https://docs.godotengine.org/en/stable/about/system_requirements.html) para la combinación concreta. QA #59 conserva la comprobación real y accesibilidad de controles.

## Android como criterio de selección

El recorrido documentado requiere JDK 17, Android SDK y templates de exportación de la **misma versión 4.7.2**. La referencia oficial consultada enumera plataforma Android 35 y build-tools 35.0.1, además de herramientas de plataforma/línea de comandos; CMake 3.10.2.4988404 y NDK 28.1.13356709 forman parte de su configuración descrita. Verificar rutas de SDK/JDK en ajustes del editor y templates antes de crear preset Android. PM8 identifica requisitos; PM9 ejecuta exportación del juego cuando sea viable. [Guía oficial Android](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html).

No introducir claves de publicación ni firmar una release de producción. La campaña trabaja APK de entrenamiento; build, instalación y observación física se registran por separado. No se exige comprar móvil ni asumir una capacidad no disponible: el docente organiza oportunidad de QA y mantiene PENDIENTE_DISPOSITIVO_REAL hasta observar.

## Fuentes de conceptos y comparación

- [Nodos y escenas](https://docs.godotengine.org/en/stable/getting_started/step_by_step/nodes_and_scenes.html): composición y escena principal.
- [Introducción a 3D](https://docs.godotengine.org/en/stable/tutorials/3d/introduction_to_3d.html): espacio, cámara y representación.
- [Recursos](https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html): datos compartidos e instancias.
- [Procesamiento de frames y física](https://docs.godotengine.org/en/stable/tutorials/scripting/idle_and_physics_processing.html): callbacks y delta.
- [Introducción a físicas](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html): cuerpos, áreas y formas.
- [Godot y licencias](https://godotengine.org/license/): motor MIT y avisos de componentes al distribuir.
- [Unity 6.3 LTS y soporte](https://unity.com/releases/unity-6/support) y [GameObjects](https://docs.unity3d.com/6000.3/Documentation/Manual/GameObjects.html): comparación documental secundaria de entorno/composición; no ejecución de Unity en esta producción.

La teoría y el proyecto permiten completar la ruta sin tutoriales externos obligatorios. No se descargan assets de pago: primitivas, polígonos, materiales y tono son originales; los avisos del motor se conservan al distribuir. La selección no presupone precio/licencia de un plan Unity ni una prueba de rendimiento que no se ha realizado.
