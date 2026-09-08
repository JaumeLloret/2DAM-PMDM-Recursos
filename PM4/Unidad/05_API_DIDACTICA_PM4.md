# API didáctica determinista · guía de uso

La API es infraestructura de entrenamiento. No hay que programarla ni evaluarla como backend.

## Arranque

```bash
dart run Recursos/API/demo_api.dart --port=8080
curl http://127.0.0.1:8080/health
```

Acepta `--host=127.0.0.1`; el puerto debe estar entre 1024 y 65535. Detén con Ctrl+C. No usa base de datos, cuentas externas ni secretos.

## Contrato principal

| Método y ruta | Auth | Resultado |
|---|---|---|
| GET `/health` | no | 200 + estado/versión |
| POST `/auth/login` | no | 200 + token demo; 401 si credencial no coincide |
| GET `/tasks` | Bearer | 200 + `items` |
| GET `/tasks/:id` | Bearer | 200 o 404 |
| PATCH `/tasks/:id/toggle` | Bearer | 200 + tarea actualizada |

Credencial: `demo@aulaflow.local` / `DEMO-pass`. Token de fixture: `DEMO-TOKEN-PM4`. Todo es público, ficticio y solo didáctico.

## Escenarios controlados

Añade query a `/tasks`: `scenario=empty`, `server-error`, `invalid-json`, `unauthorized` o `slow`. `slow` espera 1200 ms. Un id desconocido produce 404. Cada respuesta incluye `X-Demo-Request-Id`; no contiene datos personales.

## Host vs emulador

- tests/desktop: `http://127.0.0.1:8080`;
- Android Emulator: `http://10.0.2.2:8080`;
- dispositivo: IP del equipo accesible solo en red autorizada.

No expongas la API en Internet. Si se enlaza en todas las interfaces para dispositivo físico, limita firewall/red y vuelve a loopback al terminar.

## HTTP local y HTTPS

El servidor local usa HTTP por reproducibilidad. No demuestra TLS. La teoría y prepublicación exigen una petición `https://` real con certificado válido. Está prohibido desactivar la validación de certificados.

