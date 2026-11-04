# PM5 · Debugging guiado antes del laboratorio

En PM5 «no funciona» puede esconder un permiso, capacidad, radio, stream, lifecycle, picker, decodificador, almacenamiento o player. La meta es encontrar la capa antes de tocar varias cosas.

## Prepara un estado seguro

1. Trabaja sobre una copia del starter.
2. Conserva una copia limpia de `lib/`.
3. Ejecuta `flutter analyze` y `flutter test` antes de inyectar el fallo.
4. Anota carril DEMO/REAL y estado de evidencia.
5. Usa fixtures `DEMO-*` e ids/rutas saneados.
6. Provoca un único fallo cada vez.

No necesitas Git para esta práctica. El estado seguro puede ser una copia limpia y los resultados del baseline.

## Método de ocho pasos

```text
síntoma → capa → hipótesis → prueba mínima → cambio mínimo
        → repetir el caso → comprobar regresión → clasificar evidencia
```

Un síntoma es observable: «pulso Buscar y tras 8 s no aparece ningún dispositivo». «BLE está roto» ya es una conclusión.

## Mesa de diagnóstico

| Síntoma preparado | Capa/hipótesis inicial | Prueba mínima | Cambio mínimo y regresión | Estado que guardas |
|---|---|---|---|---|
| permiso `denied` | permiso; la persona lo rechazó | fake devuelve denied una vez | mensaje + fallback; sensor sigue activo | FAKE o REAL según diálogo observado |
| `permanentlyDenied` | permiso; repetir diálogo no ayuda | fake permanente o estado Android | ofrecer Ajustes/DEMO; no abrir Ajustes solo | estado exacto |
| capacidad `unavailable` | hardware/servicio ausente | pregunta estado sin solicitar de nuevo | desactivar solo feature y ofrecer DEMO | `PENDIENTE_HARDWARE` si procede |
| BLE apagado/no ready | radio/stack, no GATT | comprobar API, permiso y `BleStatus.ready` | no iniciar scan; mensaje y rescate | REAL solo si se observó |
| scan sin resultados | anuncios/filtro/periférico | scan 8 s con filtro controlado | mostrar vacío y permitir reintento | no inventar dispositivo |
| scan duplicado | propietario/suscripción | pulsar Buscar dos veces | cancelar anterior; una suscripción | fake verificable |
| timeout de conexión | enlace | fake que no llega a connected | cancelar conexión y volver a estado recuperable | fake o real |
| desconexión inesperada | stream de conexión | fake emite disconnected | limpiar id/GATT y ofrecer buscar | no conservar connected |
| intercambio sin conectar | estado/protocolo | llamar exchange desde idle | bloquear con mensaje útil | fake |
| sensor sin eventos | capacidad/stream | traza vacía con límite temporal | estado unavailable/empty; reintento | fake o hardware pendiente |
| sensor emite error | stream | muestra→error preparado | `onError`, cleanup y botón | fake |
| sensor sigue tras salir | lifecycle/propiedad | contar eventos después de suspend | cancelar/esperar; reiniciar una vez | fake; repetir real si procede |
| suscripción duplicada | controller | iniciar dos veces | cancelar/impedir duplicado | fake |
| picker devuelve `null` | cancelación de usuario | fake cancelado | conservar borrador anterior | fake/real |
| lost-data pendiente | lifecycle Android | fake `recoverLost()` | reentrada en mismo pipeline | fake; real pendiente |
| medio >5 MiB | validación | fixture de tamaño lógico | rechazar antes de decode | fake con bytes/metadata |
| MIME incorrecto | validación | PDF/bytes con nombre jpg | fallo tipado; caso válido continúa | fake |
| decode devuelve `null` | decodificación | `DEMO-CORRUPT-01` | `MediaDecodeFailure` | fake |
| conversión falsa | procesamiento | comparar bytes/firma/dimensiones | decode→resize→encode JPEG | fake; procesamiento real |
| almacenamiento falla | store | fake de write que lanza | `MediaStoreFailure`, sin draft falso | fake |
| play antes de load | player/estado | llamar `play()` desde idle | `not_loaded` y luego flujo normal | fake |
| player no carga | player/archivo | fallo de carga preparado | estado error y reintento | fake/real |
| player sigue activo | lifecycle/dispose | reproducir y suspender/cerrar | pause/dispose idempotente | fake; repetir real |
| lifecycle deja recurso activo | coordinación | scan+sensor+player, luego suspend | cancelar/desconectar/pausar | fake; real cuando se observe |
| `flutter analyze` falla | código estático | primer diagnóstico fichero/línea | corregir una causa; tests como regresión | resultado real del comando |
| `flutter test` falla | contrato/comportamiento | ejecutar solo el test | comparar esperado/real y corregir | resultado real del test |

## Práctica obligatoria antes del laboratorio

Reutiliza tres casos del entrenamiento (por ejemplo K5, K7 y K15); no se añaden otras tres reparaciones. Termínalos antes de enviar el cuaderno el 10/12. Elige:

1. uno de permisos/BLE;
2. uno de stream/lifecycle;
3. uno de media/player.

Para cada caso:

- escribe dos hipótesis antes de editar;
- usa la prueba mínima más barata;
- descarta al menos una hipótesis;
- realiza un solo cambio;
- repite el fallo y un caso normal;
- clasifica la evidencia.

## Registro de una incidencia

```text
Fase y carril:
Síntoma observable:
Capa probable:
Hipótesis A / B:
Prueba mínima:
Hipótesis descartada y por qué:
Cambio mínimo:
Resultado del caso:
Regresión:
Entorno y estado de evidencia:
Dato sensible redactado:
Límite o pendiente:
```

## Cuándo pedir ayuda

Si pasan 15 minutos sin obtener una observación nueva, detente. Lleva fase, carril, sistema, editor, destino, acción/comando, primer error, esperado, dos hipótesis y pruebas realizadas. No borres caches ni reinstales todo sin una hipótesis.

Estás listo para el laboratorio cuando puedes narrar **síntoma → causa → cambio mínimo → regresión → estado de evidencia** sin mezclar capas.

