# Checklist de entrega · PM4

- [ ] App arranca con comando documentado y API_BASE_URL externa.
- [ ] Login/listado/detalle/toggle/logout son observables.
- [ ] 200, vacío, 401, 404, 500, JSON inválido y timeout están registrados.
- [ ] Service conoce HTTP/JSON; widgets no.
- [ ] DTO/dominio y errores no filtran `dynamic` sin control.
- [ ] Token solo en SessionStore seguro; contraseña no persistida.
- [ ] Preferencia/cache son pequeñas y no sensibles.
- [ ] 401 y logout borran sesión.
- [ ] Fallback local muestra `stale`.
- [ ] Persistencia se demuestra con re-instanciación/reinicio.
- [ ] HTTPS válida comprobada sin aceptar certificados inválidos.
- [ ] Código formateado y analyzer/tests ejecutados; resultado real anotado.
- [ ] Sin `.env`, tokens reales, builds ni datos personales.
- [ ] Decisiones, diff y registro completos.
- [ ] Puedo ejecutar y explicar un cambio sin agente.

