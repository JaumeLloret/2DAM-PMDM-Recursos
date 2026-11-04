# PM5 · Registro de evidencias

Estados permitidos:

`OBSERVADA_REAL`, `OBSERVADA_FAKE_TEST`, `PENDIENTE_HARDWARE`, `PENDIENTE_PERMISO_ENTORNO`, `RECUPERACION_REQUERIDA`.

| CE | Escenario/fixture | Carril y entorno | Estado | Ejecución/fecha | Observación saneada y pendiente |
|---|---|---|---|---|---|
| RA2.c | scan→stop→connect→exchange→disconnect | | | | |
| RA2.d | stream→error/fin→cancel | | | | |
| RA2.j | denied/permanente/unavailable | | | | |
| RA3.a | entorno/puertos/adaptadores elegidos | | | | |
| RA3.b | capture/recover/process/store | | | | |
| RA3.c | PNG/JPEG→JPEG real | | | | |
| RA3.d | resize/compresión | | | | |
| RA3.e | eventos/fallos/lifecycle | | | | |
| RA3.f | animación controlada/reducida | | | | |
| RA3.g | load/play/pause/error/dispose | | | | |
| RA3.h | debugging y documentación | | | | |

## Regla

Una fila FAKE no se transforma en REAL por compilar, pasar tests o ejecutarse en CI. El docente valida `OBSERVADA_REAL` para la capacidad concreta.

No pegues identificadores, seriales, rutas, medios personales ni capturas de cuentas. Usa descripciones como `android-api31+`, `DEMO-device` y `app-private://DEMO-*`.

