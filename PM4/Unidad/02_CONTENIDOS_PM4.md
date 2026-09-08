# Contenidos autosuficientes · PM4

## 1. De una app local a un sistema distribuido

En PM3 el Repository devolvía objetos que ya estaban en memoria. Ahora una operación cruza límites: el móvil construye una petición, la red puede retrasarla o impedirla, el servidor interpreta un contrato y devuelve bytes que quizá no tengan la forma esperada. Un fallo deja de ser excepcional en el sentido cotidiano: latencia, desconexión, respuestas parciales y cambios de contrato son condiciones normales que el diseño debe representar.

El recorrido de referencia es:

`View → ViewModel → Repository → RemoteService + LocalStore`

La View representa estado y eventos. El ViewModel coordina la interacción. El Repository decide la fuente y la política. RemoteService conoce HTTP/JSON. LocalStore conoce persistencia. Si un widget construye headers, decodifica JSON y escribe claves locales, las responsabilidades vuelven a mezclarse.

## 2. Anatomía de una petición

Una URI como `https://api.example.org/tasks/DEMO-1?include=owner` contiene esquema (`https`), host, ruta y query. El puerto suele derivarse del esquema. DNS traduce nombres a direcciones; basta saber que también puede fallar.

La petición añade:

- método: intención de la operación;
- cabeceras: metadatos, por ejemplo `Accept`, `Content-Type` y `Authorization`;
- body: representación enviada, normalmente JSON en este caso.

La respuesta contiene código, cabeceras y body. `200` no garantiza que el JSON sea válido; JSON válido no garantiza que cumpla el contrato.

### Métodos útiles

- `GET`: leer una representación; no debería cambiar el recurso.
- `POST`: crear o ejecutar una acción no idempotente, como login.
- `PUT`: reemplazar una representación completa según contrato.
- `PATCH`: modificar una parte, como `completed`.
- `DELETE`: solicitar eliminación.

Idempotente significa que repetir la misma operación tiene el mismo efecto final, no que la respuesta sea siempre idéntica. No deduzcas semántica solo por el verbo: manda el contrato.

## 3. Códigos como decisiones

Las familias resumen el resultado:

| Código | Lectura útil para el cliente |
|---|---|
| 200 | operación correcta con body |
| 201 | recurso creado; puede incluir ubicación/body |
| 204 | éxito sin body: no ejecutar `jsonDecode('')` |
| 400 | petición inválida; revisar datos/contrato |
| 401 | falta sesión válida; limpiar/restaurar flujo de login |
| 403 | sesión conocida sin permiso; no es «vuelve a loguearte» automáticamente |
| 404 | recurso inexistente; estado específico o regreso seguro |
| 409 | conflicto con estado actual; refrescar/decidir |
| 500 | fallo del servicio; mensaje estable y retry consciente |
| 503 | servicio temporalmente no disponible |

No muestres al usuario un stack trace o body interno. Conserva un mensaje técnico saneado para diagnóstico y uno accionable para UI.

## 4. HTTP frente a HTTPS

HTTPS es HTTP transportado sobre TLS. Al nivel de PM4, TLS aporta confidencialidad del tránsito, integridad y autenticación del servidor mediante su certificado. No valida la lógica del servidor ni vuelve seguro un token guardado en texto plano.

La API local usa HTTP para ser determinista y no exigir una autoridad certificadora en cada equipo. Es una excepción de laboratorio. Producción y la comprobación controlada usan `https://` con certificado válido. Nunca soluciones un certificado inválido aceptando cualquier certificado mediante `badCertificateCallback`: elimina la autenticación del servidor y convierte un error visible en vulnerabilidad.

## 5. REST y contrato

REST organiza recursos identificables y operaciones mediante una interfaz HTTP coherente. No todo endpoint que devuelve JSON es automáticamente buen REST. Para consumir no necesitas diseñar el backend, pero sí leer el contrato:

```text
GET /tasks
Authorization: Bearer DEMO-TOKEN

200 application/json
{"items":[{"id":"DEMO-1","title":"Revisar contraste","completed":false}]}
```

Preguntas obligatorias: ¿qué campos son requeridos?, ¿cuáles opcionales?, ¿qué códigos existen?, ¿puede venir una lista vacía?, ¿hay body en 204?, ¿qué cambia de forma compatible? Añadir un campo opcional suele ser compatible; renombrar `id` o cambiar `completed` de booleano a texto puede romper clientes.

## 6. JSON, DTO y dominio

`jsonDecode` devuelve estructuras dinámicas. El DTO convierte el contrato externo en tipos controlados. El dominio representa lo que la app necesita. Separarlos aporta valor cuando nombres, opcionalidad o estados externos no coinciden.

```dart
factory TaskDto.fromJson(Map<String, Object?> json) => switch (json) {
  {'id': String id, 'title': String title, 'completed': bool done} =>
    TaskDto(id: id, title: title, completed: done),
  _ => throw const FormatException('Contrato Task inválido'),
};
```

Después, `toDomain()` puede normalizar un estado desconocido, descartar un campo de transporte o construir una invariante. Si DTO y dominio son idénticos en un ejemplo diminuto, una sola clase puede ser honesta; no crees capas por ceremonia. En el laboratorio se separan porque la API expresa `status` como texto y el dominio usa un enum con `unknown`.

