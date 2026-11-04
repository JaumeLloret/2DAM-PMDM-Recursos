# PM5 · Tres decisiones del producto I2

## D1 · Permisos y rescate

- acción que expresa intención:
- permiso/capacidad:
- estados tratados:
- feature que debe seguir disponible:
- rescate ante permanente/unavailable:
- cómo lo comprobé:

## D2 · Propiedad y lifecycle

- recurso: scan / conexión / sensor / player / animación:
- quién lo crea y posee:
- dónde se cancela:
- política paused/resumed:
- error preparado:
- regresión:

## D3 · Pipeline multimedia

- entrada/fixture:
- validación de tamaño/MIME/decode:
- transformación y conversión:
- tres pruebas de JPEG real:
- almacenamiento privado/política de borrado:
- límite `AttachmentDraft`/`PROD-01`:

## Clasificación de evidencia

- observado con fake:
- observado en Android real y por quién:
- pendiente de hardware/entorno:
- dato físico o personal que he redactado/eliminado:


## Cómo escribir una decisión útil

Ejemplo de forma, no de resultado de tu app: «Cancelo la suscripción anterior antes de iniciar otra porque dos pulsaciones pueden crear dos listeners. La consecuencia es que Iniciar reemplaza la escucha, no la suma. Lo compruebo con el caso inicio doble → suspensión y señalo el método que he cambiado».

Para cada una de las tres decisiones incluye decisión, motivo, consecuencia y referencia al código/prueba. No copies el capítulo de teoría. Si reutilizas una incidencia, basta una referencia.
