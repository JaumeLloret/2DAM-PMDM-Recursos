# PM5 · Cuaderno único de trabajo I1

## Diagnóstico de entorno

- Sistema/editor:
- Destino DEMO:
- Android real disponible y API:
- Periférico BLE disponible:
- Puedo observar físicamente:
- Quedará pendiente:
- Diferencia entre fake y hardware, con mis palabras:

## Seguimiento personal · no es otra entrega

La tabla de fases sirve para orientarte. I1 se entrega el 10/12 con K1–K15; las fases de integración, I3 y cierre ocurren después y van en el producto final, no se exigen anticipadamente en ese cuaderno.

## Fases

| Fase | Predicción o pregunta | Acción/resultado mínimo | Carril | Estado de evidencia |
|---:|---|---|---|---|
| 1 | ¿qué puede demostrar mi entorno? | starter DEMO vivo | | |
| 2 | ¿cuándo pediré cada permiso? | denied/permanente + cleanup | | |
| 3 | ¿quién posee scan/conexión? | BLE éxito + error | | |
| 4 | ¿qué misión de permisos/BLE completé? | ticket causal | | |
| 5 | ¿cómo limitaré el stream? | muestra + error + cancelación | | |
| 6 | ¿cómo pruebo la conversión? | MIME + dimensiones + firma | | |
| 7 | ¿qué fallo depuré? | hipótesis + cambio + regresión | | |
| 8 | ¿qué controla player/animación? | load/play/pause/error/dispose | | |
| 9 | ¿qué integré en I2? | producto y tres errores | | |
| 10 | ¿qué cambié en I3? | predicción + diff + ejecución | | |
| 11 | ¿qué está listo y qué queda pendiente? | checklist real | | |

## Registro de katas

Usa una entrada por kata; no crees quince documentos.

```text
Kata:
Estado/fixture:
Predicción:
Cambio mínimo:
Ejecución y resultado:
Regresión:
Explicación:
CE:
Carril:
Estado de evidencia:
Dato saneado:
```

## Tres explicaciones que debo poder defender

1. Puerto, adaptador y fake:
2. Conversión real de imagen:
3. Lifecycle, propietario y cancelación:

## Registro de uso de IA

- finalidad:
- salida aceptada/rechazada:
- prueba de verificación:
- corrección/decisión propia:
- dato compartido: solo DEMO, nunca sensible.

I3: `SIN AGENTE`.


## Ejemplo de una entrada breve · K10

Ejemplo orientativo; sustituye las observaciones por las de tu ejecución.

- **Predicción:** al reducir PNG 1280×720 a ancho 1024 espero JPEG 1024×576.
- **Cambio:** `DemoMediaPort.convert` usa decode, resize y encode JPEG; referencia el archivo o diff.
- **Comprobación:** comando ejecutado, dimensiones decodificadas y firma de salida observadas.
- **Explicación y límite:** la conversión cambia bytes; la captura sigue simulada (`OBSERVADA_FAKE_TEST`).

En una kata conceptual, el cambio puede ser una tabla o razonamiento; escribe «no cambia código». Si una incidencia ya está registrada, enlázala en vez de copiarla. No hace falta redactar once ensayos sobre los CE: relaciona las prácticas con el registro de evidencias.
