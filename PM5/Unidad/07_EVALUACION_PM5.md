# Evaluación y autenticidad · PM5

## Regla

`CE → evidencia observable → instrumento → autenticidad → recuperación`

RA2 conserva **35 %** y RA3 **20 %** globales. Esta unidad no crea pesos internos. La prueba presencial obligatoria de PMDM, que debe superarse, continúa separada.

## Trazabilidad

| CE | Evidencia observable | Instrumento | Autenticidad |
|---|---|---|---|
| RA2.c | scan, conexión, intercambio y cleanup | I2 + observación física | demo explicada + I3 |
| RA2.d | stream, muestra, error y cancelación | I1/I2 | cambio de sensor/error |
| RA2.j | petición oportuna, denegación y ajustes | I1/I2/I3 | permiso reiniciado/explicado |
| RA3.a | comparación razonada de entorno/plugins | I1 + decisiones | explicación breve |
| RA3.b | captura/proceso/almacenamiento separados | I2 | localizar clases y flujo |
| RA3.c | bytes realmente recodificados | I1/I2 | inspección de firma |
| RA3.d | resize/compresión observable | I2 | cambio de regla |
| RA3.e | eventos/tipos/fallos/lifecycle | I1/I2/I3 | error inyectado |
| RA3.f | animación controlada y accesible | I2/I3 | modificación de disparador |
| RA3.g | load/play/pause/error/dispose | I2 | demo y explicación |
| RA3.h | registro reproducible y saneado | I1/I2 | debugging en vivo |

## Instrumentos

- **I1 · entrenamiento:** 15 katas y correcciones.
- **I2 · producto aplicado:** app ejecutable, registro, decisiones y demostración.
- **I3 · verificación individual:** microcambio no preparado, 23 min sin agente, ejecución y explicación.

## Rúbrica criterial

| Dimensión | Logro suficiente | Evidencia insuficiente |
|---|---|---|
| permisos/lifecycle | permiso contextual, estados y cleanup coherentes | solicita todo al inicio o bloquea sin salida |
| inalámbrico | conecta/comunica o deja QA física honesta con implementación real preparada | solo botón simulado sin adaptador/puerta real |
| sensores | stream, tratamiento pequeño, error y cancelación | valor fijo o suscripción sin dueño |
| pipeline multimedia | valida, decodifica, transforma, recodifica y almacena | cambia extensión o acepta bytes sin validar |
| reproducción/animación | player y animación controlados por estado/lifecycle | decoración sin control o recurso sin dispose |
| robustez/documentación | errores tipados y registro reproducible/saneado | catch silencioso, crash o log sensible |
| arquitectura | puertos/adaptadores y fake intercambiables | plugins llamados desde widgets |
| explicación/transferencia | modifica y justifica la transición | no puede localizar ni defender el cambio |

La rúbrica no se convierte en una media paralela. El docente determina si cada CE dispone de evidencia suficiente y auténtica.

## Estados de evidencia

- `OBSERVADA_REAL`: docente observa dispositivo/periférico real.
- `OBSERVADA_FAKE_TEST`: solo certifica lógica/arquitectura determinista.
- `PENDIENTE_HARDWARE`: falta recurso físico.
- `PENDIENTE_PERMISO_ENTORNO`: el entorno impide observar.
- `RECUPERACION_REQUERIDA`: la evidencia existe pero no demuestra el CE.

Nunca traduzcas automáticamente `OBSERVADA_FAKE_TEST` a `OBSERVADA_REAL`.

## Entregas y recuperación

En plazo: vía ordinaria. Retraso justificado: reprogramación. Hasta 72 h no justificado: se evalúa competencia pero puede perderse el ciclo de feedback. Más de 72 h: carril de recuperación de CE afectados. Sin evidencia: pendiente. La recuperación se asigna en AULES y exige evidencia nueva sobre los criterios pendientes.

## IA

Puede usarse donde la actividad lo permita, declarando revisión y verificación. I3 y la prueba presencial global se realizan sin agente. Los detectores automáticos no deciden autenticidad.


