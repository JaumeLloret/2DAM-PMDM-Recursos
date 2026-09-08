# Ampliación opcional · PM5

Estas rutas no son requisito, no añaden minutos obligatorios ni desplazan PM6/PM7/PI4.

## A. Calidad de señal BLE

Representa RSSI con media móvil sencilla y explica por qué no equivale a distancia exacta. Mantén ids redactados y consumo acotado.

## B. Cola multimedia local

Procesa dos fixtures de forma secuencial, con cancelación y progreso. No implementes subida, REST ni base de datos.

## C. Procesamiento en isolate

Mide de forma informal una imagen grande y mueve la conversión fuera del isolate UI. La medición es observación de rendimiento local, no contenido de DevTools profesional.

## D. Accesibilidad avanzada

Añade Semantics a estados de scan/player y anuncia errores sin depender del color. Prueba texto ampliado y `disableAnimations`.

## E. Protocolo BLE notificable

Si el periférico de aula lo permite, sustituye read por suscripción a característica. Documenta framing y timeout; no afirmes que BLE ofrece request/response por sí solo.

## F. Política de borrado

Implementa una acción que elimina originales/derivadas DEMO y documenta qué ocurre si falla a mitad. No añadas ORM, sincronización o cifrado como núcleo.

## Evidencia

Cada ampliación incluye propósito, diff, ejecución, impacto en recursos y límites. No compensa un CE ordinario pendiente salvo decisión docente explícita.


