# Dossier único G01–G08 · plantilla de evidencia propia

Conserva **un solo documento final** junto con la fuente de tu juego, en la única tarea calificada «PM9 · Juego y dossier final». Los cortes parciales son para feedback y se actualizan en este mismo dossier. No copies resultados de la solución docente ni inventes una ejecución. **En cada G01–G08** escribe: autoría/aportación propia concreta; versión o SHA/corte y fecha del ensayo; archivo/escena y pasos para reproducir; **modo de evidencia** (DOCUMENTADO, CALCULADO, EJECUTADO_REGLAS, EJECUTADO_HEADLESS, EJECUTADO_MOTOR, OBSERVADO_EDITOR, AUDIO_ESCUCHADO, BUILD_APK u OBSERVADO_DISPOSITIVO_REAL); esperado/observado cuando corresponda; **límite o PENDIENTE_*** y siguiente comprobación. Una captura o test verde aislados no prueban visibilidad, sonido, tacto, autoría o RA5.h. Sanea identificadores, logs, seriales, cuentas y claves.

## G01 · Idea, lógica y estados

**Aportación/corte/modo/límite:** __. Objetivo, acciones y restricciones: __. READY/PLAY/PAUSED/WON/LOST y transiciones: __. Casos éxito, tiempo, vidas, pausa, reinicio y entrega prematura: entrada __, esperado __, observado propio __. Decisión de alcance y motivo: __. Si es solo diseño, marca DOCUMENTADO, no ejecutado.

## G02 · Objetos, escenas y materiales

**Aportación/corte/modo/límite:** __. No atribuyas como creación propia CellA ni componentes recibidos sin modificación.

| Objeto/recurso propio | Tipo/ruta y propiedad | ID/posición/usuarios | Motivo y lectura accesible | Observación propia y límite |
|---|---|---|---|---|
| CellB/CellC | __ | __ | __ | __ |
| Material baliza/peligro | __ | __ | __ | __ |
| Escena/relaciones | __ | __ | __ | __ |

Conserva diff o pasos de edición y explica qué es una escena reutilizable y qué cambia por instancia.

## G03 · Reglas y estados ejecutados

**Aportación/corte/modo/límite:** __. Regla→archivo/método→entrada→esperado→observado: __. Comprueba ID duplicado/desconocido, entrega antes de tres, daño/inmunidad, pausa/terminal y reinicio. Fallo real, corrección/regresión o comprobación sin hallazgo: __. Distingue EJECUTADO_REGLAS de juego observado en ventana.

## G04 · Física e input

**Aportación/corte/modo/límite:** __. Formas, capas/máscaras, velocidad/gravedad y efecto: __. Recorrido de pared, peligro y recogida con esperado/observado: __. Teclado, táctil, pulsar/soltar, foco y pausa en qué destino: __. Una acción simulada por motor no es un dedo en dispositivo real. Próxima comprobación: __.

## G05 · Audio, cámara, luz y HUD

**Aportación/corte/modo/límite:** __. Evento→tono→texto/forma redundante: __. Silencio y no repetir win cada frame: __. Escuché audio en __ con resultado __, o PENDIENTE_AUDIO_REAL. Cámara/encuadre/iluminación y comparación propia: __. Resolución, legibilidad y límites: __. Licencias de recursos: __. Un recurso de audio generado no demuestra cómo suena.

## G06 · Android e implantación

**Aportación/corte/modo/límite:** __. Sistema, Godot/templates/JDK/SDK, preset y ABIs: __. Comando/acción, salida o error, SHA fuente y SHA256 APK: __. Marca BUILD_APK solo si se construyó y comprobó. Instalación real con fecha y etiqueta no identificadora del dispositivo autorizado: __ o **PENDIENTE_DISPOSITIVO_REAL**. Recorrido inicio/recogida/daño/pausa/final/reinicio/táctil/audio, observado por __: __. Emulador/CI/captura no cuentan como instalación física ni acreditan RA5.h.

## G07 · Pruebas, fallos y profiling

**Aportación/corte/modo/límite:** __.

| Caso/hipótesis | Entrada y condiciones | Esperado | Observado y modo | Corte/log | Corrección/regresión/límite |
|---|---|---|---|---|---|
| __ | __ | __ | __ | __ | __ |

Profiler abierto explícitamente en editor/destino: __ o PENDIENTE_PROFILING. Mantén equipo, renderer, resolución y recorrido; repite una base, cambia **una** variable y repite. Datos reales, incertidumbre, legibilidad y conclusión (incluida ausencia de mejora): __. No fabriques FPS.

## G08 · Proceso, reproducción y defensa

**Aportación/corte/modo/límite:** __. Fases con archivos/cambios/cortes: __. Pasos de importación, ejecución y exportación: __. Estructura, licencias, límites/known issues y handoff: __. Consigna I3 nueva: __; predicción previa __; diff propio __; comprobación __; explicación observada por docente __ o **PENDIENTE_SUPERVISION**. La cita sustituye minutos de M4, no añade carga ni convierte una captura en observación.

Antes de entregar, cruza G01–G08 con [RA5.a–j y rúbrica](../Unidad/07_EVALUACION_PM9.md). RA5 pesa 20 % global; todos los RA ≥5 y prueba práctica presencial global ≥5 se mantienen independientes de I3. No hay porcentajes nuevos por artefacto. Si falta hardware/entorno, pide acceso y conserva el pendiente auténtico.
