# PM8 · Ruta de estudio · Motor Lab

Vas a estudiar un juego y dos laboratorios que ya funcionan. Aprenderás a explicar sus escenas, sus servicios del motor y sus reglas; al final justificarás el uso de Godot para preparar PM9. **Aquí no construyes un juego nuevo ni exportas una APK.** Guarda un único dossier [Motor Lab L01–L06](01_DOSSIER_MOTOR_LAB_PM8.md).

**Calendario de publicación:** apertura `PENDIENTE_CONFIRMACION_DOCENTE` · entrega objetivo `PENDIENTE_CONFIRMACION_DOCENTE` · cierre/cutoff `PENDIENTE_CONFIRMACION_DOCENTE`. Tu profesor escribirá las tres fechas aquí, en la portada y en la sección/tarea de AULES antes de abrir la unidad. **09/02/2027 es el taller, no la fecha de entrega.**

## Los primeros 20 minutos

1. Descarga **la carpeta completa** `Practica/Starter/motor_lab/` mediante el archivo «Motor Lab · Starter completo» de AULES. Descomprímela: en la misma carpeta deben quedar `project.godot`, `scenes/`, `scripts/`, `materials/`, `README.md` y `LICENSES.md`. Copia esa carpeta como `motor_lab_trabajo` y conserva la original para restaurar. No abras un `.tscn` aislado.
2. Obtén **Godot 4.7.2 stable, edición Standard** para tu sistema desde el [archivo oficial](https://godotengine.org/download/archive/4.7.2-stable/). Sigue la [guía de entorno](02_ENTORNO_FUENTES_Y_ANDROID_PM8.md) para Windows, Linux o macOS. En el gestor de proyectos elige **Importar**, selecciona `motor_lab_trabajo/project.godot`, espera la importación y comprueba en Proyecto → Configuración del proyecto que se usa Compatibility.
3. En el panel Sistema de archivos abre `scenes/lab3d.tscn`. Pulsa **F6** (en macOS **Cmd+R**) para ejecutar esa escena (o **F5**, en macOS **Cmd+B**, para la escena principal, que también es `lab3d.tscn`). Mira el árbol Escena y el Inspector. En la ventana del juego pulsa **«Iniciar / detener giro»** una vez: `Pivot/Probe` gira y el texto de estado muestra posiciones local/global; vuelve a pulsarlo para detener. Si el foco está en un control, usa clic o Tab y Enter. No edites todavía.
4. Abre [L02](01_DOSSIER_MOTOR_LAB_PM8.md): anota versión/edición, sistema sin identificadores, renderer, escena, control pulsado y lo que **has visto realmente**. Si no arranca, copia el mensaje exacto de Salida/Depurador y el paso en que falló; anota `PENDIENTE_ENTORNO` y solicita al docente acceso a un equipo/cita. No describas imagen, GPU o sonido como observados si no hubo ventana.

## Presupuesto de 360 minutos por estudiante

| Bloque | Min | Qué haces y dónde | Qué conservas |
|---|---:|---|---|
| A01 | 40 | Arranque anterior y [entorno](02_ENTORNO_FUENTES_Y_ANDROID_PM8.md) | L02: versión, prueba o bloqueo |
| A02 | 55 | [Teoría](../Unidad/02_CONTENIDOS_PM8.md) §§1–6; [entrenamiento](../Unidad/04_ENTRENAMIENTO_PM8.md) E1–E7 | L01 y vocabulario para L05 |
| A03 | 60 | `scenes/lab3d.tscn`, `lab2d.tscn`, `signal_game.tscn`; [guía de escenas](../Unidad/03_EJEMPLOS_GUIADOS_PM8.md) §4 | L04 y primer mapa L05 |
| A04 | 45 | [Fuentes y Android](02_ENTORNO_FUENTES_Y_ANDROID_PM8.md); [teoría](../Unidad/02_CONTENIDOS_PM8.md) §§9–10 | L03 con decisión y límites |
| A05 | 45 | [Ejemplos guiados](../Unidad/03_EJEMPLOS_GUIADOS_PM8.md) §§1–3, en copia | L06: dos cambios separados y restaurados |
| T1 | 45 | [Misión presencial o desde casa](03_MISION_T1_PM8.md), **una sola vía** | L05/L06, incluida I3 |
| A06 | 40 | [Laboratorio](../Unidad/06_LABORATORIO_PM8.md) y plantilla L01–L06; corregir un hallazgo | Un dossier completo |
| A07 | 30 | [Autocontrol y evaluación](../Unidad/07_EVALUACION_PM8.md); entregar y anotar transferencia | Dossier revisado y handoff PM9 |
| **Total autónomo** | **315** | A01–A07 |  |
| **Total T1** | **45** | Taller **o** casa |  |
| **Total unidad** | **360** |  |  |

Los diez minutos retirados de la antigua actividad de 55 se incorporan a A01 (30 → 40) para descomprimir el proyecto, importar y diagnosticar con calma. La franja nominal T1 del **martes 09/02/2027, 19:30–20:25**, reserva 45 minutos efectivos y 10 de margen operativo. Puedes hacer T1 desde casa; la cita de I3 sustituye el tramo de supervisión y hasta entonces el estado es `PENDIENTE_SUPERVISION`. A06/A07 se realizan después de T1. Los checkpoints de A01/A03/A05 se pueden enseñar para recibir feedback; no son entregas calificadas adicionales de L01–L06.

## Cómo saber si puedes seguir

- Si el editor no encuentra `project.godot`, verifica que descomprimiste la carpeta entera y que no elegiste la carpeta superior; vuelve a importar la ruta exacta. Si faltan `scenes/`, `scripts/` o `materials/`, vuelve a descargar.
- Si F6 abre una escena distinta, abre `scenes/lab3d.tscn` desde Sistema de archivos; F5 ejecuta la principal configurada en `project.godot`. Si un botón no responde, comprueba que la ventana del juego tiene foco.
- Si ves error de script o ventana negra, conserva mensaje y versión, verifica 4.7.2 Standard y Compatibility; restaura la copia inicial. No cambies a un motor distinto ni inventes el resultado: contacta al docente para acceso supervisado.
- Antes de entregar, revisa que L01–L06 tienen fuentes/archivos, estados de evidencia y explicación propia; todo diagrama lleva tabla/texto equivalente. Una captura sola no acredita comprensión ni autoría.

Consulta [la guía paso a paso](../Unidad/01_GUIA_ALUMNADO_PM8.md) si necesitas desglosar cada bloque. Recuperación Expo Lab solo aparece si el docente la asigna. La prueba práctica presencial global y los mínimos de la evaluación del módulo son independientes de esta misión.
