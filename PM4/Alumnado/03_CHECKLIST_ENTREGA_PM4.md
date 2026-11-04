# PM4 · Checklist de entrega

## Ejecución

- [ ] La API arranca y `/health` responde 200.
- [ ] La app usa `API_BASE_URL` externa y documentada.
- [ ] Login, listado, detalle, toggle y logout son observables.
- [ ] He registrado normal, vacío, 401, 404, 500/503, JSON inválido y timeout.
- [ ] Una API detenida tras una carga produce fallback visible con `stale=true`.
- [ ] `flutter analyze` y `flutter test` se ejecutaron y anoté su resultado real.

## Diseño y datos

- [ ] RemoteService conoce HTTP/JSON; widgets no.
- [ ] DTO/dominio y fallos no filtran `dynamic` sin control.
- [ ] Token solo en SessionStore seguro; contraseña no persistida.
- [ ] Preferencia/cache son pequeñas y no sensibles.
- [ ] Persistencia se demuestra con re-instanciación o reinicio real indicado.
- [ ] 401 borra sesión y no utiliza cache protegida como éxito.
- [ ] Logout confirmado borra sesión; un fallo de borrado no finge éxito.
- [ ] HTTPS está explicada y comprobada cuando el entorno indicado lo permite, sin bypass TLS.

## Paquete y autenticidad

- [ ] Incluyo código, `pubspec.yaml`, decisiones, diff y registro.
- [ ] No incluyo `build/`, `.dart_tool/`, `.env`, secretos, datos reales, IP pública ni material reservado.
- [ ] Logs y capturas no muestran password, token completo ni `Authorization`.
- [ ] Declaro el uso de IA y cómo verifiqué sus aportaciones.
- [ ] I3 contiene predicción, cambio, ejecución, regresión y explicación sin agente.
- [ ] El ZIP/carpeta se abre y contiene lo necesario; no invento un límite de tamaño.

