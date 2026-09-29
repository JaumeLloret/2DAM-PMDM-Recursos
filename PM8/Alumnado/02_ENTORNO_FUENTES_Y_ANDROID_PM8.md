# Entorno fijado, fuentes y viabilidad Android · PM8

Fuentes oficiales comprobadas el **29/09/2026**. Distingue fuente documental de prueba en tu equipo. Para empezar no necesitas Android Studio, JDK ni Unity: solo el editor de escritorio y el starter íntegro.

## Versión reproducible

Revalidación 07/09/2026: **Godot 4.7.2 stable**, publicado 18/08/2026. Referencia ejecutada Linux: `4.7.2.stable.official.ed1daf0bf`. Edición estándar, GDScript, renderer Compatibility; no se requiere .NET. Descargar la edición del sistema desde el [archivo oficial 4.7.2](https://godotengine.org/download/archive/4.7.2-stable/), que ofrece Windows, Linux y macOS. No usar una versión dev/RC ni actualizar el proyecto automáticamente a otra versión.

El binario Linux x86_64 del laboratorio se descargó del release oficial y su archivo ZIP se cotejó con SHA512-SUMS.txt. SHA512 de Godot_v4.7.2-stable_linux.x86_64.zip:

```text
9aa00f7a605200940bce3027a567b782f49bd8e940dd06ae9e987bd65aee1b1467edd56ed84fcdcbdd44354bf613bdbb4e5d2913e925850368e150c59ed54c65
```

Cada sistema usa su archivo correspondiente y su checksum oficial; ese hash no sirve para el ZIP de Windows/macOS. Se ha ejecutado Linux headless, no se han observado los editores gráficos de los tres sistemas. Conserva la versión de tu equipo en L02.

### Elige y abre el editor en tu sistema

Consulta [requisitos 4.7 del editor](https://docs.godotengine.org/en/4.7/about/system_requirements.html) antes de descargar. Para el editor nativo en un proyecto sencillo la referencia mínima es 4 GB RAM, 200 MB más caché/proyecto, CPU acorde con la arquitectura y GPU compatible con **OpenGL 3.3 para Compatibility**; Windows 10, macOS 11 Intel / macOS 13 Apple Silicon o distribución Linux posterior a 2018 son mínimos documentados, no garantía de rendimiento. Descarga **Standard**, no .NET (este proyecto usa GDScript). La página 4.7.2 ofrece paquetes distintos según CPU y sistema:

| Sistema | Qué elegir en el archivo 4.7.2 y cómo iniciarlo |
|---|---|
| Windows | Standard Windows x86_64 (o arm64/x86_32 si tu CPU lo requiere). Descomprime ZIP en carpeta propia y abre el ejecutable Godot; no abras el ZIP como proyecto. Si el sistema bloquea el binario, comprueba procedencia y política del centro antes de ejecutarlo. |
| Linux | Standard Linux x86_64 (u otra arquitectura indicada). Descomprime ZIP, da permiso de ejecución al binario desde Propiedades o `chmod +x` sobre ese archivo y ejecútalo. Si una VM no expone OpenGL adecuado, anota el fallo y pide equipo/cita: headless no sustituye el editor. |
| macOS | Standard macOS Universal para Intel/Apple Silicon. Descomprime el paquete, mueve la app a Aplicaciones o una carpeta propia y ábrela. Si Gatekeeper pide autorización, verifica el origen oficial y sigue la opción de apertura aprobada por tu equipo/centro; no desactives protecciones del sistema. |

Abre el **gestor de proyectos** → **Importar** → selecciona `motor_lab_trabajo/project.godot` (la carpeta debe contener también `scenes/`, `scripts/`, `materials/`, `README.md`, `LICENSES.md`) → espera a que el sistema de archivos termine de importar → abre el proyecto. En la parte izquierda, **Escena** es el árbol y **Sistema de archivos** son los recursos; **Inspector** a la derecha enseña propiedades del nodo/recurso seleccionado; vista **2D/3D**, **Script**, **Salida** y **Depurador** completan el recorrido. Abre `scenes/lab3d.tscn` y usa F6 para esa escena o F5 para principal; en macOS usa Cmd+R y Cmd+B respectivamente (o los botones de ejecución). Pulsa «Iniciar / detener giro» y detén otra vez; `Status` muestra coordenadas. Abre 2D con «Abrir laboratorio 2D» y el minijuego con «Analizar minijuego existente». Botones con clic o Tab/Enter; en el minijuego A/B tienen también teclas físicas A/B. «Restablecer escena» reinicia el runtime, **no revierte cambios guardados** en archivos: conserva copia baseline y reábrela para restaurar archivos editados.

Si no aparece `project.godot`, comprueba descompresión y carpeta seleccionada. Si hay referencias rotas, vuelve a descargar todo el starter; no muevas solo una escena. Si el editor no arranca, registra versión/OS sin identificadores y error exacto de Salida/Depurador o del sistema, prueba el proyecto fijado en Compatibility y solicita al docente acceso al equipo del centro/cita. L02 pasa a `PENDIENTE_ENTORNO`: ese fallo no demuestra un resultado gráfico. Nunca atribuyas un audio escuchado o una GPU observada al proceso headless.

## Arranque guiado

1. Extrae el editor estándar correspondiente al sistema autorizado y comprueba versión.
2. Copia el starter motor_lab a una carpeta de práctica propia. En el gestor de proyectos, importa project.godot; permite importación de recursos propios del proyecto.
3. Abre lab3d.tscn, identifica árbol/inspector/archivos y ejecuta el proyecto con su botón de ejecución. Usa controles visibles de giro, cambio de escena, reinicio y minijuego.
4. Detén ejecución antes de modificar baseline; guarda una copia o corte Git. El árbol remoto corresponde a runtime; el árbol local al recurso editado.
5. Registra error exacto y renderer si falla. No cambies motor ni elimines recursos al azar; usa equipo/cita docente si no cumple requisitos.

Los requisitos son referencias mínimas, no garantía de rendimiento del equipo del centro. Consulta [requisitos oficiales de la rama 4.7](https://docs.godotengine.org/en/4.7/about/system_requirements.html) para la combinación concreta. QA #59 conserva la comprobación real y accesibilidad de controles.

## Android como criterio de selección

Desde **Windows, macOS o Linux**, el recorrido documentado de exportación recomienda OpenJDK 17, Android SDK y templates de exportación de la **misma versión 4.7.2**. La [guía oficial Android 4.7](https://docs.godotengine.org/en/4.7/tutorials/export/exporting_for_android.html) enumera SDK Platform 35, build-tools 35.0.1, platform-tools 35.0.0 o posterior, command-line tools, CMake 3.10.2.4988404 y NDK r28b/28.1.13356709. En Ajustes del editor se configurarían Java SDK Path y Android SDK Path. No hace falta instalar estas herramientas para completar PM8. La guía distingue el caso del editor Android, que no necesita JDK/SDK de escritorio para exportar allí: aquí trabajamos con editor de escritorio. PM8 identifica requisitos y riesgos; PM9 decidirá y realizará exportación del juego cuando sea viable.

No introducir claves de publicación ni firmar una release de producción. La campaña trabaja APK de entrenamiento; build, instalación y observación física se registran por separado. No se exige comprar móvil ni asumir una capacidad no disponible: el docente organiza oportunidad de QA y mantiene PENDIENTE_DISPOSITIVO_REAL hasta observar.

## Fuentes de conceptos y comparación

- [Nodos y escenas](https://docs.godotengine.org/en/4.7/getting_started/step_by_step/nodes_and_scenes.html): composición y escena principal.
- [Introducción a 3D](https://docs.godotengine.org/en/stable/tutorials/3d/introduction_to_3d.html): espacio, cámara y representación.
- [Recursos](https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html): datos compartidos e instancias.
- [Procesamiento de frames y física](https://docs.godotengine.org/en/stable/tutorials/scripting/idle_and_physics_processing.html): callbacks y delta.
- [Introducción a físicas](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html): cuerpos, áreas y formas.
- [Godot y licencias](https://godotengine.org/license/): motor MIT, aviso de copyright/licencia al redistribuir el binario y licencias de componentes; el contenido propio conserva su autoría.
- [Unity 6.3 LTS y soporte](https://unity.com/releases/unity-6/support) (soporte anunciado hasta diciembre de 2027) y [GameObjects](https://docs.unity3d.com/6000.3/Documentation/Manual/GameObjects.html) de manual 6000.3: comparación **DOCUMENTADO** al 29/09/2026 de entorno/composición; no ejecución, benchmark ni precio del plan Unity en esta unidad.

La teoría y el proyecto permiten completar la ruta sin tutoriales externos obligatorios. No se descargan assets de pago: primitivas, polígonos, materiales y tono son originales; los avisos del motor se conservan al distribuir. La selección no presupone precio/licencia de un plan Unity ni una prueba de rendimiento que no se ha realizado.
