# PM4 · ¿Estoy listo para entregar?

Esta parada es formativa y está incluida en la fase 10. No sustituye I2 ni I3.

## API y contrato

- [ ] La API arranca y reconozco la salida `PM4_DEMO_API_READY`.
- [ ] `/health` devuelve 200 y `status: ok`.
- [ ] Puedo hacer login con credenciales DEMO sin registrar password/token.
- [ ] Una petición autenticada devuelve datos.
- [ ] Distingo 200 con lista vacía de un error.
- [ ] Reproduzco y represento 401, 404 y 500/503.
- [ ] Reproduzco timeout y JSON inválido sin spinner infinito ni stack trace en UI.
- [ ] Explico qué demuestra HTTP local y qué aporta HTTPS.
- [ ] He realizado la comprobación HTTPS indicada cuando el entorno lo permite; si no, consta `PENDIENTE_ENTORNO`.

## Capas y persistencia

- [ ] Puedo narrar `View → ViewModel → Repository → RemoteService + LocalStore`.
- [ ] El DTO valida el contrato y mapea a dominio.
- [ ] El token usa almacenamiento seguro; la contraseña no se persiste.
- [ ] Preferencia y cache no sensible se recuperan con una nueva instancia.
- [ ] La sesión se restaura según contrato.
- [ ] Logout elimina sesión; un fallo de borrado no finge éxito.
- [ ] Remote-first actualiza cache tras éxito.
- [ ] El fallback muestra `stale=true`.
- [ ] Un 401 no queda oculto por cache.

## Robustez y entrega

- [ ] `flutter analyze` y `flutter test` reflejan el estado real.
- [ ] He ejecutado normal, vacío, 401, 404, 500/503, timeout y JSON inválido.
- [ ] Los logs están saneados: sin password, token completo ni `Authorization`.
- [ ] Incluyo código, decisiones, diff, registro y evidencias solicitadas.
- [ ] No incluyo `build/`, `.dart_tool/`, `.env`, secretos, IP pública, datos reales ni material reservado.
- [ ] Declaro para qué usé IA, qué acepté/rechacé y cómo lo verifiqué.
- [ ] I3 contiene predicción previa, cambio, ejecución, regresión y explicación sin agente.

## Si queda una casilla pendiente

| Bloqueo | Vuelve a |
|---|---|
| API, puerto o URL | Ruta, API didáctica y Ayuda |
| códigos/JSON/DTO | Teoría `2–8`, ejemplos E1–E7 y katas K1–K8 |
| sesión/persistencia | Teoría `9–10`, E9–E10 y K9–K11 |
| Repository/cache/estados | Teoría `11–12`, E8 y K12–K13 |
| emulador/localhost | E11, K14 y Ayuda |
| reparación | Debugging PM4 |
| formato/criterios | Evaluación, checklist y registro |

Solo marca una casilla cuando la has explicado y comprobado. `NO EJECUTADO` es más útil que un PASS inventado.

