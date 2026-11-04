# PM2 · Ruta de aprendizaje

## Qué vas a conseguir

En PM1 aprendiste a reconocer y ejecutar un proyecto Flutter/Dart. Ahora vas a centrarte en el lenguaje: transformarás datos débiles —maps, strings libres y nulos ambiguos— en una estructura pequeña de clases Dart que otra persona pueda entender y modificar.

Al terminar podrás:

- elegir tipos, nulabilidad y colecciones que expresen el problema;
- decidir cuándo necesitas una clase, un enum o un record;
- proteger reglas para que un objeto no pueda quedar en un estado inválido;
- ejecutar y explicar una operación local con `Future`;
- justificar una estructura de clases, no solo hacer que el programa «funcione».

No construirás interfaz Flutter, no usarás red y no trabajarás persistencia. Esos contenidos llegarán en unidades posteriores.

## Antes de empezar

Necesitas lo que ya se trabajó en PM1:

1. El comando `dart` disponible en una terminal.
2. Un editor capaz de abrir una carpeta de proyecto:
   - **VS Code + extensión Dart**, recomendado si buscas un editor ligero; o
   - **Android Studio + plugins Dart/Flutter**, válido si ya lo preparaste en PM1.
3. Saber localizar `pubspec.yaml`, `bin/`, `lib/` y `test/`.

No abras solamente `main.dart`: abre la **carpeta que contiene `pubspec.yaml`**. Así el editor reconocerá el paquete completo.

### Checkpoint de entorno · 5 minutos

Abre una terminal y ejecuta:

```bash
dart --version
```

Debes ver una versión de Dart y ningún mensaje parecido a `command not found` o «no se reconoce como un comando».

Después abre el paquete de ejemplos y ejecuta:

```bash
dart pub get
dart run bin/main.dart
```

La primera línea relevante de la salida debe ser:

```text
null-safety: SIN RESPONSABLE
```

Si falla, no reinstales todo a ciegas. Ve a **Ayuda PM2**, busca el síntoma y conserva el comando y el mensaje exactos. Mientras se resuelve el entorno puedes leer, predecir y anotar cambios, pero una salida leída no sustituye tu propia ejecución.

## Ruta completa · 480 minutos

La unidad incluye todo el trabajo obligatorio. Los talleres son opcionales: puedes hacer las mismas prácticas de forma autónoma con los recursos indicados.

### Paso 1 · 25 min

**Lee o consulta:** Esta Ruta y el diagnóstico Q01–Q05

**Haz:** Comprueba entorno, recorre el paquete y responde el diagnóstico

**Comprueba:** `dart run bin/main.dart` muestra seis líneas; sabes si estás verde, ámbar o rojo

**Conserva o entrega:** Bloqueo exacto o resultado del diagnóstico; no se califica

### Paso 2 · 65 min

**Lee o consulta:** **Dart I · tipos, mutabilidad y null safety**

**Haz:** Reproduce ejemplos y completa K1–K2

**Comprueba:** Puedes explicar por qué `final` no inmoviliza una lista y por qué `!` no valida

**Conserva o entrega:** Entradas K1–K2 del cuaderno

### Paso 3 · 75 min

**Lee o consulta:** **Funciones, colecciones, records y enums** + Ejemplos guiados

**Haz:** Trabaja E3–E5 y K3–K6 sobre una copia del paquete

**Comprueba:** La salida coincide con la prevista y `dart analyze` no muestra errores

**Conserva o entrega:** Cuaderno K3–K6 y copia de trabajo

### Paso 4 · 45 min

**Lee o consulta:** **Práctica acompañada 1**

**Haz:** Realiza la misión autónoma del primer taller, planificado para el 06/10; no tienes que asistir a una sesión pasada.

**Comprueba:** Localizas tres debilidades reales del starter y propones una clase que sí aporta valor

**Conserva o entrega:** Tres riesgos y dos decisiones iniciales

### Paso 5 · 90 min

**Lee o consulta:** **Clases necesarias, invariantes y composición**

**Haz:** Trabaja E6–E7 y K7–K9, K11–K12

**Comprueba:** Puedes señalar dónde se impide cada estado inválido

**Conserva o entrega:** Cuaderno K7–K9, K11–K12

### Paso 6 · 55 min

**Lee o consulta:** **Asincronía local**

**Haz:** Trabaja E8, K10 y su ruta de error

**Comprueba:** No aparece `Instance of 'Future<String>'`; el error se muestra con contexto

**Conserva o entrega:** Predicción, salida normal y salida de error

### Paso 7 · 80 min

**Lee o consulta:** **Laboratorio AulaFlow Dart Domain Lab**

**Haz:** Refactoriza el starter por hitos y completa decisiones/evidencia

