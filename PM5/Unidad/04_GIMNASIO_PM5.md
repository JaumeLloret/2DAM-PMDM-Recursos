# Gimnasio graduado · PM5

Las 15 katas pertenecen a las fases de la ruta; no añaden tiempo. Conserva predicción, diff mínimo, comando/ejecución y resultado. Niveles: A reconocer, B implementar, C transferir.

| # | Nivel | Reto y aceptación | CE focales |
|---:|:---:|---|---|
| 1 | A | Ordena seis estados de permiso y explica una transición imposible. | RA2.j |
| 2 | B | Solicita cámara solo desde la acción; `permanentlyDenied` ofrece ajustes/fallback. | RA2.j, RA3.e |
| 3 | C | Al pausar lifecycle cancela recursos sin borrar el medio ya procesado. | RA2.j, RA3.e |
| 4 | A | Dibuja scan→connect→exchange→disconnect y diferencia ack de respuesta. | RA2.c |
| 5 | B | Corrige un scan duplicado y añade timeout/cancelación verificable con fake. | RA2.c, RA3.e |
| 6 | A | Distingue acelerómetro de aceleración del usuario y predice muestra en reposo. | RA2.d, RA3.a |
| 7 | B | Consume un stream, limita repintado a 120 ms y cancela en `dispose`. | RA2.d, RA3.e |
| 8 | A | Identifica clases/responsabilidades de captura, proceso y almacenamiento. | RA3.a, RA3.b |
| 9 | B | Rechaza >5 MiB y MIME no permitido antes de procesar. | RA3.b, RA3.e |
| 10 | B | Convierte un fixture PNG a JPEG 1024 px; prueba firma/formato y dimensiones. | RA3.c, RA3.d |
| 11 | C | Conserva original y derivada con nombres `DEMO-*`; explica política de borrado. | RA3.b, RA3.d |
| 12 | A | Modela eventos `loading/ready/playing/paused/error/completed`. | RA3.e, RA3.g |
| 13 | B | Implementa load/play/pause/dispose de un tono WAV DEMO y un fallo de carga. | RA3.e, RA3.g |
| 14 | B | Controla una animación por estado y respeta movimiento reducido. | RA3.f |
| 15 | C | Depura un medio corrupto y entrega registro saneado con pasos/esperado/observado/recuperación. | RA3.h, RA3.e |

## Plantilla de respuesta

```text
Kata:
Predicción:
Cambio mínimo:
Ejecución/fixture:
Resultado observado:
CE que demuestra:
Entorno: fake | Android real
Estado: OBSERVADA_FAKE_TEST | OBSERVADA_REAL | PENDIENTE_...
Dato redactado/eliminado:
```

## Pistas graduadas

1. identifica primero quién crea el recurso;
2. representa un único estado coherente, no tres booleanos;
3. provoca el error con fake antes de tocar hardware;
4. para conversión, inspecciona bytes y dimensiones, no la extensión;
5. para depurar, reduce el caso y conserva solo logs saneados.

## Criterio de completitud I1

No se exige perfección uniforme. Debe existir evidencia revisable de los quince casos, corrección de al menos tres errores y cobertura explícita de los once CE. I1 no sustituye I2 ni la verificación individual I3.

