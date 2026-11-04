# Evaluación PM6

Aquí importa **qué comportamiento puedes demostrar y explicar**, no cuántos tests acumulas. RA2.g pide pruebas de interacción usuario-aplicación para optimizar la app desde emuladores; RA2.h pide empaquetarla y desplegarla en un dispositivo móvil real. El [dossier único Q01–Q05](../Alumnado/01_REGISTRO_CALIDAD_PM6.md) acompaña código y observación; [la autoevaluación](12_AUTOEVALUACION_PM6.md) te ayuda a detectar pendientes antes de entregar.

| CE | Literal canónico |
|---|---|
| RA2.g | Se han realizado pruebas de interacción usuario-aplicación para optimizar las aplicaciones desarrolladas a partir de emuladores. |
| RA2.h | Se han empaquetado y desplegado las aplicaciones desarrolladas en dispositivos móviles reales. |

| CE | Evidencia | Instrumento | Autenticidad | Recuperación |
|---|---|---|---|---|
| RA2.g | Q01/Q02 y corrección; Q03 inspección; Q04 interacción en emulador con entorno/recorrido | Revisión de producto/dossier y observación estructurada | I3: fallo o cambio no preparado sin agente, prueba y explicación del diff | Museo: aforo/FIFO/identidad, nueva interacción en emulador |
| RA2.h | Q04 APK identificada e instalación/recorrido en dispositivo móvil real | Checklist de empaquetado/despliegue y observación docente o evidencia según procedimiento institucional | Explicar artefacto/versión/destino y repetir paso acotado | Nueva APK Museo y despliegue físico observado |

I1: entrenamiento/cuestionario formativos. I2: desempeño del producto y dossier. I3: **22 min de microcambio no preparado sin agente + 10 min de explicación individual supervisada**, dentro de T2 de **45 min efectivos**; si faltas al taller del 19/01/2027, existe cita/tutoría supervisada reprogramada dentro de la vía equivalente. La prueba presencial práctica global es familia separada y obligatoria ≥5; no se sustituye por un test online o este microcambio. RA2 conserva 35 % global; todos los RA ≥5 y evidencia auténtica suficiente. Sin pesos internos por tests, práctica, pipeline, cobertura, agente o dispositivo.

| CE | Consolidada | Suficiente | Parcial | Sin evidencia suficiente |
|---|---|---|---|---|
| g | Diseña casos discriminantes, explica límites y mejora interacción con evidencia comparada reproducible en emulador | Reproduce, corrige y verifica interacción en emulador, con resultados y límites claros | Hay tests en host pero falta emulador o no explica la mejora/defecto | No reproduce el fallo, adapta expectativas al bug o afirma evidencia inexistente |
| h | Reconstruye artefacto/corte, resuelve instalación y demuestra recorrido real con trazabilidad y límites | Empaqueta e instala/ejecuta la app en dispositivo real identificado de forma saneada | Hay APK o emulador, pero falta instalación real observada | No hay artefacto reproducible ni evidencia real suficiente |

Un build es evidencia parcial de h, no adquisición completa. Los controles automáticos no transforman un PENDIENTE_DISPOSITIVO en observado. Ante limitación de entorno, ofrecer acceso y fecha real; no imponer una penalización numérica automática. La autenticidad se triangula, no se deduce de un detector de IA. Registra por persona/CE evidencia, versión, descriptor, límite, feedback y recuperación.


## Qué adjuntar en la entrega ordinaria

Abre **Entrega tu producto y el dossier único** antes del **24/01/2027, 23:59** (Europe/Madrid). Puedes enviar hasta el **27/01/2027, 23:59** con la condición de tardía aprobada. El feedback está previsto para el 28/01.

1. Una copia del proyecto o enlace al repositorio accesible al docente, con commit identificado, `lib`, `test`, `integration_test`, `pubspec.yaml`, `pubspec.lock`, preparador y plataformas generadas. Excluye `.dart_tool`, `build`, cachés del IDE y datos privados.
2. El **único dossier Q01–Q05**, como `dossier_PM6.md` o PDF, que enlace el diff y las pruebas/observaciones ya obtenidas. No repitas las mismas capturas en otra memoria.
3. El workflow y enlace al run del corte, si existe. La APK identificada por su huella puede adjuntarse o enlazarse por el canal institucional; adjunta solo el archivo de práctica solicitado, nunca claves de firma.

El mini ejemplo no se entrega. Las katas y el cuestionario son entrenamiento formativo sin una entrega adicional. Si falta un destino, conserva el apartado pendiente y solicita acceso; una casilla no sustituye la observación requerida.

**Uso de IA:** puedes pedir explicaciones y ayuda durante la práctica, contrastar cada cambio y declarar brevemente qué asistencia incorporaste en Q05. Debes entender y poder modificar el resultado. I3 y la prueba práctica global se realizan sin agente. No envíes a un servicio externo tokens, datos del alumnado o código privado sin autorización.