**Comprueba:** Formato, analyzer y ejecución terminan; las reglas principales quedan protegidas

**Conserva o entrega:** Paquete Dart + `DECISIONES.md` + `EVIDENCIA.md`

### Paso 8 · 45 min

**Lee o consulta:** **Debugging y cierre** + Q06–Q12

**Haz:** Repara el caso de debugging, revisa la entrega y resuelve tu microvariación sin agente

**Comprueba:** Reproduces el fallo, explicas la causa, verificas la reparación y completas la autoevaluación

**Conserva o entrega:** Entrega PM2 e I3 por taller o vía autónoma equivalente

**Tiempo total: 480 min.**

Los pasos 4 y 8 son alternativas de 45 minutos efectivos: taller presencial o misión autónoma desde casa, no ambas. Las franjas 19:30–20:25 son de 55 minutos nominales, con 10 de margen. Los 10 minutos que dejan de exigirse en cada misión se emplean en el paso 5 (decisiones de clases) y en el paso 7 (pruebas y evidencia del laboratorio); la unidad sigue sumando 480 minutos.

<h3>Calendario de PM2</h3><ul><li><strong>Abierta desde:</strong> <time datetime="2026-10-07T00:00:00+02:00">7 de octubre de 2026</time>.</li><li><strong>Taller opcional 2:</strong> <time datetime="2026-10-13T19:30:00+02:00">13 de octubre · 19:30–20:25</time>.</li><li><strong>Entrega recomendada:</strong> <time datetime="2026-10-18T23:59:00+02:00">18 de octubre · 23:59</time>.</li><li><strong>Cierre de entrega:</strong> <time datetime="2026-10-19T23:59:00+02:00">19 de octubre · 23:59</time>.</li></ul><p>Todos los horarios corresponden a Europe/Madrid.</p>

Intenta terminar y entregar antes del domingo 18 de octubre a las 23:59. La tarea seguirá abierta hasta el lunes 19 de octubre a las 23:59 para resolver incidencias o terminar el cierre. Después quedará cerrada: el 20/10 comienza la ventana de PM3.

La tarea «Entrega · AulaFlow Dart Domain Lab» muestra estos mismos plazos. Avisos solo complementa la ruta y la tarea.

## Cómo trabajar en cada práctica

Usa siempre esta secuencia:

1. **Lee** el fragmento y localiza el concepto que está en juego.
2. **Predice** valor, tipo, salida o error antes de ejecutar.
3. **Ejecuta** el estado inicial.
4. **Modifica una sola cosa**.
5. **Vuelve a ejecutar** y compara con la predicción.
6. **Explica** la regla en una o dos frases.

Copiar un resultado que no puedes predecir o explicar no cierra el checkpoint.

## Talleres presenciales opcionales

- **06/10/2026 · 19:30–20:25**: primera sesión planificada de PM2 sobre ejemplos, katas y starter. No se da por realizada ni se acredita asistencia. La misión autónoma sigue disponible.
- **13/10/2026 · 19:30–20:25**: debugging, feedback y microvariación individual.
- **29/09/2026**: festivo; no hay sesión ni trabajo añadido. La ruta autónoma continúa con los pasos 5–7.

Puedes completar PM2 sin asistir. El recurso **Talleres opcionales PM2** contiene la misión autónoma equivalente. Si la I3 no se realiza en el taller, recibirás la misma clase de microvariación mediante AULES y dejarás predicción, cambio, ejecución y explicación. Si la evidencia sigue siendo dudosa, se realizará una comprobación focalizada en tutoría.

## Qué debes entregar

La entrega demuestra que sabes generar la estructura de clases necesaria y defenderla.

Entrega:

1. el paquete Dart del laboratorio;
2. `DECISIONES.md`;
3. `EVIDENCIA.md`;
4. la evidencia breve de tu microvariación individual.

Consulta **Evaluación y entrega PM2** para ver formato, criterios, IA y comprobaciones. La tarea «Entrega · AulaFlow Dart Domain Lab» repite la apertura, la entrega recomendada y el cierre indicados en este calendario.

## Si te bloqueas

No escribas solamente «no funciona». Conserva:

- paso de la Ruta;
- comando ejecutado;
- mensaje completo;
- fichero o línea;
- qué esperabas ver;
- qué has probado ya.

Después consulta **Ayuda PM2**. Si el problema continúa, publica esa información en el canal indicado o solicita tutoría individual. No compartas contraseñas, tokens, rutas personales completas ni datos de otras personas.

## Qué no forma parte de PM2

No necesitas widgets, navegación, gestión de estado Flutter, API, autenticación, persistencia, sensores, multimedia, DevTools/CI como contenido ni SDD. Los tests y el analyzer que aparecen aquí son mecanismos de comprobación del material, no una unidad adelantada de calidad.

