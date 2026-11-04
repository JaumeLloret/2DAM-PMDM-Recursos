# PM4 · Ejemplos guiados reproducibles

Trabaja con la API local y dos terminales. Antes de cada ejemplo, `/health` debe responder 200. No dependas de Internet salvo la comprobación HTTPS indicada y no registres `Authorization`.

En todos sigue: **LOCALIZA → PREDICE → EJECUTA → OBSERVA → MODIFICA → VERIFICA → EXPLICA**.

**Archivos disponibles:** E1–E5 usan la API y los comandos; E6–E10 tienen implementaciones y pruebas en `Alumnado/Ejemplos/pm4_datos_guiados/`, incluido en el ZIP. Su README indica cómo prepararlo y ejecutarlo. El proyecto inicial evaluable sigue siendo `Alumnado/Starter/aulaflow_flutter_data_client/`.

## E1 · una conversación HTTP completa

- **Localiza:** terminal 1 con la API y terminal 2 para `curl`.
- **Predice:** código, content type y body de `GET /health`.
- **Ejecuta:** `curl -i http://127.0.0.1:8080/health`.
- **Observa:** 200, JSON y `X-Demo-Request-Id`.
- **Modifica:** pide `/ruta-inexistente`.
- **Verifica:** 404 sin confundirlo con fallo de transporte.
- **Explica:** diferencia entre «llegué a la API y respondió 404» y «no pude conectar».

## E2 · login y Bearer sin filtrar secretos

- **Predice:** resultado con `DEMO-pass` y con otra contraseña.
- **Ejecuta:**

```bash
curl -i -X POST http://127.0.0.1:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"demo@aulaflow.local","password":"DEMO-pass"}'
```

- **Observa:** 200 y token ficticio; la credencial errónea devuelve 401.
- **Modifica:** solicita `/tasks` con y sin Bearer.
- **Verifica:** solo la petición autenticada devuelve `items`.
- **Explica:** por qué el widget no debe construir la cabecera.

## E3 · vacío no es error

- **Predice:** estado de UI para una lista vacía correcta.
- **Ejecuta:** `GET /tasks?scenario=empty` con Bearer DEMO.
- **Observa:** 200 y `items: []`.
- **Modifica:** representa `empty` separado de `error`.
- **Verifica:** el usuario puede continuar o reintentar solo cuando tiene sentido.
- **Explica:** por qué no debes lanzar una excepción por una colección válida vacía.

## E4 · 500 y retry consciente

- **Ejecuta:** `GET /tasks?scenario=server-error`.
- **Observa:** 500 con error controlado.
- **Modifica:** traduce el protocolo a un fallo estable y muestra retry.
- **Verifica:** el caso normal vuelve a cargar; 500 no borra sesión.
- **Explica:** qué capa conoce el código y cuál decide el mensaje de UI.

## E5 · JSON inválido con código 200

- **Predice:** si `jsonDecode` puede fallar después de un 200.
- **Ejecuta:** `scenario=invalid-json`.
- **Observa:** transporte y protocolo correctos, body inválido.
- **Modifica:** convierte `FormatException` en `FormatFailure`.
- **Verifica:** UI no muestra body ni stack trace; el caso normal sigue funcionando.
- **Explica:** 200 no valida el contrato.

## E6 · DTO a dominio

- **Localiza:** `TaskDto`, `TaskStatus` y `Task` en `lib/datos.dart` del ejemplo público. Abre `test/datos_test.dart` en ese mismo proyecto.
- **Predice:** resultado de `status: doing`, `note: null`, falta de `id` y estado futuro.
- **Ejecuta:** crea pruebas pequeñas de `fromJson` y `toDomain`.
- **Observa:** `doing` se convierte en enum, `note` puede ser null, falta de `id` falla y estado futuro queda `unknown`.
- **Modifica:** añade un campo externo opcional sin hacerlo obligatorio en dominio.
- **Verifica:** el listado anterior no se rompe.
- **Explica:** qué cambio externo absorbe el DTO.

