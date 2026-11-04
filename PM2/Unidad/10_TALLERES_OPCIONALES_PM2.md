# PM2 · Talleres opcionales y rutas equivalentes

Los talleres sirven para practicar con acompañamiento, comparar decisiones y recibir feedback. **No contienen teoría imprescindible ni son necesarios para desbloquear materiales.**

Si asistes, trae tu copia de trabajo y el checkpoint previo. Si no asistes, realiza la misión autónoma correspondiente durante 45 minutos efectivos. La franja presencial de 55 minutos nominales reserva 10 para entrada, cambios y cierre; desde casa no se añaden esos 10 minutos.

<h3>Calendario de PM2</h3><ul><li><strong>Abierta desde:</strong> <time datetime="2026-10-07T00:00:00+02:00">7 de octubre de 2026</time>.</li><li><strong>Taller opcional 2:</strong> <time datetime="2026-10-13T19:30:00+02:00">13 de octubre · 19:30–20:25</time>.</li><li><strong>Entrega recomendada:</strong> <time datetime="2026-10-18T23:59:00+02:00">18 de octubre · 23:59</time>.</li><li><strong>Cierre de entrega:</strong> <time datetime="2026-10-19T23:59:00+02:00">19 de octubre · 23:59</time>.</li></ul><p>Todos los horarios corresponden a Europe/Madrid.</p>

## Taller 1 · leer y debilitar menos el starter

Primera sesión planificada: **06/10/2026 · 19:30–20:25**. No se da por realizada ni se acredita asistencia. Si no la realizaste, utiliza la misión autónoma; no es una obligación presencial pendiente.

### Antes de empezar

Debes haber completado K1–K6 y poder ejecutar:

```bash
dart run bin/main.dart
```

### Misión · 45 minutos

| Min | Acción | Checkpoint |
|---:|---|---|
| 0–10 | Predice un fragmento con `final`, lista mutable y null safety. | Escribes la salida y la regla antes de ejecutar. |
| 10–25 | Compara un `Map<String, dynamic>` con un record local de dos valores. | Explicas por qué el record sirve aquí y por qué no sustituye cualquier clase. |
| 25–40 | Trabaja K3–K6 y compara una decisión con otra persona o con los ejemplos. | `dart analyze` termina sin errores y justificas una diferencia. |
| 40–45 | Ejecuta el starter y localiza tres riesgos. | Anotas riesgo, posible estado inválido y concepto que podría protegerlo. |

### Si asistes

Habrá live refactor, comparación de alternativas y ayuda sobre bloqueos reales.

### Si no asistes

Sigue la tabla anterior. Para la comparación, contrasta tu respuesta con E3–E5 y conserva:

1. predicción inicial;
2. cambio mínimo;
3. salida real;
4. tres riesgos del starter;
5. una clase que crearías y otra que no crearías.

Pasas al paso 5 de la Ruta cuando puedes explicar esos cinco elementos.

Los 10 min retirados de esta primera misión se dedican en el paso 5 de la Ruta a justificar clases e invariantes; no se exigen después como otra misión.

## Taller 2 · debugging y verificación individual

Fecha confirmada: **13/10/2026 · 19:30–20:25**.

### Antes de empezar

Debes tener una versión ejecutable del laboratorio y haber realizado la actividad **Debugging PM2**.

### Misión · 45 minutos

| Min | Acción | Checkpoint |
|---:|---|---|
| 0–10 | Clasifica tu bloqueo: tipos, invariante, composición, mutabilidad o asincronía. | Puedes señalar fichero, línea y síntoma. |
| 10–25 | Reproduce y repara un fallo con hipótesis previa. | La reparación es mínima y existe una comprobación de regresión. |
| 25–45 | Resuelve una microvariación individual sin agente. | Dejas predicción, cambio, comando/salida y explicación. |

La revisión del checklist y Q06–Q12 se completa en el paso 7 de la Ruta (80 min) antes del paso 8; no se añade a los 45 min de I3.

### Si asistes

Podrás recibir feedback inmediato y realizar la microvariación durante el bloque común.

### Si no asistes

No pierdes acceso ni contenido. Cuando se asigne tu microvariación en AULES:

1. trabaja sobre tu propia copia;
2. no uses agente durante la variación;
3. conserva la predicción antes del cambio;
4. adjunta el cambio o el paquete actualizado;
5. copia el comando y la salida real;
6. explica en 3–6 líneas la regla afectada.

Esta vía observa los mismos elementos de I3. Si el artefacto y la evidencia no permiten comprobar la comprensión, se solicitará una comprobación focalizada en tutoría; no se repite automáticamente toda PM2.

## Cómo pedir ayuda en ambos talleres

Trae o publica: paso, comando, mensaje exacto, fichero/línea, resultado esperado y lo que ya has probado. No compartas credenciales ni datos personales.

