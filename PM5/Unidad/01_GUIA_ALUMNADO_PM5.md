# PM5 · Ruta de aprendizaje

## La misión

Vas a completar **AulaFlow Device & Media Companion**, una app Flutter con cuatro zonas: permisos/BLE, sensor, imagen y audio/animación. Aprenderás a tratar una capacidad del dispositivo como algo que puede estar disponible, denegado, desconectado o interrumpido por el lifecycle.

El resultado no se sube a AulaFlow. La app crea un `AttachmentDraft` local con datos `DEMO-*` y muestra que la subida sigue pendiente de `PROD-01`.

## La regla que guía toda PM5

Hay dos carriles. Puedes avanzar pedagógicamente por el primero; el segundo aporta observación física cuando el CE la necesita.

| Carril | Para qué sirve | Qué demuestra | Qué no demuestra |
|---|---|---|---|
| **A · DEMO / FAKE** | aprender, provocar errores, repetir y depurar sin hardware | lógica, estados, arquitectura, conversión real de fixtures y cleanup determinista | radio, sensor, cámara, diálogo runtime ni lifecycle físicos |
| **B · ANDROID REAL / HARDWARE** | observar el sistema operativo y el dispositivo | la capacidad concreta que se ha ejecutado y observado | otras capacidades que no se hayan probado |

Cierra cada actividad con uno de estos estados exactos:

- `OBSERVADA_FAKE_TEST`: ejecutada solo con fake/fixture;
- `OBSERVADA_REAL`: observada realmente por el docente con dispositivo/periférico;
- `PENDIENTE_HARDWARE`: falta móvil, sensor o periférico;
- `PENDIENTE_PERMISO_ENTORNO`: el entorno impide observarla;
- `RECUPERACION_REQUERIDA`: existe ejecución, pero no demuestra todavía el CE.

**Nunca cambies `OBSERVADA_FAKE_TEST` por `OBSERVADA_REAL` solo porque el test esté verde.**

## Qué reutilizas de PM3 y PM4

PM5 no vuelve a enseñar UI, navegación, estado, ViewModel, Repository, REST o autenticación. Antes de empezar debes poder:

- leer Dart con `Future`, `Stream`, null safety, clases e interfaces;
- reconocer `View → Controller/ViewModel → puerto → adaptador`;
- ejecutar `flutter pub get`, `flutter run`, `flutter analyze` y `flutter test`;
- representar un error tipado sin mostrar excepciones crudas en la interfaz.

Si un punto falla, usa el recordatorio de PM3/PM4. No necesitas backend, cliente HTTP ni subida de adjuntos.

## Herramientas y hardware

- **VS Code + Flutter/Dart** es la opción recomendada para editar.
- **Android Studio + Flutter/Dart** también es válido y se usa para SDK Manager y Device Manager.
- App: Android API mínima 24.
- BLE físico obligatorio de PM5: Android 12+ / API 31+ y periférico compatible.
- AVD: útil para app, permisos y lifecycle parciales; no acredita BLE físico y no sustituye un sensor/cámara reales.
- Sin hardware: empieza y continúa en DEMO. La observación física queda registrada, no inventada.

La preparación completa está en `05_PREPARACION_PLATAFORMA_PM5.md`.

## Primera microvictoria · sin hardware

