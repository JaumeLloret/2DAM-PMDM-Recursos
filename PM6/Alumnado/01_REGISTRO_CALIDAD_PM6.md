# Q01–Q05 · registro de calidad

## Q01 · Fallo y estrategia

| Comportamiento | Entrada/versión | Expected/actual | Prueba que lo distingue | Nivel y dependencia controlada | Límite |
|---|---|---|---|---|---|
| TBD | TBD | TBD | TBD | unit/widget/integration | TBD |

## Q02 · Corrección y regresión

| Fallo | Hipótesis | Diff/decisión | Resultado previo | Resultado posterior/versión | Caso límite |
|---|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD |

Formato/analyzer: comando, versión, salida, código de salida. No usar número de tests como nota.

## Q03 · DevTools

Entorno/modo/objetivo/frecuencia: TBD. Dataset:1500DEMO. Recorrido: cargar, retry, scroll de inicio a final y recargar5veces; calentamiento separado; repetir3veces por variante. Inspector: origen del contador y restricciones. Performance: variante eager frente builder con igual carga; guardar traza. Memory: corte inicial,25cargas, corte final; inspeccionar history y objetos retenidos. Registrar observación/hipótesis/límite sin cifras inventadas. Estado PENDIENTE_DEVTOOLS hasta ejecutar.

| Medida/corte | Versión | Observación | Evidencia saneada | Qué NO demuestra | Próxima prueba |
|---|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD |

## Q04 · Android

| Etapa | Comando/procedimiento | Entorno/versión saneada | Resultado/evidencia | Estado |
|---|---|---|---|---|
| Empaquetado | flutter build apk --debug | SDK/Java/API TBD; SHA TBD | APK+SHA256 TBD | PENDIENTE_BUILD |
| Interacción emulador | integration_test +recorrido visible | API/arquitectura/modo TBD | retry/contador/toggle | PENDIENTE_EMULADOR |
| Instalación real | Seleccionar DISPOSITIVO-A autorizado | modelo genérico/API, sin serial | instalación, arranque, recorrido y límite | PENDIENTE_DISPOSITIVO |

La evidencia física debe ser observada por el docente o recogida según procedimiento institucional; no se afirma a partir de tests. No subir keystore, datos privados o seriales.

## Q05 · Cierre y autenticidad

SHA entregado: TBD. Run sobre eseSHA: TBD. Qué pruebas se ejecutaron realmente: TBD. QA pendiente: TBD. Explicación individual: fallo, razón de la corrección, límite de los tests, modificación inesperada y resultado. Un cambio posterior convierte la validación previa en histórica. No conceder gates de proyecto ni aceptación contractual.
