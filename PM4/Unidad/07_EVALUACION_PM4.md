# Evaluación, autenticidad y rúbrica · PM4

## Regla

`CE → evidencia → instrumento → autenticidad → recuperación`. RA2 mantiene 35 % global; PM4 no inventa pesos internos. La prueba presencial global de PMDM permanece separada.

| CE | Evidencia observable | Instrumento | Autenticidad |
|---|---|---|---|
| RA2.e | petición HTTP/HTTPS, REST/JSON, Service/DTO, timeout y códigos | I1 + I2 + registro técnico | I3 no preparada, ejecución y explicación |
| RA2.f | sesión segura, preferencia/cache persistentes, Repository remoto/local | I1 + I2 + decisiones/registro | re-instanciación, microcambio y justificación |

## Instrumentos

- I1 formativo: diagnóstico, 14 katas y autoevaluación.
- I2 aplicado: cliente ejecutable, código, decisiones y registro.
- I3 individual: 23 min de cambio simultáneo sin agente + ejecución/debugging + explicación focalizada.

## Rúbrica criterial

No es una media paralela. El docente registra nivel por descriptor y decide suficiencia de evidencia por CE.

| Dimensión | No evidenciado | En proceso | Suficiente | Sólido |
|---|---|---|---|---|
| HTTP/HTTPS | no conecta o desactiva TLS | petición frágil/sin códigos | cliente configurable, códigos/timeout y HTTPS seguro explicado | diagnóstico reproducible y contratos cambiantes |
| REST/JSON/DTO | `dynamic`/casts sin control | happy path | mapeo tipado y error de formato | opcionalidad/unknown justificados |
| Auth/sesión | secreto/log/persistencia insegura | token sin ciclo completo | login, Bearer, 401 y logout coherentes | restauración y minimización explicables |
| Persistencia | solo memoria o no observable | write sin restore/delete | preferencia/cache y sesión en almacén adecuado | re-instanciación, fallos y límites documentados |
| Repository/estados | red en widget | separación parcial | remoto/local y estados coherentes | política/stale/retry defendibles |
| Evidencia/autenticidad | no ejecuta/no explica | prueba aislada | casos, diff e I3 verificables | transfiere a cambio inesperado y localiza fallo |

Un bypass TLS, secreto real versionado o evidencia fabricada invalida esa evidencia y activa corrección segura; no se transforma automáticamente en una penalización numérica ajena al CE.

## Registro de estado

- `OBSERVADA`: existe ejecución/artefacto y triangulación suficiente.
- `PENDIENTE_EVIDENCIA`: falta evidencia auténtica o ejecutable.
- `PENDIENTE_ENTORNO`: bloqueo técnico documentado; reprogramar.

## Entregas tardías

Hasta 72 h sin justificación se evalúa la competencia, aunque puede perderse el mismo ciclo de feedback. Más de 72 h pasa al carril de recuperación. Un retraso justificado se reprograma sin penalización automática. Sin entrega: RA/CE pendiente.

## IA

Permitida fuera de I3 cuando la actividad lo admita, con revisión, diff y pruebas. I3 y prueba presencial: sin agente. No se usan detectores automáticos como prueba única.