1. Descarga **PM5_MATERIALES_ALUMNADO.zip**, descomprímelo y abre su carpeta **PM5/**.
2. Desde esa raíz ejecuta el preparador; después entra al starter:

```bash
dart run Alumnado/preparar_pm5.dart starter
cd Practica/Starter/aulaflow_device_media_starter
flutter analyze
flutter test
flutter run -d chrome
```

3. Abre la carpeta del starter, con `pubspec.yaml`, en VS Code o Android Studio. El preparador genera Android/web y conserva las pruebas originales.

4. En la app `PM5 · Starter DEMO`, pulsa:
   - **Escanear DEMO**: aparece `Periférico DEMO`;
   - **Iniciar sensor DEMO**: cambia el valor `x=`;
   - **Procesar fixture DEMO**: aparece tipo y tamaño.
5. Conserva comandos y resultado mínimo. Etiqueta: `OBSERVADA_FAKE_TEST`.

Si `flutter devices` está vacío o la app no abre, no cambies todavía permisos/BLE/media: ve a Preparación o Ayuda.

## Aprende con archivos que puedes ejecutar

Abre **Descarga y prepara el proyecto** y sigue `Alumnado/06_RECORRIDOS_GUIADOS_PM5.md`. Primero practica botón→permiso→mensaje y stream→pantalla; después PNG→JPEG y load→play→pausa. El ejemplo separado incluye código, fixtures válidos y tests. Usa su README para localizar cada E1–E15. Este trabajo está dentro de las fases de ejemplos/katas; no añade horas ni otra entrega.

## Método de trabajo

En ejemplos y katas sigue siempre:

**LOCALIZA → PREDICE → EJECUTA → OBSERVA → MODIFICA → VERIFICA → EXPLICA → CLASIFICA EVIDENCIA**

No se entregan quince miniaplicaciones. Trabajas sobre una copia del starter y conservas un único cuaderno con predicciones, diffs pequeños y resultados.

## Ruta completa · 720 minutos

En las fases 4, 7 y 10 eliges **taller opcional o misión autónoma equivalente**. Las dos vías duran 45 min efectivos, persiguen la misma finalidad y producen la misma clase de evidencia. No haces ambas.

| Fase | Lee/consulta | Haz · carril principal | Comprueba y conserva | Min |
|---:|---|---|---|---:|
| 1 | Empieza aquí, esta Ruta y Preparación | **A:** arranca el starter DEMO y completa el mapa de capacidades. **B opcional:** identifica dispositivo/API sin pedir permisos. | microvictoria o bloqueo exacto; carril y estado inicial | 35 |
| 2 | Teoría 1–3; ejemplos E1–E3 | **A:** permisos fake y lifecycle determinista; K1–K3. **B:** observa un permiso runtime si el entorno está listo. | cero diálogos al abrir; mapa crea→posee→cancela; no se bloquean features independientes | 70 |
| 3 | Teoría 4; ejemplos E4–E6 | **A:** scan/conexión/DEMO-PING/error con fake; K4–K5. **B:** API31+, periférico y `BleStatus.ready`. | scan limitado, sin duplicados, stop antes de conectar, timeout/desconexión y estado FAKE/REAL | 80 |
| 4 | Talleres · misión 1 | Elige taller opcional o misión autónoma de permisos/BLE. | ticket causal con misma finalidad/evidencia; físico pendiente si procede | 45 |
| 5 | Teoría 5; ejemplos E7–E8 | **A:** muestras y error fake; K6–K7. **B:** sensor real si existe. | frecuencia frente a repintado, error/fin y cancelación observable | 90 |
| 6 | Teoría 6; ejemplos E9–E12 | **A:** selección fixture, lost-data fake, validación y JPEG real; K8–K11. **B:** selector/cámara con escena neutra. | MIME, tamaño, decode, dimensiones, firma JPEG, ruta privada saneada | 100 |
| 7 | Talleres · misión 2 | Elige taller opcional o misión autónoma de sensor/media/debugging. | incidencia reproducible, cambio mínimo y regresión | 45 |
| 8 | Teoría 7–10; ejemplos E13–E15 | **A:** audio DEMO, error y animación; K12–K15. **B:** reproducción/lifecycle real si procede. | load/play/pause/error/dispose y movimiento reducido | 90 |
| 9 | Debugging + Laboratorio | Integra permisos, BLE, sensor, media, player y lifecycle por hitos; reutiliza K15 ya realizada antes del 10/12. | app ejecutable, decisiones, registro, errores preparados y `AttachmentDraft` local | 75 |
| 10 | Talleres · misión 3 y Evaluación | Elige vía presencial o autónoma. Recibe una variante reservada; 23 min sin agente, después ejecuta y explica. | predicción, diff, resultado, regresión, explicación y estado físico honesto | 45 |
| 11 | Ayuda, ¿Estoy listo? y checklist | Revisa I1/I2/I3, sanea evidencia y prepara el paquete. | entrega completa o pendientes exactos; nunca un PASS inventado | 45 |
|  |  |  | **Total** | **720** |

## Fechas de la tarea de entrega PM5

- Apertura: `17/11/2026 00:00`.
- Entrega objetivo: `18/12/2026 23:59`.
- Cutoff (cierre de recepción): `21/12/2026 23:59`.

Estos tres campos están configurados en la tarea de entrega PM5 de AULES. Consulta esta ruta y la tarea para conocer los plazos; Avisos puede recordar un cambio, pero no es la única fuente.

La franja 19:30–20:25 conserva 55 min nominales (45 efectivos y 10 de margen). Las misiones desde casa duran 45 min y sustituyen la presencia. Los 30 min redistribuidos quedan en las fases 5, 8 y 11; PM5 sigue sumando 720 min.

Talleres opcionales: **24/11/2026** (permisos y BLE), **01/12/2026** (sensor, imagen y audio) y **15/12/2026** (I3), de 19:30 a 20:25. Cada bloque permite la misión autónoma equivalente, sin exigir asistencia ni duplicar el trabajo.

## Mapa rápido de permisos

| Acción | Se solicita al expresar intención | Si se deniega |
|---|---|---|
| buscar BLE | `bluetoothScan` | usa DEMO o vuelve a intentarlo tras explicación |
| conectar BLE | `bluetoothConnect` | BLE se detiene; sensor/media siguen disponibles |
| capturar escena | `camera` | selecciona fixture/galería permitida |
| sensor | capacidad del dispositivo; no permiso inventado en esta práctica | usa traza fake y registra hardware pendiente |
| audio DEMO | no pide micrófono | reproduce tono sintético local |

`unavailable` no significa lo mismo que `denied`: el primer caso indica que la capacidad/servicio no existe o no está listo; el segundo expresa el resultado de una solicitud de permiso.

## Qué entregarás

- `PM5_producto.zip` con proyecto ejecutable y carpeta de evidencias (consulta Evaluación);
- cuaderno I1 de 15 katas, con al menos tres errores corregidos (10/12/2026; cierre 13/12);
- `02_DECISIONES_PM5.md` y `04_REGISTRO_EVIDENCIAS_PM5.md`;
- diff respecto al starter y comandos reales de `analyze/test`;
- producto I2 y demostración con datos `DEMO-*` (18/12/2026; cierre 21/12);
- evidencia I3: predicción, microcambio, ejecución, regresión y explicación;
- lista de observaciones físicas realizadas y pendientes.

No incluyas `build/`, `.dart_tool/`, `.env`, soluciones, MAC/UUID de instancia, fotos/audio personales, ubicación, cuentas, rutas personales ni logs crudos.

## Si falta hardware

Continúa en DEMO, conserva la evidencia de aprendizaje y marca `PENDIENTE_HARDWARE` en la capacidad concreta. La equivalencia autónoma no convierte el fake en hardware. La observación física se agenda después con equipo del centro cuando el CE lo exija.

## Si te bloqueas

1. detente en el primer síntoma reproducible;
2. anota fase, carril, sistema, editor, destino, comando/acción y resultado esperado;
3. abre **Debugging PM5** si estás practicando el método o **Ayuda PM5** si buscas tu síntoma;
4. cambia una sola causa y ejecuta una regresión;
5. conserva el estado de evidencia real, aunque siga pendiente.

