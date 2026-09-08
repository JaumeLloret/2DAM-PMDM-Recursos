# Guía del alumnado · PM1

## Qué vas a conseguir

Al terminar podrás:

- explicar por qué una app móvil no se diseña como si recursos y red fueran infinitos;
- comparar tecnologías móviles con criterios;
- justificar por qué usaremos Flutter y reconocer cuándo no es la mejor elección;
- preparar y diagnosticar Flutter + Android;
- describir un perfil dispositivo–aplicación;
- leer la estructura de una app Flutter existente;
- realizar una modificación funcional;
- demostrarla en un emulador y explicar el cambio.

## Qué debes entregar

1. `DOSSIER_PM1.md` completado.
2. Tu copia modificada de `mobile_profile_lab`, sin `build/` ni `.dart_tool/`.
3. Un diff o descripción exacta de archivos/líneas modificadas.
4. Evidencia de ejecución en emulador antes y después.
5. Verificación individual breve cuando te convoque el docente.

No incluyas nombres de usuario, rutas personales completas, tokens, claves, correos ni capturas con datos sensibles.

## Ruta obligatoria · 6 h

| Paso | Tiempo | Haz esto | Checkpoint |
|---|---:|---|---|
| 1 | 20 min | diagnóstico inicial | conoces tu punto de partida y bloqueos |
| 2 | 75 min | contenidos 1–3 + comparación | justificas una tecnología en tres escenarios |
| 3 | 35 min | perfiles de dispositivo/aplicación | completas una ficha coherente |
| 4 | 90 min | instala y diagnostica toolchain/emulador | guardas comandos y salida relevante |
| 5 | 40 min | ejemplo guiado | dibujas el flujo de la app |
| 6 | 55 min | taller o ruta equivalente + verificación individual | starter ejecutado + cambio asignado + autenticidad |
| 7 | 25 min | termina el laboratorio | diff y antes/después |
| 8 | 20 min | autoevaluación y empaquetado | entrega verificable |
| **Total** | **360 min** |  | **6 h** |

La **verificación individual de 5–8 min forma parte del paso 6** o de su equivalente tutorizado; no añade una tarea ni horas adicionales a las 6 h de PM1. Si por tamaño del grupo no puede completarse durante el taller, el docente programará la parte restante en una franja de verificación/tutoría sin añadir contenido nuevo.

Si terminas antes, revisa; no abras contenido de PM2. Si necesitas más tiempo por instalación, registra el bloqueo y solicita la ruta de contingencia.

## Cómo encaja el gimnasio en las 6 h

Los tiempos de [04_GIMNASIO_PM1](04_GIMNASIO_PM1.md) **ya están incluidos dentro de la ruta de 360 min**. No debes sumar sus minutos otra vez.

| Gimnasio | Se realiza dentro de |
|---|---|
| G0 · Diagnóstico · 20 min | Paso 1 · diagnóstico inicial |
| G1–G3 · 40 min | Paso 2 · ecosistema/comparación |
| G4–G5 · 35 min | Paso 3 · perfiles |
| G7 · 15 min | Paso 4 · toolchain/diagnóstico |
| G6 · 15 min | Paso 5 · lectura del starter |

El tiempo restante de cada paso corresponde a lectura, contraste, preparación técnica, ejemplo guiado y registro de evidencias. El gimnasio es **entrenamiento integrado**, no una carga extra.

## Orden de trabajo

1. Copia [la plantilla de dossier](../Alumnado/01_PLANTILLA_DOSSIER_PM1.md).
2. Completa el diagnóstico publicado en AULES.
3. Estudia [02_CONTENIDOS_PM1](02_CONTENIDOS_PM1.md).
4. Resuelve las actividades de [04_GIMNASIO_PM1](04_GIMNASIO_PM1.md) **cuando la ruta te las indique**, sin añadirlas al final como otra fase.
5. Completa [el checklist de entorno](../Alumnado/02_CHECKLIST_ENTORNO_PM1.md).
6. Sigue [03_EJEMPLOS_GUIADOS_PM1](03_EJEMPLOS_GUIADOS_PM1.md) con el starter sin modificar.
7. Realiza [05_LABORATORIO_PM1](05_LABORATORIO_PM1.md) en una copia.
8. Usa [la plantilla de entrega](../Alumnado/03_PLANTILLA_ENTREGA_PM1.md).
9. Pasa la autoevaluación y entrega.

## Regla de los 12 minutos

Si un paso técnico te bloquea:

1. lee el mensaje completo;
2. copia comando y error en el dossier;
3. identifica la primera línea que cambia de normal a error;
4. consulta la tabla de diagnóstico;
5. prueba **una** corrección;
6. si tras 12 minutos no avanzas, pide ayuda aportando esas evidencias.

«No funciona» no permite diagnosticar; comando + salida + hipótesis sí.

## Obligatorio y opcional

**Obligatorio**

- Android como target común;
- ejecución real en un emulador;
- modificación funcional;
- explicación individual;
- ruta sin IA disponible.

**Opcional**

- segundo AVD;
- dispositivo Android físico como contraste;
- iOS si dispones de macOS/Xcode;
- rutas de ampliación.

Una ejecución web no sustituye la evidencia de emulador.

## Uso responsable de IA

Si el docente permite IA, úsala solo como apoyo. Nunca compartas secretos o datos personales. Anota qué sugerencia utilizaste, cómo la verificaste y qué corregiste. Debes entender todo lo entregado.

La verificación individual se realiza sin agente. Si no puedes explicar o adaptar el cambio, esa evidencia no acredita aprendizaje.

## Criterio de éxito

Antes de entregar debes poder responder, sin leer:

1. ¿Qué recurso o condición del dispositivo limita tu caso?
2. ¿Por qué Flutter es razonable aquí y qué coste conserva?
3. ¿Qué perfil de dispositivo has definido?
4. ¿Qué hacen [pubspec.yaml](../Alumnado/Starter/mobile_profile_lab/pubspec.yaml), [lib/](../Alumnado/Starter/mobile_profile_lab/lib) y `main.dart`?
5. ¿Qué clases/widgets relevantes has localizado?
6. ¿Qué cambiaste, dónde y con qué resultado?
7. ¿Qué emulador usaste y cómo lo demuestra tu evidencia?