## 7. RemoteService/API client

El Service recibe una `http.Client` por constructor. Eso reutiliza conexiones, permite cerrarla en el composition root y desacopla las pruebas. Sus responsabilidades:

1. construir `Uri`;
2. añadir headers sin registrar el token;
3. codificar request;
4. aplicar timeout;
5. interpretar códigos;
6. decodificar y validar DTO;
7. traducir fallos a tipos estables.

No devuelve `dynamic` a capas superiores. Tampoco decide cache-first o muestra diálogos: esas decisiones pertenecen a Repository y View.

## 8. Taxonomía de fallos

- transporte: DNS, conexión, socket o cliente;
- timeout: la operación excede el límite elegido;
- protocolo: 404, 409, 500…;
- autenticación: 401 y ciclo de sesión;
- formato: JSON inválido o contrato incompatible;
- persistencia: lectura/escritura local falla.

Un `catch (e) { mensaje='Algo salió mal'; }` pierde información. Tampoco filtres `e.toString()` directamente a UI. Convierte a tipos como `TimeoutFailure`, `UnauthorizedFailure` o `FormatFailure`; el ViewModel los traduce a estado y mensaje.

`Future.timeout` hace que el Future devuelto termine por timeout, pero la operación fuente puede seguir completándose después. Para este laboratorio basta evitar que el ViewModel espere indefinidamente; cancelación real es ampliación.

## 9. Autenticación y sesión

Login ficticio:

1. el cliente envía credenciales `DEMO-*` por el endpoint de login;
2. recibe un token opaco;
3. lo usa en `Authorization: Bearer …`;
4. ante 401 elimina sesión y vuelve a login;
5. logout borra memoria y almacenamiento seguro.

No necesitamos abrir JWT ni implementar OAuth. El token es una capacidad sensible aunque sea demo: no se imprime, no se versiona y, si se conserva entre arranques, va a un almacén seguro. La contraseña no se persiste.

401 significa «la petición no tiene credenciales válidas». 403 significa «la identidad no tiene permiso». Reintentar 401 indefinidamente con el mismo token no arregla la sesión.

## 10. Persistencia local

Persistir significa que el dato sobrevive a la instancia en memoria. Un contrato mínimo tiene `read`, `write` y `delete`. La inicialización es asíncrona y puede fallar.

Clasifica antes de elegir:

| Dato | Mecanismo del laboratorio | Razón |
|---|---|---|
| token | secure storage | sensible y necesario para restaurar sesión |
| `showCompleted` | preferences async | pequeño, no sensible |
| cache de tareas demo | preferences async como JSON pequeño | didáctica y acotada; no crítica |
| contraseña | ninguno | no debe conservarse |

`shared_preferences` no garantiza persistencia crítica y admite tipos simples. No es una base de datos. Una cache grande, búsquedas estructuradas o integridad transaccional requieren otro almacén; eso queda en ampliación/Acceso a Datos.

## 11. Repository remoto/local

El Repository es la fuente para el ViewModel. En remote-first:

1. intenta remoto;
2. si obtiene datos válidos, actualiza cache y devuelve datos frescos;
3. ante fallo recuperable, lee cache y marca `stale=true`;
4. ante 401, borra sesión y propaga sesión caducada; no oculta el problema con cache autenticada.

Cache-first muestra cache primero y refresca después. Mejora tiempo percibido, pero puede presentar datos antiguos. Offline-first y sincronización de conflictos requieren más reglas; no se inventan aquí.

La política se justifica por necesidad. Para tareas demo elegimos remote-first con fallback, porque el estado remoto es pequeño y la actualidad importa.

## 12. Estados de ViewModel

Un solo estado evita booleanos incompatibles:

`booting → idle → loading → data | empty | error | sessionExpired`

`data` puede llevar `stale=true`. `error` conserva una acción de retry. `sessionExpired` limpia información protegida y muestra login. El ViewModel no devuelve `http.Response`; expone datos de dominio y mensajes saneados.

Las llamadas no se hacen desde `build()`: cada rebuild podría repetir la petición. Se disparan en inicialización controlada o eventos.

## 13. Configuración por entorno

La URL no se edita en código. El proyecto usa:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

`127.0.0.1` dentro del emulador es el propio emulador. En el emulador Android clásico, el alias del host es `10.0.2.2`; reconfirma en prepublicación. La URL no es un secreto, pero cambia por entorno. Un secreto real nunca va en `--dart-define` como única protección: puede terminar dentro del binario.

## 14. Seguridad proporcionada

- usa HTTPS válido fuera del laboratorio local;
- almacena el mínimo dato y bórralo en logout/401;
- diferencia token, preferencias y cache;
- no confíes en validación de cliente como seguridad de servidor;
- sanea logs: método, host, ruta, código, duración; nunca token/body de login;
- limita mensajes técnicos en UI;
- no introduzcas pinning, biometría u OAuth complejo sin necesidad.

## 15. Checklist mental

Para cada flujo responde: contrato, código esperado, fallo posible, capa responsable, dato persistido, sensibilidad, estado de UI, retry, prueba reproducible y criterio de borrado. Si puedes explicarlo y cambiarlo, estás trabajando RA2.e/f; si solo «funciona en mi móvil», falta evidencia.

