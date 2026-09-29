# Guía del alumnado · PM6

Vas a recibir una app que arranca y contiene defectos intencionales. Tu trabajo es demostrar qué falla, corregirlo, dejar pruebas útiles y construir una versión que puedas ejecutar en Android. Empieza en [la portada operativa](../AULES/01_EMPIEZA_AQUI_PM6.html), continúa por la [ruta humana](../Alumnado/00_RUTA_PM6.md) de **480 min** y rellena [un único dossier](../Alumnado/01_REGISTRO_CALIDAD_PM6.md). No hay porcentaje por test ni obligación de alcanzar un número mágico de cobertura.

## Prepara tu copia

Descarga solo [Starter](../Practica/Starter/quality_gate/README.md) y conserva una versión inicial. Usa Flutter 3.47.2/Dart 3.13.2. La [preparación de entorno e IDE](../Alumnado/06_ENTORNO_Y_FUENTES_PM6.md) explica VS Code/Android Studio y la carpeta `quality_gate` que contiene `pubspec.yaml`. Ejecuta `flutter pub get`, `flutter analyze --fatal-infos` y `flutter test`. Debe pasar el humo inicial; eso no significa que la app sea correcta. Si falla la herramienta, usa [Debugging](05_DEBUGGING_PM6.md) y [Ayuda](11_AYUDA_PM6.md), sin reinstalar un SDK distinto por ensayo y error.

## Ruta por tramos

| Tramo | Qué haces | Qué conservas | Si falla |
|---|---|---|---|
| A01–A03 | Arranca; lee teoría1–5; reproduce contador con dos abiertas y una completada; escribe expected/actual | Primer fallo y prueba mínima, versión del SDK | Error de dependencia no es fallo funcional: resolver entorno y repetir |
| T1/A04 | Completa estrategia unit/widget; controla respuestas fuera de orden; reintento y dispose | Tests de regresión y explicación de cada cambio | Usa Completer para controlar orden, no temporizadores aleatorios |
| A05 | Sigue el guion DevTools: inspector, lista eager/perezosa, history y memoria | Registro de entorno, recorridos, observaciones y límites | Si no hay modo profile/entorno adecuado, registra pendiente, no inventes tiempos |
| A06 | Genera plataforma Android con SDK fijado; construye APK; prepara CI y emulador/dispositivo | Comandos, versión, artefacto/huella y errores reales | Verifica SDK/licencias/espacio; no borres datos ajenos |
| T2/A07 | Ensaya recorrido, realiza microcambio sin agente, repite regresiones y completa evidencia Android | I3, registro de emulador y dispositivo físico diferenciados | Solicita turno real si no tienes hardware; build no sustituye instalación |
| A08 | Incorpora feedback, revisa permisos y entrega | Producto y dossier acotado | Mantén pendientes identificados y acuerda recuperación |

## Entrega única

Código fuente y tests; **un dossier** con apartados Q01–Q05; enlace al CI del SHA exacto si dispones de repositorio autorizado; evidencia de interacción en emulador; empaquetado e instalación en dispositivo real cuando se hayan observado. Si falta infraestructura, entrega lo verificable y el pendiente con cita solicitada: no afirmes que RA2.g/h están completos por un test host o una APK. Usa [¿Estoy listo?](12_AUTOEVALUACION_PM6.md). No subas logs con tokens, identificadores físicos ni datos de otras aplicaciones. El número de serie de adb se sustituye por DISPOSITIVO-A; el docente puede verificarlo por canal privado.

Las variantes de evaluación y solución son reservadas. Durante I3 trabajas sin agente y explicas el diff. Una explicación que no coincide con la ejecución requiere nueva evidencia, no una acusación automática. La prueba práctica presencial global sigue siendo obligatoria y separada.

## Ausencia y entregas

Consulta las [consignas completas de T1 y T2](10_TALLERES_Y_EQUIVALENCIAS_PM6.md): eliges taller opcional o misión desde casa de **45 min efectivos** (franja nominal 55), nunca ambos. T1 es el 12/01/2027 y T2 el 19/01/2027, 19:30–20:25. T2 permite preparar el recorrido desde casa, pero I3 requiere **22 min de microcambio no preparado sin agente y 10 min de explicación individual supervisada**; si no asistes, solicita cita reprogramada dentro del mismo bloque de 45 min. La apertura, entrega objetivo y cierre de PM6 aún requieren confirmación docente y deben publicarse aquí y en AULES antes de abrir la unidad; los talleres no son plazos de entrega. La fecha de entrega debe permitir A07/A08 tras T2. Retraso justificado se reprograma; no justificado ≤72 h se acepta tardío sin rebaja automática; más de 72 h pasa a recuperación de los CE afectados.
