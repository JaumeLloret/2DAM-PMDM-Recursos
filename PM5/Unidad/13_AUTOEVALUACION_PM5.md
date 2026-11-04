# PM5 · ¿Estoy listo para entregar?

Esta parada comprueba tu aprendizaje y está incluida en la fase 11. La página «Revisa la entrega» solo comprueba el paquete de archivos; no debes repetir esta lista en el cuaderno. No sustituye I2, I3 ni la prueba presencial global.

Estados que puedes usar: `OBSERVADA_REAL`, `OBSERVADA_FAKE_TEST`,
`PENDIENTE_HARDWARE`, `PENDIENTE_PERMISO_ENTORNO` y
`RECUPERACION_REQUERIDA`.

## Arranque y carriles

- [ ] El starter DEMO arranca desde la carpeta que contiene `pubspec.yaml`.
- [ ] He guardado versiones, destino y resultados reales de analyze/tests.
- [ ] Sé qué realicé en DEMO y qué observé en Android real.
- [ ] Cada capacidad tiene uno de los cinco estados de evidencia permitidos.
- [ ] No he convertido `OBSERVADA_FAKE_TEST` en `OBSERVADA_REAL`.
- [ ] Si falta hardware, he marcado la capacidad concreta y planificado observación posterior.

## Permisos y lifecycle

- [ ] La app solicita cero permisos al abrir.
- [ ] Cámara/BLE se solicitan desde su acción.
- [ ] Distingo granted, denied, permanentlyDenied, restricted, limited y capacidad unavailable.
- [ ] Denegar una feature no desactiva las demás.
- [ ] Sé quién crea, posee y cancela scan, conexión, sensor, picker, player y animación.
- [ ] `paused/resumed/dispose` no dejan recursos activos ni reabren acciones sensibles sin contexto.

## BLE

- [ ] Entiendo central, periférico, anuncio, scan, servicio, characteristic y GATT.
- [ ] Scan está limitado, cancelable y sin duplicados.
- [ ] Se detiene scan antes de conectar.
- [ ] Hay timeout, desconexión observable y cleanup.
- [ ] No presento write confirmada como respuesta de negocio.
- [ ] No persisto ni entrego MAC/ids/UUID de instancia.
- [ ] Para BLE físico he comprobado Android API 31+, radio, permiso, `BleStatus.ready` y periférico; o consta pendiente.

## Sensores y streams

- [ ] Distingo muestra, frecuencia y repintado visual.
- [ ] El stream trata dato, error y final.
- [ ] He probado sensor ausente/error con fake.
- [ ] Iniciar dos veces no duplica suscripción.
- [ ] Pausar/dispose detiene eventos.

## Captura y pipeline multimedia

- [ ] Uso fixture o escena neutra `DEMO-*`.
- [ ] Cancelar picker no borra un borrador válido.
- [ ] `recoverLost()` vuelve al mismo pipeline.
- [ ] Valido tamaño, MIME y decodificación.
- [ ] La salida JPEG es conversión real: MIME, dimensiones y firma `FF D8`.
- [ ] Ancho ≤1024 y calidad/regla documentadas.
- [ ] Original/derivada usan espacio privado y nombres controlados.
- [ ] La evidencia no expone rutas personales.
- [ ] `AttachmentDraft` sigue local y muestra que `PROD-01` está pendiente.

## Player, animación y errores

- [ ] Puedo recorrer load/play/pause/error/dispose.
- [ ] Play antes de load produce un error recuperable.
- [ ] El audio es sintético; no se solicita micrófono.
- [ ] La animación responde a estado y respeta reducción de movimiento.
- [ ] He depurado permiso/BLE, stream/lifecycle y media/player con cambio mínimo y regresión.

## Entrega y autenticidad

- [ ] I1 contiene 15 katas terminadas antes del 10/12 en un único cuaderno y al menos tres correcciones.
- [ ] I2 incluye app, diff, decisiones, registro, comandos y demostración.
- [ ] I3 incluye predicción, 23 min sin agente, diff, ejecución, regresión y explicación.
- [ ] He declarado para qué usé IA, qué acepté/rechacé y cómo lo verifiqué.
- [ ] No incluyo `build/`, `.dart_tool/`, `.env`, soluciones ni material reservado.
- [ ] No incluyo fotos/audio personales, ubicación, cuentas, MAC, serial, ids, rutas o logs crudos.
- [ ] Sé explicar una suscripción, una excepción y una decisión de arquitectura.

## Si queda una casilla pendiente

| Bloqueo | Vuelve a |
|---|---|
| Flutter/editor/destino/API | Preparación + Ayuda |
| permisos/lifecycle | Teoría 2–3 + E1–E3 + K1–K3 |
| BLE | Teoría 4 + E4–E6 + K4–K5 |
| sensor | Teoría 5 + E7–E8 + K6–K7 |
| media/lost-data/store | Teoría 6 + E9–E12 + K8–K11 |
| player/animación | Teoría 7–9 + E13–E14 + K12–K14 |
| reparación | Debugging + E15/K15 |
| entrega/evidencia | Evaluación + checklist + registro |

`NO EJECUTADO` o un estado pendiente es más útil que un PASS inventado. Entrega cuando puedas explicar qué funciona, cómo lo comprobaste y qué sigue pendiente.
