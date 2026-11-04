# PM2 · Evaluación y entrega

## Qué demuestra esta entrega

La evidencia de PM2 permite comprobar que puedes **generar la estructura de clases necesaria para una aplicación pequeña**: clases con responsabilidad, reglas protegidas, tipos y nulabilidad coherentes, composición, colecciones controladas y una operación asíncrona local comprensible.

No se evalúa cuántas clases escribes ni cuánto código produces. Una clase innecesaria puede empeorar el diseño.

## Evidencias de PM2

- **I1 · entrenamiento:** katas y predicciones para recibir feedback. No son doce notas.
- **I2 · artefacto:** laboratorio, decisiones y ejecución reproducible.
- **I3 · verificación individual:** microvariación sin agente, con predicción, cambio, ejecución y explicación.

PM2 no crea porcentajes internos nuevos. Esta evidencia se integra en RA2.a y la prueba presencial global de PMDM permanece separada.

## Qué debes entregar

Un único ZIP con esta estructura:

```text
PM2_<identificadorAules>/
├── pubspec.yaml
├── analysis_options.yaml
├── bin/
├── lib/
├── test/                 # si existe
├── DECISIONES.md
└── EVIDENCIA.md
```

Incluye también la evidencia breve de I3 en `EVIDENCIA.md` o en el campo de texto de la tarea, según indique AULES.

No se exige un repositorio público, una rama ni una Pull Request. Si utilizas voluntariamente un repositorio privado o autorizado, el ZIP sigue siendo la evidencia de referencia salvo que la tarea indique expresamente otra cosa.

## No incluyas

- `.dart_tool/`;
- `build/`;
- credenciales, tokens o `.env`;
- rutas personales completas;
- datos de otras personas;
- soluciones o material reservado del profesorado;
- paquetes descargados que puedan regenerarse con `dart pub get`.

No hay un tamaño máximo confirmado en esta guía. Si AULES fija uno, aparecerá en la propia tarea antes de la entrega.

## Cómo comprobar el ZIP antes de enviarlo

1. Copia el ZIP a una carpeta temporal.
2. Descomprímelo.
3. Abre la carpeta que contiene `pubspec.yaml`.
4. Ejecuta:

<pre style="white-space: pre-wrap; overflow-wrap: anywhere;"><code>dart pub get
dart format --output=none --set-exit-if-changed .
dart analyze
dart run bin/main.dart
dart test</code></pre>

5. Comprueba que `DECISIONES.md` describe el código real y que `EVIDENCIA.md` contiene salidas reales.

Si `dart test` no aplica porque no has creado tests, indícalo como `NO APLICA`; no lo marques como PASS.

## I3 · microvariación individual

La microvariación observa si comprendes tu propio diseño. Se realiza sin agente y deja cinco elementos:

1. predicción del impacto;
2. fichero, clase o método afectado;
3. cambio o debugging realizado;
4. comando y salida real;
5. explicación breve de la regla o alternativa descartada.

Puedes realizarla en el taller opcional o por la vía equivalente publicada en AULES. La ausencia no cambia el instrumento. Si I2+I3 dejan una duda concreta, se pedirá una comprobación focalizada; no se repite automáticamente toda la unidad.

## Criterios visibles

### Clases necesarias

**Evidencia suficiente:** Cada clase responde a una responsabilidad o regla y existe una decisión de no crear alguna clase.

**Señal de revisión necesaria:** Clases genéricas/decorativas o maps que mantienen reglas dispersas.

### Invariantes

**Evidencia suficiente:** Los estados inválidos se impiden al construir y al modificar.

**Señal de revisión necesaria:** Reglas solo escritas en comentarios o fáciles de romper desde fuera.

### Tipos y null safety

**Evidencia suficiente:** Tipos expresivos; ausencia legítima; sin `dynamic`/`!` injustificados.

**Señal de revisión necesaria:** Casts, `dynamic` o `!` ocultan el contrato.

### Colecciones y mutabilidad

**Evidencia suficiente:** Colección elegida con motivo; exposición controlada.

**Señal de revisión necesaria:** Alias o listas públicas permiten romper reglas.

### Composición y enums

**Evidencia suficiente:** Relaciones y vocabularios cerrados están modelados con criterio.

**Señal de revisión necesaria:** Herencia oportunista o strings libres para estados cerrados.

### Dart moderno

**Evidencia suficiente:** Parámetros, record y switch simplifican el problema.

**Señal de revisión necesaria:** Sintaxis ornamental o código que no puedes narrar.

### Asincronía y error

**Evidencia suficiente:** Esperas el `Future` y conservas un fallo observable con contexto.

**Señal de revisión necesaria:** Future ignorado, `catch` vacío o error imposible de alcanzar.

### Cambio y explicación

**Evidencia suficiente:** Predices, localizas, modifica sin romper y justificas.

**Señal de revisión necesaria:** Cambio por ensayo sin poder explicar su impacto.

La valoración es criterial; estas dimensiones no se suman como nuevos porcentajes.

## Uso de IA

Puede utilizarse en las fases en las que la actividad lo permite. Si la usas, registra como mínimo:

- **para qué** la utilizaste;
- **qué aceptaste o rechazaste**;
- **cómo verificaste** el resultado.

No adjuntes conversaciones completas salvo que la tarea lo solicite. Debes poder explicar, ejecutar, corregir y adaptar cualquier parte entregada. I3 se realiza sin agente.

## Fecha y reenvío

<h3>Calendario de PM2</h3><ul><li><strong>Abierta desde:</strong> <time datetime="2026-10-07T00:00:00+02:00">7 de octubre de 2026</time>.</li><li><strong>Taller opcional 2:</strong> <time datetime="2026-10-13T19:30:00+02:00">13 de octubre · 19:30–20:25</time>.</li><li><strong>Entrega recomendada:</strong> <time datetime="2026-10-18T23:59:00+02:00">18 de octubre · 23:59</time>.</li><li><strong>Cierre de entrega:</strong> <time datetime="2026-10-19T23:59:00+02:00">19 de octubre · 23:59</time>.</li></ul><p>Todos los horarios corresponden a Europe/Madrid.</p>

Intenta terminar y entregar antes del domingo 18 de octubre a las 23:59. La tarea seguirá abierta hasta el lunes 19 de octubre a las 23:59 para resolver incidencias o terminar el cierre. Después quedará cerrada: el 20/10 comienza la ventana de PM3.

La tarea «Entrega · AulaFlow Dart Domain Lab», la Ruta y Empieza aquí muestran estos mismos plazos. Avisos solo recuerda cambios.

Se aplica la política vigente:

- en plazo: evaluación ordinaria;
- retraso justificado: reprogramación sin penalización numérica automática;
- retraso no justificado de hasta 72 h: se evalúa la competencia, aunque puede perderse ese ciclo de feedback;
- más de 72 h: la evidencia pasa al carril de recuperación;
- sin entrega al cierre: RA/CE pendiente por falta de evidencia.

## Estados posibles

- `EVIDENCIA_SUFICIENTE`: artefacto e I3 permiten decidir RA2.a.
- `PENDIENTE_EVIDENCIA`: existe artefacto, pero falta ejecución, explicación o autenticidad.
- `RECUPERACIÓN`: la evidencia muestra que la estructura todavía no cumple.
- `PENDIENTE_ENTORNO`: un bloqueo técnico documentado impide ejecutar; no equivale a logro ni a suspenso automático.
