# PM6 · ¿Estoy listo para entregar?

Marca **observado**, **pendiente con cita solicitada** o **por corregir**. Una casilla no convierte un recurso no ejecutado en evidencia. Vuelve a la [ruta](../Alumnado/00_RUTA_PM6.md) o [ayuda](11_AYUDA_PM6.md) si necesitas rescate.

## Producto y pruebas host · capa A

- [ ] Conservé copia/corte inicial, versión Flutter/Dart, comandos y smoke verde con su límite.
- [ ] Predije un defecto y lo reproduje con una aserción que lo discrimina (expected/actual).
- [ ] Clasifiqué el **rojo esperado** frente a errores de entorno; si salió verde de inicio revisé caso y corte.
- [ ] Corregí lo mínimo, obtuve verde y dejé regresión y caso límite.
- [ ] Comprobé dos Futures fuera de orden y error vigente frente a respuesta vieja.
- [ ] Comprobé error→retry→vacío, `loading` final y acción usable.
- [ ] Comprobé dispose/notificación tardía, toggle por ID y límite de retención lógica.
- [ ] Sé decir qué prueban unit y widget y qué queda fuera.

## Observación en destino · capa B

- [ ] Registré interacción visible o `integration_test` **ejecutado** en emulador y mejora justificada para RA2.g; si falta, `PENDIENTE_EMULADOR` y turno solicitado.
- [ ] Inspector: proceso, widget/estado y observación concreta, o `PENDIENTE_DEVTOOLS`.
- [ ] Performance: profile, misma carga/recorrido, calentamiento, repeticiones y traza; sin cifras prestadas.
- [ ] Memory: corte inicial/final, objetos/referencias e hipótesis, separado del test lógico `history`.

## Corte reproducible y móvil · capas C y D

- [ ] Ejecuté formato, análisis y tests sobre el código entregado; registré primeros errores reparados.
- [ ] Construí una APK de práctica y anoté SHA del código y huella del archivo, o estado real pendiente.
- [ ] Guardé workflow de práctica y run/step/resultado del **SHA exacto**; si Actions no se ejecutó, `PENDIENTE_CI`.
- [ ] Instalé APK, arranqué y recorrí la app en **móvil real autorizado**, con evidencia saneada para RA2.h; si falta, `PENDIENTE_DISPOSITIVO` y cita solicitada.
- [ ] No llamé «desplegado» a un simple build ni «Android real» a un widget test.

## Dossier, autoría y privacidad

- [ ] Un único dossier reúne Q01 fallo, Q02 corrección/regresión, Q03 DevTools, Q04 Android y Q05 SHA/CI/límites.
- [ ] En T1/T2 elegí taller **o** equivalente, sin duplicar horas.
- [ ] I3 contiene 22 min de microcambio sin agente y 10 min de explicación individual **supervisada**; si no asistí, acordé cita reprogramada.
- [ ] Código, tests, diff y dossier accesibles al docente corresponden al mismo corte o explican la diferencia.
- [ ] Eliminé cuentas, tokens, seriales, keystores, datos personales y logs crudos.
- [ ] Separé lo observado de lo inferido y lo pendiente; conozco el límite de cada prueba.

La recuperación **Museo Access Queue** es distinta y restringida si se asigna. La [ampliación](09_AMPLIACION_PM6.md) es opcional. El feedback y el plazo de entrega los confirma el docente; la prueba presencial práctica global sigue separada.
