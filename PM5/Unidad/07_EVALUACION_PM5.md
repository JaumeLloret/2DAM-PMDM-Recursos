# PM5 · Evaluación, entrega y autenticidad

## Qué se evalúa

La cadena es:

`CE → evidencia observable → instrumento → autenticidad → recuperación`

RA2 conserva **35 %** y RA3 **20 %** globales. PM5 **no crea pesos internos**, mínimos ni medias paralelas. La prueba presencial obligatoria de PMDM, que debe superarse, continúa separada.

## Dos entregas, un mismo trabajo

- **Cuaderno I1:** 10/12/2026 a las 23:59; recepción hasta 13/12. Un cuaderno con las quince prácticas, no quince tareas.
- **Producto I2 e I3:** 18/12/2026 a las 23:59; recepción hasta 21/12. Incluye código, decisiones, registro y comprobación individual del 15/12 o vía equivalente. Referencia el cuaderno ya entregado; no lo subas idéntico otra vez.
- **Recuperación:** solo si se asigna; entrega 17/01/2027 a las 23:59, recepción hasta 20/01. Apertura 08/01.

Horas Europe/Madrid. Los talleres del 24/11, 01/12 y 15/12 son de 19:30–20:25, con 45 minutos efectivos y alternativa autónoma.

## Instrumentos

### I1 · entrenamiento

Un único cuaderno con las 15 katas:

- predicción;
- cambio mínimo;
- ejecución/resultado;
- explicación;
- estado de evidencia;
- al menos tres errores corregidos.

I1 demuestra preparación y trazabilidad. No sustituye el producto ni I3.

### I2 · AulaFlow Device & Media Companion

Entrega:

- `PM5_producto.zip`, con el proyecto y sus documentos;
- diff respecto al starter;
- app ejecutable en DEMO;
- `02_DECISIONES_PM5.md`;
- `04_REGISTRO_EVIDENCIAS_PM5.md`;
- comandos y resultados reales de analyze/tests;
- una incidencia depurada con regresión;
- demostración breve con fixtures/escena neutra;
- lista de observaciones físicas realizadas y pendientes;
- límite visible: `AttachmentDraft` local, subida pendiente de `PROD-01`.

### I3 · microcambio individual

La variante exacta permanece reservada. La vía presencial y la autónoma son alternativas de 45 minutos efectivos y producen la misma evidencia. La franja presencial de 55 minutos nominales reserva 10 de margen:

- 5 min de preparación;
- 23 min para predecir e implementar **sin agente**;
- 10 min para ejecutar/depurar/regresión;
- 5 min para explicar capa, decisión y límite;
- 2 min para registrar el estado.

El registro ampliado se completa en la fase 11 de la Ruta, sin repetir I3 ni sumar tiempo a las 12 h de PM5.

I3 demuestra comprensión individual. No acredita por sí sola hardware físico si no se ha observado.

## Trazabilidad de CE

| CE | Evidencia observable | Instrumento | Autenticidad | Recuperación |
|---|---|---|---|---|
| RA2.c | scan, conexión, intercambio y cleanup | I2 + observación física cuando proceda | demo explicada + I3 | BLE de museo, protocolo distinto |
| RA2.d | stream, muestra, error y cancelación | I1/I2 | cambio de sensor/error | giroscopio y regla distinta |
| RA2.j | petición oportuna, denegación y ajustes | I1/I2/I3 | permiso reiniciado/explicado | Bluetooth/selector con otro flujo |
| RA3.a | comparación razonada de entorno/plugins | I1 + decisiones | explicación breve | nueva selección de librerías |
| RA3.b | captura/proceso/almacenamiento separados | I2 | localizar clases y flujo | fuente/almacén distintos |
| RA3.c | bytes realmente recodificados | I1/I2 | MIME + firma | salida PNG en recuperación |
| RA3.d | resize/compresión observable | I2 | cambio de regla | thumbnail 640 px con marca DEMO |
| RA3.e | eventos/tipos/fallos/lifecycle | I1/I2/I3 | error inyectado | desconexión/medio corrupto nuevos |
| RA3.f | animación controlada y accesible | I2/I3 | modificación de disparador | pulso de baliza distinto |
| RA3.g | load/play/pause/error/dispose | I2 | demo y explicación | guía de audio de museo |
| RA3.h | registro reproducible y saneado | I1/I2 | debugging en vivo/individual | nuevo informe de incidencia |

