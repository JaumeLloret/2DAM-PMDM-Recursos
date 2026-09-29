# Motor Lab · ayuda por síntomas y autocontrol

| Síntoma | Primera comprobación | Rescate y registro |
|---|---|---|
| No aparece `project.godot` al importar | Mira dentro de `motor_lab_trabajo`, no en el ZIP ni en la carpeta superior | Descarga/descomprime `Starter/motor_lab` completo; anota paso en L02 |
| F5/F6 abre otra escena o no carga recurso | Comprueba `run/main_scene` y rutas `scenes/`, `scripts/`, `materials/` | Abre `lab3d.tscn` y usa F6; restaura baseline si moviste archivos |
| Error de parseo o de renderer | Copia texto de Salida/Depurador; verifica versión 4.7.2 Standard y Compatibility | No conviertas el proyecto a versión nueva; solicita equipo/cita y marca `PENDIENTE_ENTORNO` |
| Probe se mueve sin tocar el Inspector | Detén «Iniciar / detener giro» y distingue posición local de global | Usa «Restablecer escena» para runtime; reabre copia baseline para cambios guardados |
| Sensor no incrementa pero la bola cae | Mira máscara de Sensor y capa de SampleBody; suelo y detección son distintos | Restaura máscara 2 sin borrar formas; razona el síntoma en L01/L06 |
| No oyes el tono | Comprueba texto y contador del minijuego, volumen/salida del equipo | El feedback visible permite analizar la ronda; deja escucha en `PENDIENTE_ENTORNO` si no se verificó |
| Falta I3 observado | Comprueba predicción, diff y restauración preparados | Solicita cita; conserva `PENDIENTE_SUPERVISION` hasta explicación auténtica |

## Antes de entregar el dossier único

- L01 contiene ejemplos 2D/3D y explica responsabilidades; L02 dice qué observaste y en qué entorno, o el bloqueo concreto.
- L03 compara con fuentes fechadas, separa Godot probado de Unity documentado y deja Android para preparación de PM9.
- L04 explica entrada, regla, estado, tiempo, presentación, tono y reinicio de `signal_game.gd`, con éxito, error y timeout.
- L05 da jerarquía y dependencias con tabla/texto legible, posiciones locales/globales y cámara; L06 muestra predicción → **una variable** → resultado → restauración en ensayos separados.
- I3 tiene consigna individual, valores/diff, explicación y estado de supervisión. Los estados `DOCUMENTADO`, `CALCULADO`, `OBSERVADO_EDITOR`, `EJECUTADO_HEADLESS` y `PENDIENTE_ENTORNO` reflejan evidencia real. No atribuyas sonido/GPU/Android a headless.
- Conservas una copia baseline y no incluyes solución ni datos personales. Revisa las tres fechas confirmadas en AULES cuando se publiquen.
