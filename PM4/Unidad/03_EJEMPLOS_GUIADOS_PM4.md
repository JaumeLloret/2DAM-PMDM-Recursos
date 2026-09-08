# Ejemplos guiados reproducibles · PM4

Todos los resultados se obtienen con la API local; no dependen de Internet. Ejecuta primero `dart run Recursos/API/demo_api.dart --port=8080`.

## E1 · leer una conversación HTTP

```bash
curl -i http://127.0.0.1:8080/health
```

Resultado esperado: `200`, `Content-Type: application/json` y `{"status":"ok",...}`. Separa observación (código/body) de inferencia («la API está disponible»).

## E2 · login y Bearer

```bash
curl -i -X POST http://127.0.0.1:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"demo@aulaflow.local","password":"DEMO-pass"}'
```

Resultado: 200 y token `DEMO-TOKEN-PM4`. Con una contraseña diferente: 401. No copies el token a logs de entrega; aquí es un fixture público y ficticio.

## E3 · recurso protegido

```bash
curl -i http://127.0.0.1:8080/tasks \
  -H 'Authorization: Bearer DEMO-TOKEN-PM4'
```

Sin cabecera: 401. Con ella: objeto con `items`. El Service debe construir la cabecera; el widget no la conoce.

## E4 · respuesta vacía y error de servidor

```bash
curl -i 'http://127.0.0.1:8080/tasks?scenario=empty' -H 'Authorization: Bearer DEMO-TOKEN-PM4'
curl -i 'http://127.0.0.1:8080/tasks?scenario=server-error' -H 'Authorization: Bearer DEMO-TOKEN-PM4'
```

`empty` devuelve 200 con lista vacía; no es error. El segundo devuelve 500 y debe activar retry, no borrar sesión.

## E5 · JSON inválido

`scenario=invalid-json` devuelve 200 con body mal formado. Un Service correcto no lo confunde con transporte ni muestra el body en UI: lanza un fallo de formato estable.

## E6 · DTO con campo opcional

```dart
final dto = TaskDto.fromJson({
  'id': 'DEMO-1',
  'title': 'Revisar contraste',
  'status': 'doing',
  'note': null,
});
final task = dto.toDomain();
```

Resultado: dominio con enum `doing`; `note == null`. Si falta `id`, `FormatException`. Un estado futuro se convierte en `unknown` sin romper el listado.

## E7 · timeout tipado

```dart
final response = await client
    .get(uri)
    .timeout(const Duration(milliseconds: 400));
```

Con `/tasks?scenario=slow` la API espera más que el timeout del test. Captura `TimeoutException` en Service y tradúcela a `TimeoutFailure`; el ViewModel muestra un mensaje con retry.

## E8 · política remote-first

Primera carga disponible: remoto → cache → `stale=false`. Segunda carga con 500: remoto falla → cache → `stale=true`. Una carga con 401: borra sesión → `sessionExpired`; no muestra cache protegida como si siguiera autorizada.

## E9 · persistencia observable

1. escribe `showCompleted=false` mediante LocalStore;
2. descarta el objeto LocalStore;
3. crea otro sobre el mismo backend;
4. lee el valor.

El dato no «persiste» porque una variable siga viva, sino porque la nueva capa lo recupera del almacén.

## E10 · 204 sin decodificar

La operación PATCH del laboratorio devuelve JSON 200. Como variación, si el contrato cambia a 204, el Service debe aceptar éxito y no llamar `jsonDecode` sobre body vacío. El resultado puede obtenerse del comando enviado o mediante un refresco posterior, según contrato.

## E11 · URL de emulador

Host: `curl http://127.0.0.1:8080/health`. Emulador: `API_BASE_URL=http://10.0.2.2:8080`. Si falla: confirmar API escuchando, URL efectiva, permiso INTERNET, puerto y red antes de tocar DTO/UI.

## E12 · HTTPS sin atajos

Prueba controlada: configura una URL `https://` con certificado público válido, ejecuta una petición y registra esquema/host/código sin datos sensibles. Un certificado inválido debe fallar; no se acepta código que lo ignore. La API local HTTP no demuestra TLS y se etiqueta como tal.

