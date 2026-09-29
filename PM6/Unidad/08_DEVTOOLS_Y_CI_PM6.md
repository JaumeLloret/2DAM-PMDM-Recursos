# PM6 · DevTools y CI desde una observación honesta

Esta guía ocupa **A05 (70 min, incluidos 10 min redistribuidos desde T2)** y la parte CI de **A06 (55 min)**; no añade horas. Usa tu copia de `quality_gate`. Primero corrige el error/retry para que el recorrido sea realizable. Conserva en Q03/Q05 qué ejecutaste y qué quedó pendiente. La lista lógica `history` puede medirse en host; una gráfica de memoria requiere DevTools realmente conectado.

## Inspector · encontrar qué produce la pantalla

1. Selecciona destino con `flutter devices` e inicia `flutter run -d <ID_LOCAL>` en modo debug. El ID es local y se elimina del dossier.
2. Abre DevTools desde *Open DevTools* en VS Code/Android Studio o desde el enlace que muestra la terminal de Flutter. Si hay varios procesos, comprueba título `Quality Gate · DEMO`.
3. En **Flutter Inspector**, selecciona el contador `Pendientes:` y sigue su widget hasta `controller.pendingCount`. Pulsa *Reintentar* y un trabajo; contrasta texto y estado. Aumenta texto si el destino lo permite y busca overflow real.
4. En Q03 guarda destino/modo, pasos, observación textual y una captura saneada si aporta algo. Inspector muestra árbol/layout de esa ejecución; no acredita Performance ni dispositivo físico por sí solo.

## Performance · misma carga y recorrido

1. Usa un emulador o dispositivo compatible y reinicia con `flutter run --profile -d <ID_LOCAL>`. Conecta DevTools y abre **Performance**. Si profile no está disponible, no inventes tiempos a partir de debug: `PENDIENTE_DEVTOOLS`.
2. Declara destino, frecuencia/objetivo de pantalla, modo, Flutter y dataset. Prepara **la misma lista DEMO de 1500 elementos** y el mismo recorrido para variante eager y `ListView.builder`. Haz un calentamiento separado, después registra **tres** recorridos por variante: carga, retry, scroll inicial→final y cinco recargas. Cambia solo la estrategia de construcción de lista.
3. Conserva la traza/sumario de cada repetición, identifica frames UI/raster y posibles picos. Si el destino es 60 Hz, el presupuesto orientativo es 16,7 ms/frame; si 120 Hz, 8,3 ms. Declara la frecuencia observada; no apliques una cifra universal.
4. Escribe observación, hipótesis, variación y límite. No anuncies una mejora porcentual sin mediciones propias comparables. El test host de lista no mide jank.

## Memory · separar referencias de heap

1. En host prueba el límite `history` (20 snapshots) con entradas controladas. Eso demuestra **retención lógica**.
2. En la app conectada abre **Memory**; tras calentamiento toma corte inicial, ejecuta 25 cargas con el mismo dataset y toma corte final. Observa asignaciones, objetos/referencias y comportamiento tras GC cuando sea pertinente. Anota también versión, modo, destino y recorrido.
3. Compara con la hipótesis: si `history` mantiene referencias, algunas listas siguen alcanzables; un GC o RSS que no baja inmediatamente no prueba por sí solo una fuga. Repite antes de concluir.
4. Guarda observación real y límite en Q03. Si no ejecutaste la herramienta escribe `PENDIENTE_DEVTOOLS`, protocolo previsto y solicitud de turno, sin pegar una gráfica ajena ni inventar MB liberados.

## CI · qué significa que un commit esté verde

Un **workflow** es el archivo YAML en `.github/workflows/quality.yml` de la raíz del repositorio de práctica de tu app. `on` es el evento (push/PR); un **job** agrupa pasos en un **runner**; `checkout` recupera un corte; cada **step** deja log. [Entorno y fuentes](../Alumnado/06_ENTORNO_Y_FUENTES_PM6.md#A06--Primer-workflow-de-calidad) incluye un YAML completo con permisos de lectura y Flutter 3.47.2. Léelo así:

| Paso | Pregunta al leer el log |
|---|---|
| Trigger y checkout | ¿Qué evento y qué SHA se ejecutaron? ¿`git rev-parse HEAD` coincide? |
| `flutter pub get` | ¿Se recuperaron dependencias del lock? |
| `dart format --output=none --set-exit-if-changed` | ¿Hay diff de formato que revisar? |
| `flutter analyze --fatal-infos` | ¿Cuál es el primer archivo/línea con diagnóstico? |
| `flutter test` | ¿Falló una aserción funcional o el montaje? |
| `flutter build apk --debug` local/CI cuando corresponda | ¿Se generó artefacto del SHA indicado? |

Primero ejecuta los comandos en tu copia. Crea un commit y sube una rama al **repositorio de práctica autorizado**; abre *Actions → Calidad PM6 → run → host → primer step rojo o resumen verde*. Copia URL, SHA impreso, nombre del paso, resultado y primer fallo causal a Q05. Si haces un cambio después, el verde anterior pertenece al commit anterior. Si Actions está deshabilitado, guarda YAML, resultados locales y `PENDIENTE_CI`, y acuerda cuándo ejecutarlo.

El YAML de ejemplo ejecuta formato, análisis y pruebas host; su mera mención de `integration_test` al formatear **no ejecuta un emulador**. `flutter build apk --debug` construye una APK; **no instala ni recorre** un móvil real. Guarda por separado la prueba de emulador (RA2.g), el build/CI y la observación del dispositivo (RA2.h). No hacen falta secretos ni credenciales de AulaFlow.
