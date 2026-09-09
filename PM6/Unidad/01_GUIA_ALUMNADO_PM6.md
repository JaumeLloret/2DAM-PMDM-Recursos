# Guía del alumnado · PM6

Vas a recibir una app que arranca y contiene defectos intencionales. Tu trabajo es demostrar qué falla, corregirlo, dejar pruebas útiles y construir una versión que puedas ejecutar en Android. La [ruta](../Alumnado/00_RUTA_PM6.md) suma480min, incluidos cuestionario, talleres y entrega. No hay porcentaje por test ni obligación de alcanzar un número mágico de cobertura.

## Prepara tu copia

Descarga solo [Starter](../Practica/Starter/quality_gate/README.md) y conserva una versión inicial. Usa Flutter 3.47.2/Dart 3.13.2. Abre una terminal en la carpeta quality_gate, no en lib. Ejecuta `flutter pub get`, `flutter analyze` y `flutter test`. Debe pasar la prueba de humo inicial; eso no significa que la app sea correcta. Si falta Flutter, vuelve a la preparación PM1/PM5 con ayuda focal, sin reinstalar un SDK distinto por ensayo y error.

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

Código fuente y tests; un dossier Q01–Q05 usando las [plantillas](../Alumnado/01_REGISTRO_CALIDAD_PM6.md); enlace al CI del SHA exacto si dispones de repositorio autorizado; evidencia de interacción en emulador; empaquetado e instalación en dispositivo real. No subas logs con tokens, identificadores físicos ni datos de otras aplicaciones. El número de serie de adb se sustituye por DISPOSITIVO-A; el docente puede verificarlo por canal privado.

Las variantes de evaluación y solución son reservadas. Durante I3 trabajas sin agente y explicas el diff. Una explicación que no coincide con la ejecución requiere nueva evidencia, no una acusación automática. La prueba práctica presencial global sigue siendo obligatoria y separada.

## Ausencia y entregas

T1 equivalente55min:10leer fallo+25prueba/corrección+15contraste+5salida. T2 equivalente55min:8preparación+10recorrido+22microcambio+10explicación+5salida en cita supervisada cuando corresponda; un ensayo autónomo no sustituye autenticidad observada. Estas rutas sustituyen sesiones, no se suman. La fecha de entrega debe permitir A07/A08 tras T2. Retraso justificado se reprograma; no justificado≤72h se acepta tardío sin rebaja automática; más de 72 h pasa a recuperación de los CE afectados.
