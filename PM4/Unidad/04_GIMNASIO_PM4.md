# PM4 · Gimnasio de 14 katas

Las katas están incluidas en las fases 2, 3, 5, 6 y 7. **No son catorce entregas.** Trabaja sobre fragmentos preparados o una copia del starter.

En todas usa **LEE → PREDICE → MODIFICA → VERIFICA → EXPLICA**.

## K1 · anatomía de una URI

- **Lee:** `GET https://demo.invalid/tasks/DEMO-2?compact=true`.
- **Predice:** esquema, host, ruta, query, método y body de request.
- **Modifica:** cambia solo la query.
- **Verifica:** sigues identificando seis piezas sin llamar «endpoint» a toda la URL.
- **Explica:** qué parte cambia por entorno.

## K2 · código a estado

- **Lee:** respuestas 200, 401, 404 y 500.
- **Predice:** `data`, `sessionExpired`, `notFound` o `error/retry`.
- **Modifica:** añade 403.
- **Verifica:** no lo conviertes automáticamente en «inicia sesión».
- **Explica:** diferencia 401/403.

## K3 · 204 sin JSON

- **Lee:** un cliente que siempre ejecuta `jsonDecode(response.body)`.
- **Predice:** fallo con body vacío.
- **Modifica:** acepta 204 como éxito sin decodificar.
- **Verifica:** 200 con JSON continúa funcionando.
- **Explica:** de dónde saldrá el estado siguiente.

## K4 · contrato JSON frágil

- **Lee:** `json['done'] as bool` recibe `"false"`.
- **Predice:** capa y excepción.
- **Modifica:** valida tipo y genera `FormatFailure`.
- **Verifica:** no conviertes texto arbitrario a booleano.
- **Explica:** por qué el servidor no se «corrige» en UI.

## K5 · opcionalidad honesta

- **Lee:** `id` obligatorio y `note` opcional.
- **Predice:** ausencia, null y tipo incorrecto.
- **Modifica:** añade `note: String?` sin debilitar `id`.
- **Verifica:** tres casos con prueba pequeña.
- **Explica:** opcional no significa `dynamic`.

## K6 · timeout observable

- **Lee:** `scenario=slow` y límite 400 ms.
- **Predice:** estado y acción disponible.
- **Modifica:** tipa timeout y añade retry.
- **Verifica:** no hay spinner infinito; normal sigue funcionando.
- **Explica:** límite del timeout respecto a cancelación real.

## K7 · HTTP fuera del widget

- **Lee:** `onPressed` con `http.get`, JSON y `setState`.
- **Predice:** qué rompe testabilidad y separación.
- **Modifica:** mueve HTTP/JSON a RemoteService y coordinación a ViewModel.
- **Verifica:** la View solo envía evento y observa estado.
- **Explica:** responsabilidad de cada capa.

## K8 · DTO y dominio con motivo

- **Lee:** caso idéntico `{id,title}` y caso externo `status:"doing"` con enum interno.
- **Predice:** uno o dos tipos para cada caso.
- **Modifica:** separa solo el segundo.
- **Verifica:** un estado futuro queda `unknown`.
- **Explica:** qué variación justifica el mapeo.

## K9 · login ficticio seguro

- **Lee:** POST, content type, JSON y token.
- **Predice:** 200 y 401.
- **Modifica:** implementa login sin persistir contraseña.
- **Verifica:** log con método/ruta/código, nunca body ni token.
- **Explica:** diferencia credencial y sesión.

## K10 · almacenamiento del token

- **Lee:** token en constante y token en preferences.
- **Predice:** riesgos.
- **Modifica:** introduce `SessionStore` seguro; logout borra clave y memoria.
- **Verifica:** re-instanciación restaura token; contraseña no existe.
- **Explica:** por qué secure storage es el mecanismo proporcionado.

## K11 · preferencia y cache

- **Lee:** `showCompleted` y cache JSON pequeña.
- **Predice:** sensibilidad y vida.
- **Modifica:** guarda/restaura con LocalStore no sensible.
- **Verifica:** nueva instancia recupera datos y delete los elimina.
- **Explica:** por qué no es una base de datos crítica.

## K12 · política de fuente

- **Lee:** horario casi estático y tareas activas.
- **Predice:** remote-first o cache-first.
- **Modifica:** aplica remote-first a las tareas demo.
- **Verifica:** éxito actualiza cache; fallo recuperable muestra `stale`.
- **Explica:** coste de enseñar datos antiguos.

## K13 · 401 coherente

- **Lee:** 401 durante refresh con cache disponible.
- **Predice:** qué debe ocurrir con sesión y datos.
- **Modifica:** Repository borra sesión y ViewModel pasa a `sessionExpired`.
- **Verifica:** no hay retry infinito ni cache protegida como éxito.
- **Explica:** por qué 401 no es offline.

## K14 · árbol de `localhost`

- **Lee:** host responde, Android Emulator no.
- **Predice:** URL efectiva, escucha/puerto, permiso y red.
- **Modifica:** cambia únicamente `API_BASE_URL` a `10.0.2.2`.
- **Verifica:** health host y carga app; después prueba una regresión normal.
- **Explica:** por qué `127.0.0.1` apunta a dos sistemas diferentes.

## Autocorrección

Una kata se cierra con predicción, cambio pequeño, salida observable y explicación causal. Si solo existe código o captura, falta aprendizaje. Usa las pistas en este orden: capa → escenario reproducible → ejemplo relacionado → ayuda docente.