## Qué significa evidencia suficiente

| Dimensión | Suficiente | Todavía insuficiente |
|---|---|---|
| permisos/lifecycle | solicitud contextual, estados, rescate y cleanup | pide todo al inicio o bloquea sin salida |
| BLE | lógica real preparada y fake reproducible; observación física registrada cuando exista | botón simulado sin puerto/adapter o fake etiquetado como real |
| sensores | stream, throttling, error/fin y cancelación | valor fijo o suscripción sin dueño |
| multimedia | valida, decodifica, transforma, recodifica y almacena | renombra extensión o acepta bytes sin validar |
| reproducción/animación | player y animación controlados por estado/lifecycle | decoración sin control o recurso sin dispose |
| robustez | errores tipados, prueba mínima, cambio y regresión | catch silencioso, crash o log sensible |
| arquitectura | puertos/adaptadores/fakes intercambiables | plugins llamados desde widgets |
| explicación | localiza responsabilidad, cambia y justifica | solo muestra que «funciona» |

El docente determina si cada CE dispone de evidencia suficiente y auténtica. La tabla no se convierte en una media propia.

## Estados de evidencia

- `OBSERVADA_REAL`: el docente observa la capacidad en dispositivo/periférico real.
- `OBSERVADA_FAKE_TEST`: demuestra lógica/arquitectura determinista, no hardware.
- `PENDIENTE_HARDWARE`: falta el recurso físico.
- `PENDIENTE_PERMISO_ENTORNO`: el entorno impide observar.
- `RECUPERACION_REQUERIDA`: lo aportado no demuestra todavía el CE.

Cada fila del registro se clasifica por separado. Una cámara real no convierte BLE fake en real.

## Formato y exclusiones

En **Practica y entrega tu cuaderno de entrenamiento** sube un único `PM5_cuaderno.md` o su exportación PDF. Debe contener las quince prácticas, sus cambios, resultados y al menos tres errores corregidos.

En **Construye el producto en el laboratorio** sube `PM5_producto.zip`. Al abrirlo deben encontrarse `pubspec.yaml`, `lib/`, `test/`, un README con el comando de arranque y una carpeta `evidencias/` con decisiones, registro, incidencia e I3. Incluye `pubspec.lock` si se ha generado. Si añades adaptadores Android, conserva los ajustes necesarios del proyecto Android o un script reproducible que los aplique. Referencia el cuaderno ya enviado; no dupliques una copia idéntica.

I3 se documenta con predicción, diff, ejecución/regresión y explicación en `evidencias/PM5_I3.md`, o mediante el registro equivalente observado por el docente. No incluyas la variante reservada en una publicación abierta. El límite de tamaño es el mostrado por AULES.

No incluyas:

- `build/`, `.dart_tool/` o caches;
- `.env`, tokens o credenciales;
- solución docente, variantes I3 o material reservado;
- MAC, serial, UUID de instancia o id físico;
- rutas personales/logs crudos;
- fotos/audio personales, ubicación, cuentas o nombres reales.

## Uso de IA

Puede usarse donde la actividad lo permita. Registra:

1. para qué la utilizaste;
2. qué aceptaste o rechazaste;
3. qué prueba ejecutaste;
4. qué corrección o decisión propia aplicaste.

I3 y la prueba presencial global se realizan sin agente. Los detectores automáticos no deciden autenticidad.

## Plazos y recuperación

- En plazo: vía ordinaria.
- Retraso justificado: reprogramación.
- Hasta 72 h no justificado: se evalúa competencia, aunque puede perderse el ciclo de feedback.
- Más de 72 h: carril de recuperación de los CE afectados.
- Sin evidencia: estado pendiente.

La recuperación usa **Museum Pocket Guide** y genera evidencia nueva de los focos pendientes; no consiste en maquillar el mismo producto.

## Antes de enviar

Completa **¿Estoy listo?**, checklist y registro. Si algo no se ha ejecutado, escribe `NO EJECUTADO` o el estado pendiente adecuado. Un límite bien documentado es evidencia honesta; un PASS inventado no lo es.

