# PM3 · Evaluación y entrega

## Qué vas a demostrar

PM3 aporta evidencia del CE primario RA2.b:

> Se han analizado y utilizado las clases que modelan ventanas, menús, alertas y controles para el desarrollo de aplicaciones gráficas sencillas.

No se crean pesos internos ni mínimos nuevos. RA2 conserva su peso global y la prueba presencial global de PMDM continúa separada.

## Tres instrumentos, una misma historia

- **I1 · entrenamiento formativo:** ejemplos, predicciones, 12 katas y debugging. Te prepara; no son doce entregas.
- **I2 · artefacto:** app ejecutable, decisiones y comprobaciones reproducibles.
- **I3 · microvariación individual:** cambio pequeño sin agente y explicación propia.

## Qué debes entregar

1. La carpeta del proyecto Flutter o un ZIP creado desde ella.
2. `02_PLANTILLA_DECISIONES_PM3.md` cumplimentada.
3. `03_CHECKLIST_ENTREGA_PM3.md` con comprobaciones reales.
4. `04_REGISTRO_ENTREGA_PM3.md` con versiones, comandos y resultados.
5. Mapa antes/después y dos capturas sin datos personales: vista compacta y ancha.
6. Evidencia de texto ampliado y teclado/foco con la herramienta realmente usada.
7. Evidencia breve de I3: predicción, cambio, ejecución y explicación.

Envía en **PM3 · Entrega tu aplicación y sus evidencias**. Apertura: **18/10/2026 00:00**. Entrega recomendada: **01/11/2026 23:59**. Cierre de recepción: **02/11/2026 23:59**, Europe/Madrid. Puedes enviar entre la fecha recomendada y el cierre; el retraso no rebaja automáticamente la competencia. PM4 comienza el **03/11/2026**. Consulta en el formulario el límite técnico de archivo.

## Estructura y comprobación antes de comprimir

Abre una terminal en la carpeta que contiene `pubspec.yaml`:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

Después comprueba que la app permite recorrer lista, tablero, ajustes y detalle; que un id inválido no bloquea; que cancelar un diálogo no cambia datos y confirmar sí produce cambio y feedback.

Antes de comprimir, elimina `build/`. No elimines `pubspec.yaml`, `lib/`, `test/`, decisiones, checklist ni registro.

## Qué no debes incluir

- `build/`, `.dart_tool/` si la tarea no la solicita, `.env` o claves;
- tokens, cuentas, correos, rutas personales completas o datos reales;
- solución docente, oráculos o materiales de `Docente/`;
- capturas con información personal;
- plataformas generadas innecesarias si la tarea no las requiere.

## Criterios visibles

| Foco | Evidencia sólida |
|---|---|
| UI gráfica | pantalla, menú, alerta y controles funcionan y puedes explicar su propósito |
| Adaptación | bar/rail dependen del espacio y no pierden contenido a 390/900 px |
| Navegación | rutas declarativas, id estable, detalle y salida para id inválido |
| Estado | distingues local/feature y mantienes una única fuente observable |
| Separación | View → ViewModel → Repository responde a responsabilidades reales y usa DI por constructor |
| Interacción | cancelar/confirmar, feedback, vacío/error/reintento son coherentes |
| Accesibilidad | texto grande, etiquetas y teclado/foco se comprueban con evidencia real |
| Autenticidad | puedes modificar y explicar causalmente tu propio artefacto |

El juicio es criterial sobre el conjunto. Una dimensión sin evidencia suficiente queda pendiente; no se oculta mediante una media inventada.

## I3 con o sin taller

La microvariación dura **23 minutos** y se realiza sin agente. Puede observarse en el taller opcional del 27/10 o asignarse por AULES mediante la misión autónoma equivalente.

En ambas vías debes:

1. predecir ficheros y estado afectados;
2. realizar un cambio pequeño sobre tu copia;
3. ejecutar y conservar el resultado;
4. explicar evento → comando → estado → `notifyListeners` → rebuild;
5. responder una pregunta de límites.

Si la evidencia no permite comprobar comprensión, se hará una comprobación focalizada. No se repite automáticamente toda PM3.

## IA y otras ayudas

La IA es opcional durante el aprendizaje e I2. Declara para qué la utilizaste, qué aceptaste o rechazaste y cómo verificaste el resultado. No se evalúa la forma del prompt. I3 se realiza sin agente.

## Si el entorno está bloqueado

Registra `PENDIENTE_ENTORNO` con sistema, comando y primer error. Puedes avanzar en predicción y diseño, pero una salida ajena no sustituye tu ejecución. Se habilitará una comprobación equivalente supervisada cuando proceda; un bloqueo técnico documentado no se confunde automáticamente con falta de aprendizaje.

## Recuperación

Si queda un foco pendiente, usarás `RepairDesk UI` para producir evidencia nueva únicamente de ese foco. Se aplica el mismo CE y criterio, sin penalización adicional ni repetición automática de toda la unidad.
