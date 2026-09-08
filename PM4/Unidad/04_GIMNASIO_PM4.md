# Gimnasio graduado · PM4

Las 14 katas están embebidas en las fases 2, 3, 5 y 7; no son 14 entregas. Registra hipótesis, cambio y evidencia breve en el cuaderno.

## K1 · anatomía

Dada `GET https://demo.invalid/tasks/DEMO-2?compact=true`, identifica esquema, host, ruta, query, método y si esperas body de request. Criterio: seis piezas correctas y no confundir URL con endpoint.

## K2 · código → estado

Asocia 200, 401, 404 y 500 a `data`, `sessionExpired`, `notFound` y `error/retry`. Justifica por qué 401 no es 403.

## K3 · 204

Corrige un cliente que ejecuta siempre `jsonDecode(response.body)`. Criterio: 204 se trata como éxito sin body y el siguiente paso respeta el contrato.

## K4 · JSON frágil

Un cast `json['done'] as bool` recibe `"false"`. Localiza la capa y genera `FormatFailure`; no conviertas cualquier texto silenciosamente.

## K5 · opcionalidad

Añade `note: String?` sin hacer opcional `id`. Prueba ausencia, null y tipo incorrecto.

## K6 · timeout

Aplica 400 ms y activa `scenario=slow`. Criterio: estado específico, retry y ningún spinner infinito.

## K7 · saca HTTP del widget

Recibe un `onPressed` con `http.get`, JSON y `setState`. Extrae RemoteService y haz que la View reciba un evento del ViewModel.

## K8 · DTO=dominio o no

Decide para dos casos: `{id,title}` idéntico y `{id,status:"doing"}` con enum interno. Una respuesta válida puede elegir una clase en el primer caso y dos en el segundo; lo importante es la razón.

## K9 · login ficticio

Implementa POST, `Content-Type`, body JSON y lectura de token. Rechaza 401 sin guardar contraseña. Sanea el log.

## K10 · almacenamiento inseguro

Encuentra dos defectos: token en constante y token en preferencias. Mueve la sesión a `SessionStore` seguro; logout elimina clave y memoria.

## K11 · preferencia persistente

Guarda/restaura `showCompleted`. Demuestra lectura con una nueva instancia de LocalStore. Explica por qué no es dato crítico.

## K12 · remote-first/cache-first

Para un horario casi estático y para tareas colaborativas activas, elige política. Indica cuándo mostrar `stale` y cuándo no usar cache.

## K13 · 401 coherente

Simula 401 al refrescar: Repository borra sesión, ViewModel elimina datos protegidos y View vuelve a login. Criterio: no hay bucle de retry con el mismo token.

## K14 · localhost

La API responde en host pero no en AVD. Escribe un árbol de diagnóstico con URL efectiva, `10.0.2.2`, escucha/puerto, permiso INTERNET y firewall/red. No cambies cinco cosas a la vez.

## Escala de ayuda

- Pista 1: nombra la capa responsable.
- Pista 2: reproduce con curl/fixture.
- Pista 3: compara con E1–E12.
- Solución completa: reservada por el docente y no publicada.

