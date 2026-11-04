# PM5 · Gimnasio graduado

## Cómo se usa

Las 15 katas están incluidas en las fases 2, 3, 5, 6 y 8. **No son quince entregas aisladas.** Trabaja sobre una copia del starter y conserva un único cuaderno I1.

En cada kata:

**LEE → PREDICE → MODIFICA → VERIFICA → EXPLICA → CLASIFICA EVIDENCIA**

Antes de reparar, conserva un estado seguro: copia limpia de `lib/`, resultado inicial de `flutter analyze`/`flutter test` y el primer síntoma. No necesitas Git si todavía no forma parte de tu flujo.

## Katas

| # | Nivel | Estado/fixture preparado | Reto y aceptación | CE focales |
|---:|:---:|---|---|---|
| 1 | A | permiso `notRequested` | Ordena granted/denied/permanentlyDenied/restricted/limited y separa unavailable; explica una transición imposible. | RA2.j |
| 2 | B | cámara `denied` y `permanentlyDenied` | Solicita solo desde la acción; ofrece Ajustes/fallback y demuestra que sensor/BLE siguen disponibles. | RA2.j, RA3.e |
| 3 | C | scan + sensor activos | En `paused` cancela recursos sin borrar el medio procesado; en `resumed` no reactiva sin contexto. | RA2.j, RA3.e |
| 4 | A | `FakeBlePort` listo | Dibuja anuncio→scan→stop→connect→GATT→disconnect y diferencia write con confirmación de respuesta de negocio. | RA2.c |
| 5 | B | doble scan + timeout/desconexión | Impide scan duplicado, limita a 8 s, detiene antes de conectar y deja cleanup verificable. | RA2.c, RA3.e |
| 6 | A | traza sensor `DEMO-SENSOR-OK` | Distingue acelerómetro/userAccelerometer, muestra/frecuencia y predice reposo sin hacer análisis científico. | RA2.d, RA3.a |
| 7 | B | traza rápida + error + fin | Consume stream, limita repintado a 120 ms, trata error/fin y cancela en `dispose`. | RA2.d, RA3.e |
| 8 | A | puertos vacíos de media | Separa captura, recuperación lost-data, proceso y almacenamiento; señala propietario y fallo de cada capa. | RA3.a, RA3.b |
| 9 | B | `DEMO-TOO-LARGE-01` + MIME inválido | Rechaza >5 MiB y tipo no permitido antes de procesar; la feature queda recuperable. | RA3.b, RA3.e |
| 10 | B | `DEMO-PNG-01` | Convierte a JPEG ≤1024 px y verifica MIME, dimensiones y firma `FF D8`. | RA3.c, RA3.d |
| 11 | C | original + derivada | Guarda con nombres `DEMO-*`, sanea la ruta y explica política de conservación/borrado. | RA3.b, RA3.d |
| 12 | A | player `idle` | Modela loading/ready/playing/paused/error/completed y predice `play` antes de `load`. | RA3.e, RA3.g |
| 13 | B | `DEMO-TONE.wav` + fallo de carga | Implementa load/play/pause/dispose, pausa por lifecycle y demuestra que no solicita micrófono. | RA3.e, RA3.g |
| 14 | B | estado player/sensor | Controla una animación por estado, la detiene y respeta movimiento reducido. | RA3.f |
| 15 | C | `DEMO-CORRUPT-01` | Depura el medio corrupto con síntoma→capa→hipótesis→prueba→cambio→regresión y registro saneado. | RA3.h, RA3.e |

## Plantilla única de cuaderno

```text
Kata:
Carril: DEMO/FAKE | ANDROID REAL/HARDWARE
Estado o fixture inicial:
Predicción:
Cambio mínimo:
Ejecución:
Resultado observado:
Regresión:
Explicación:
CE focal:
Evidencia: OBSERVADA_FAKE_TEST | OBSERVADA_REAL | PENDIENTE_HARDWARE |
           PENDIENTE_PERMISO_ENTORNO | RECUPERACION_REQUERIDA
Dato redactado/eliminado:
```

## Checkpoints por bloques

### Tras K1–K3 · permisos/lifecycle

Puedes explicar problema protegido, momento de solicitud, resultado, acción de la persona y rescate. Tienes un mapa `crea→posee→cancela`.

### Tras K4–K5 · BLE

Puedes ejecutar éxito, timeout y desconexión con fake; no presentas GATT como HTTP; sabes qué falta para Android API 31+ y periférico.

### Tras K6–K7 · sensores

Distingues muestra, frecuencia, repintado, error, fin y cancelación.

### Tras K8–K11 · media

El pipeline rechaza tamaño/tipo/corrupción, convierte bytes de verdad, guarda en privado y no expone rutas.

### Tras K12–K14 · player/animación

El player tiene estados/errores/cleanup y la animación responde a estado y accesibilidad.

### K15 · debugging

La reparación incluye una hipótesis descartada, un cambio mínimo, una regresión y la clase correcta de evidencia.

## Pistas graduadas

1. localiza primero quién posee el recurso;
2. usa un estado coherente, no booleanos que puedan contradecirse;
3. provoca el error con fake antes de depender de hardware;
4. comprueba bytes/dimensiones, no la extensión;
5. si llevas 15 minutos sin nueva evidencia, abre Debugging/Ayuda y pide apoyo con el primer error.

## Completitud de I1

K15 se completa en la fase 8, antes del 10/12; el laboratorio posterior reutiliza su registro. Debe existir evidencia revisable de los quince casos, al menos tres errores corregidos y cobertura explícita de los once CE. I1 no sustituye el producto I2, I3 ni la observación física que proceda.


## Envío del cuaderno

Sube un único `PM5_cuaderno.md` o PDF en la tarea de entrenamiento el 10/12/2026 a las 23:59; recepción hasta 13/12. No envíes quince proyectos. El proyecto integrado se entrega después, en `PM5_producto.zip`, el 18/12 (cierre 21/12). Horas Europe/Madrid.

## Antes de editar: localiza la pieza

Usa la tabla «Qué proyecto y archivo abres» del libro de ejemplos. K1, K4, K6, K8 y K12 son de explicación/modelado; K2–K3, K5, K7, K9–K11 y K13–K15 requieren cambiar o comprobar comportamiento. No escribas un diff ficticio en una actividad conceptual.

En K9/K10 compara el test de tamaño/corrupción y el de PNG válido. En K11 distingue `MemoryDraftStore` (simula un almacén para practicar) de `_process` en Android (escribe un archivo real). En K13 el player web simula estados; el de Android reproduce el WAV. En K15 utiliza la misma incidencia que conservarás en el laboratorio.

Una entrada breve con predicción, cambio o razonamiento, comando/resultado y explicación es suficiente. El cuaderno ofrece un ejemplo de K10; las hipótesis y regresión ampliadas solo son necesarias en las incidencias, no como otra memoria para cada clic.