## E7 · timeout tipado

- **Predice:** qué verá la UI si el límite es 400 ms y la API tarda 1200 ms.
- **Ejecuta:** `scenario=slow` con `Future.timeout`.
- **Observa:** `TimeoutException`.
- **Modifica:** traduce a `TimeoutFailure` y añade retry.
- **Verifica:** no queda spinner infinito y el caso normal sigue en `data`.
- **Explica:** que terminar el Future por timeout no cancela necesariamente la operación fuente.

## E8 · remote-first y cache visible

Primero ejecuta `flutter test test/politica_test.dart` en el ejemplo público y abre `lib/politica.dart`. Las funciones inyectadas permiten observar éxito, fallo recuperable y 401 por separado. Después aplica esa decisión al Repository del starter y a un almacén real. El backend simulado del test no demuestra persistencia en el dispositivo.

- **Ejecuta:** carga normal para escribir cache.
- **Observa:** datos frescos, `stale=false`.
- **Modifica:** detén la API y vuelve a cargar.
- **Verifica:** fallback devuelve cache con `stale=true`.
- **Regresión:** provoca 401; debe limpiar sesión y no presentar cache protegida como éxito.
- **Explica:** diferencia entre fallo recuperable y sesión inválida.

## E9 · persistencia demostrada por re-instanciación

Abre `lib/almacenes.dart` y `test/almacenes_test.dart` del ejemplo público. La app usa `SharedPreferencesAsync` para la preferencia y `FlutterSecureStorage` para el token. Las pruebas de memoria comprueban la lógica; para comprobar los complementos, cambia la preferencia, cierra y vuelve a abrir la app en el mismo dispositivo/origen.

- **Predice:** qué debería sobrevivir: token, `showCompleted`, cache y contraseña.
- **Ejecuta:** escribe preferencia mediante LocalStore.
- **Modifica:** descarta el objeto y crea otra instancia sobre el mismo backend.
- **Verifica:** recuperas la preferencia; la contraseña nunca existe en el store.
- **Explica:** persistir no significa mantener una variable viva.

## E10 · logout que puede fallar

Ejecuta `flutter test test/almacenes_test.dart`. El caso «un fallo de borrado no se convierte en logout satisfactorio» utiliza un backend controlado que falla y comprueba tanto el fallo comunicado como el token que sigue almacenado.

- **Predice:** estado si el borrado de secure storage lanza una excepción.
- **Ejecuta:** usa un fake de SessionStore que falla al borrar.
- **Observa:** el error debe representarse; no se declara logout completado.
- **Modifica:** traduce el fallo a `PersistenceFailure`.
- **Verifica:** el flujo correcto sí vuelve a login; el fallido conserva un estado honesto.
- **Explica:** por qué fingir éxito dejaría una sesión restaurable.

## E11 · localhost desde tres perspectivas

- **Ejecuta:** health desde el host con `127.0.0.1`.
- **Predice:** qué significa esa misma IP dentro del emulador.
- **Modifica:** ejecuta Flutter con `10.0.2.2`.
- **Verifica:** muestra la URL efectiva saneada y carga tareas.
- **Explica:** host, emulador y dispositivo son sistemas distintos.

## E12 · HTTPS sin atajos

- **Predice:** qué aporta TLS y qué no aporta.
- **Ejecuta, si el entorno tiene conexión:** `curl -I https://example.com`.
- **Observa:** esquema HTTPS y respuesta con validación normal.
- **Modifica:** ninguna política de certificados.
- **Verifica:** el proyecto no contiene `badCertificateCallback`.
- **Explica:** la API local HTTP no demuestra HTTPS y un certificado inválido no se acepta.

## Cierre

Has terminado los ejemplos cuando puedes reproducir al menos un éxito, un error de protocolo, un error de formato, un timeout, una restauración y un fallback, y explicar qué capa actuó en cada caso.

