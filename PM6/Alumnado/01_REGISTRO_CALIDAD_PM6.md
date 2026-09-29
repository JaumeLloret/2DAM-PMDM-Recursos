# Un solo dossier de calidad · PM6

Rellena **un dossier** mientras avanzas; no entregues cinco formularios aislados. Los códigos Q01–Q05 sirven para localizar las partes. Usa datos DEMO, enlaza el corte accesible al docente y escribe **observado / inferido / pendiente**. Una captura sin comando, contexto y explicación tiene poco valor. [Ruta](00_RUTA_PM6.md) · [laboratorio](../Unidad/06_LABORATORIO_PM6.md) · [autoevaluación](../Unidad/12_AUTOEVALUACION_PM6.md).

## 1. Qué fallaba y cómo lo probé (Q01)

Cuenta brevemente qué debería ocurrir, entrada, versión, acción y diferencia observada. Anota nivel de prueba y dependencia controlada. Ejemplo **de predicción, no resultado prestado**: A abierta/B terminada/C abierta → 2 pendientes; el starter puede mostrar 1. Guarda nombre/comando de tu test y salida propia.

| Conducta y entrada | Predicción | Resultado de tu ejecución | Rojo esperado o entorno | Test/nivel y límite |
|---|---|---|---|---|
| Completa con datos y corte propios | | | | |

## 2. Qué cambié y qué regresión dejé (Q02)

Explica hipótesis, diff mínimo, prueba previa roja, verde posterior y caso límite. Incluye orden de Futures, error/retry, lifecycle/dispose, ID y retención según lo que has trabajado. Registra `dart format`, `flutter analyze --fatal-infos` y `flutter test` con versión, salida/código de salida. El número de pruebas o cobertura no es una nota.

| Defecto/hipótesis | Cambio y diff | Antes/después sobre qué corte | Regresión y límite |
|---|---|---|---|
| | | | |

## 3. Qué observé con DevTools (Q03)

**No inventes una medida.** Declara destino/modo/frecuencia, Flutter, dataset, recorrido y herramienta. Inspector: contador/layout. Performance: profile, misma carga de 1500 DEMO, calentamiento separado y tres repeticiones por variante eager/builder. Memory: corte inicial, 25 cargas, corte final, objetos/referencias e hipótesis. La prueba de `history.length <= 20` es host/retención lógica y se registra por separado. Sigue [protocolo](../Unidad/08_DEVTOOLS_Y_CI_PM6.md).

| Herramienta/corte | Entorno y recorrido | Observación real/traza saneada | Inferencia y límite | Próxima prueba o pendiente |
|---|---|---|---|---|
| Inspector | | | | |
| Performance | | | | |
| Memory | | | | |

Si aún no pudiste conectarte: escribe **PENDIENTE_DEVTOOLS**, primer bloqueo, protocolo que ejecutarás y acceso solicitado. No pegues una gráfica de otra persona.

## 4. Qué hice en Android (Q04)

Distingue **B emulador**, **C APK construida** y **D móvil físico**. El hash del APK identifica bytes, no instalación. La observación física debe ser docente o recogida según procedimiento institucional. Sanea identificadores a DISPOSITIVO-A; no publiques seriales ni capturas con datos ajenos.

| Capa/etapa | Acción/comando y corte | Destino/API/modo saneado | Observación propia y evidencia | Estado |
|---|---|---|---|---|
| B · emulador RA2.g | `flutter test integration_test/flow_test.dart -d <ID_LOCAL>` + recorrido error/retry/toggle | | | PENDIENTE_EMULADOR o observado |
| C · build | `flutter build apk --debug` + SHA código/hash APK | Java/SDK | | PENDIENTE_BUILD o construido |
| D · dispositivo RA2.h | Instalar APK autorizada, arrancar y recorrer | DISPOSITIVO-A/API | | PENDIENTE_DISPOSITIVO o observado |

Si falta infraestructura, conserva lo ejecutado en otras capas, solicita turno real y deja la capa correspondiente pendiente. Un test widget no acredita emulador; build OK no equivale a desplegado.

## 5. Con qué SHA cierro y cómo lo explico (Q05)

Escribe SHA del código entregado, URL del run de práctica **si existe**, SHA que ejecutó realmente, job/step y resultado. Si A era verde y después cambiaste código a B, el run A es histórico; valida B y registra el nuevo corte. Si Actions está deshabilitado, adjunta YAML y controles locales y escribe **PENDIENTE_CI**. Explica qué pruebas se ejecutaron de verdad y qué queda fuera.

| Entregado | Run/ejecutado | Controles reales | I3 individual supervisado | Pendientes y cita |
|---|---|---|---|---|
| SHA: | URL/SHA o PENDIENTE_CI | | 22 min sin agente + 10 min explicación; diff/resultado | |

**Entrega:** fuente/tests y diff accesibles al docente, este dossier, evidencia de emulador/DevTools y dispositivo cuando se haya observado, más pendientes explícitos. No adjuntes solution/oráculos docentes, secretos, keystores, datos personales, seriales o logs crudos. La cantidad de tests, CI verde, commits, APK o uso/no uso de agentes no generan nota automática.
