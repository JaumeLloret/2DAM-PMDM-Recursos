# PM4 · API didáctica determinista

## Para qué existe

Esta API ofrece el mismo contrato y los mismos fallos a todo el grupo. Sirve para aprender el lado cliente: petición, código, JSON, autenticación y diagnóstico.

No tienes que programarla, no usa base de datos y **no es el backend de AulaFlow 2.0**.

## Antes de arrancar

Abre la raíz `30 - PMDM/Unidades/PM4/`. Comprueba:

```bash
dart --version
```

Si `dart` no se reconoce, revisa la instalación Flutter/Dart del curso y el PATH. No descargues otro SDK para «salir del paso».

## Terminal 1 · arrancar y mantener viva la API

```bash
dart run tools/demo_api.dart --port=8080
```

Salida esperada:

```text
PM4_DEMO_API_READY http://127.0.0.1:8080
```

La terminal queda ocupada porque el servidor sigue escuchando. Déjala abierta mientras trabajas con Flutter. Para cerrarlo usa `Ctrl+C`.

Si aparece `Address already in use`, otro proceso utiliza 8080. Detén la instancia anterior o elige, por ejemplo, `--port=8082` y cambia también `API_BASE_URL`. Puerto y URL siempre deben coincidir.

## Terminal 2 · health antes de Flutter

```bash
curl -i http://127.0.0.1:8080/health
```

También puedes abrir esa URL en el navegador. Debes observar:

- código 200;
- `Content-Type: application/json`;
- `"status":"ok"`;
- `"service":"PM4-DEMO-API"`.

Si health falla, todavía no depures widgets, DTO o stores: revisa proceso, carpeta, puerto y terminal 1.

## Por qué `localhost` cambia

`127.0.0.1` siempre significa «esta misma máquina desde la que se realiza la petición».

- En escritorio, Flutter y API comparten PC: usa `127.0.0.1`.
- En Android Emulator, «esta máquina» es el Android virtual: usa el alias del host `10.0.2.2`.
- En un dispositivo físico, usa una IP del PC accesible por la red autorizada.

Para dispositivo físico:

```bash
dart run tools/demo_api.dart --host=0.0.0.0 --port=8080
```

Hazlo solo el tiempo necesario, limita firewall/red y vuelve a loopback al terminar. No expongas la API a Internet ni publiques la IP.

## Credenciales y contrato

Credenciales ficticias:

- email: `demo@aulaflow.local`
- contraseña: `DEMO-pass`
- token de fixture: `DEMO-TOKEN-PM4`

Aunque sean públicas, practica el hábito correcto: en registros de entrega muestra `DEMO-…<redacted>` y nunca la cabecera `Authorization` completa.

| Método y ruta | Auth | Resultado |
|---|---|---|
| `GET /health` | no | 200 + servicio/versión |
| `POST /auth/login` | no | 200 + token; 401 si la credencial no coincide |
| `GET /tasks` | Bearer | 200 + `items` |
| `GET /tasks/:id` | Bearer | 200 o 404 |
| `PATCH /tasks/:id/toggle` | Bearer | 200 + tarea actualizada |

## Escenarios controlados

Sobre `GET /tasks` añade:

| Query | Qué provoca | Qué debe representar el cliente |
|---|---|---|
| `scenario=empty` | 200 con lista vacía | estado vacío, no error |
| `scenario=unauthorized` | 401 | sesión caducada; borrar sesión |
| `scenario=server-error` | 500 | error estable + retry; cache si la política lo permite |
| `scenario=invalid-json` | 200 con JSON roto | fallo de formato |
| `scenario=slow` | espera 1200 ms | timeout si tu límite es menor |

Un id desconocido provoca 404. Cada respuesta incluye `X-Demo-Request-Id` ficticio.

## Cómo provocar errores con seguridad

Cambia una sola query, ejecuta, registra método/URI/código/duración y vuelve al caso normal. No modifiques la API para fabricar el escenario. No registres body de login ni token.

## HTTP local y HTTPS real

La API usa HTTP porque es local y determinista. Eso no demuestra cifrado ni certificado.

Para comprobar que tu cliente/sistema acepta un servidor con TLS válido puedes usar, cuando haya conexión y el recurso de la tarea lo confirme:

```bash
curl -I https://example.com
```

Registra esquema, host y código, no cookies ni datos privados. Esta comprobación demuestra un canal HTTPS válido, no el contrato REST de PM4. Un certificado inválido debe producir error; nunca lo «soluciones» con `badCertificateCallback => true`. Si no hay conectividad o el endpoint cambia, registra `PENDIENTE_ENTORNO` y no inventes un PASS.

## Navegador y CORS

La app web y la API usan puertos diferentes. La API responde a la petición previa OPTIONS y permite los orígenes locales HTTP `localhost` y `127.0.0.1`; no hace falta desactivar la seguridad del navegador. Si health abre pero la app web falla, comprueba que la API sea la de este paquete actualizado, el origen local de Flutter y la URL efectiva. Una IP de otro equipo no es un origen de navegador admitido automáticamente.

Para abrir el ejemplo o el starter, usa `tools/preparar_proyecto.dart` desde la raíz PM4. Ese script genera las plataformas y evita conservar el test del contador de Flutter junto a las pruebas de esta unidad.
