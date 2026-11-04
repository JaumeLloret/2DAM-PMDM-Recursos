# PM4 · Debugging guiado antes del laboratorio

En PM4 una pantalla puede mostrar «no conecta» aunque el fallo esté en la API, la URL, el protocolo, el JSON, la sesión o el almacén local. Vas a practicar un método para encontrar la capa antes de tocar código al azar.

## Prepara un estado seguro

1. Trabaja sobre una copia del starter `Alumnado/Starter/aulaflow_flutter_data_client/`.
2. Desde la raíz PM4 abre la API en la terminal 1.
3. Comprueba `/health`.
4. Desde la carpeta del starter abre Flutter en la terminal 2.
5. Guarda el primer resultado de `flutter analyze` y `flutter test`.
6. Conserva una segunda copia limpia de `lib/`. No necesitas Git para esta práctica.

## Método de siete pasos

```text
síntoma → capa → hipótesis → prueba mínima → cambio mínimo → repetición → regresión
```

Describe siempre lo que observas antes de inferir la causa. «No funciona» no es un síntoma; «`curl /health` responde 200 pero Flutter muestra `Connection refused`» sí lo es.

## Mesa de diagnóstico

### Caso A · API caída

- **Síntoma:** `/health` deja de responder.
- **Capa probable:** proceso/transport.
- **Prueba mínima:** vuelve a la terminal 1 y comprueba si sigue mostrando el proceso activo.
- **Cambio mínimo:** reinicia la API, sin modificar Flutter.
- **Regresión:** health vuelve a 200 y la petición autenticada sigue funcionando.

### Caso B · base URL incorrecta

- **Síntoma:** la API responde desde el host, pero el emulador recibe `Connection refused`.
- **Hipótesis:** Flutter usa `127.0.0.1` dentro del emulador.
- **Prueba mínima:** muestra temporalmente la URL efectiva o revisa el `--dart-define`.
- **Cambio mínimo:** usa `http://10.0.2.2:8080` para Android Emulator.
- **Regresión:** health desde el host y carga desde la app.

### Caso C · 401 inesperado

- **Síntoma:** login funciona, pero `GET /tasks` devuelve 401.
- **Capa probable:** autenticación/sesión.
- **Prueba mínima:** reproduce con `curl` y una cabecera DEMO; no imprimas el token en la evidencia.
- **Cambio mínimo:** corrige el ciclo Bearer o borra la sesión inválida.
- **Regresión:** 200 con sesión nueva; 401 vuelve a login y no muestra cache protegida.

### Caso D · JSON o DTO inválido

- **Síntoma:** código 200, pero aparece error de formato.
- **Prueba mínima:** activa `scenario=invalid-json` y después usa un DTO con un campo de tipo incorrecto.
- **Cambio mínimo:** tipa `FormatFailure` en RemoteService; no fuerces casts ni «arregles» el body.
- **Regresión:** JSON válido sigue mapeando y el error no llega como stack trace a UI.

### Caso E · timeout y 500

- **Síntoma:** spinner infinito o mensaje genérico.
- **Prueba mínima:** usa `scenario=slow` y `scenario=server-error` por separado.
- **Cambio mínimo:** representa `TimeoutFailure` y fallo de protocolo con retry explícito.
- **Regresión:** el caso normal sigue mostrando datos frescos.

### Caso F · persistencia o logout

- **Síntoma:** el token no se restaura, la preferencia vuelve al valor inicial o logout parece correcto aunque el borrado falla.
- **Capa probable:** `SessionStore` o `LocalStore`.
- **Prueba mínima:** re-instancia el store; prueba lectura, escritura y borrado por separado.
- **Cambio mínimo:** convierte la excepción de plataforma en `PersistenceFailure` y conserva un estado honesto.
- **Regresión:** contraseña nunca se persiste; un 401 no queda oculto por cache.

### Caso G · cache antigua

- **Síntoma:** se muestran datos sin saber si son frescos.
- **Prueba mínima:** carga una vez, detén la API y repite.
- **Cambio mínimo:** fallback solo ante fallo recuperable y `stale=true` visible.
- **Regresión:** 401 borra sesión y no utiliza cache autenticada como éxito.

## Práctica obligatoria antes del laboratorio

1. Elige dos casos de la mesa: uno de red/protocolo y uno de persistencia/formato.
2. Escribe dos hipótesis antes de editar.
3. Aplica un solo cambio.
4. Ejecuta el caso y una regresión cercana.
5. Conserva: síntoma, capa, hipótesis descartada, cambio, resultado y límite.

Cuando puedas narrar `síntoma → causa → cambio mínimo → verificación` sin mezclar capas, estás listo para el laboratorio.

