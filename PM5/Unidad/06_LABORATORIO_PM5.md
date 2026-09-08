# Laboratorio integrado · AulaFlow Device & Media Companion

## Encargo

Completa el starter para preparar localmente una evidencia multimedia `DEMO-*`. La app ofrece modo demo determinista y modo Android real. El modo demo permite avanzar; el real aporta evidencia solo cuando se observa con hardware.

## Historias de usuario

1. Como persona usuaria, entiendo por qué una feature necesita permiso y puedo denegarlo sin perder el resto de la app.
2. Como técnico, descubro un periférico BLE, conecto, intercambio un dato mínimo y me recupero de timeout/desconexión.
3. Como técnico, observo movimiento mediante stream y sé cuándo se cancela.
4. Como persona usuaria, selecciono o capturo una escena neutra, valido el archivo y obtengo una derivada JPEG.
5. Como persona usuaria, previsualizo la derivada y reproduzco/pauso un audio DEMO.
6. Como auditor, sé si cada evidencia fue fake o física.

## Arquitectura obligatoria

```text
UI
└── DeviceMediaController
    ├── PermissionPort
    ├── BlePort
    ├── SensorPort
    ├── CapturePort
    ├── ProcessorPort
    ├── StorePort
    └── PlayerPort
```

Los plugins solo aparecen en `platform/real_adapters.dart`. El modo se selecciona en composición raíz, no con `if (demo)` dispersos.

## Criterios de aceptación

### Permisos/lifecycle

- cero solicitudes al arrancar;
- cámara y Bluetooth se solicitan desde su acción;
- denegación y denegación permanente tienen mensajes/acciones distintas;
- `paused` cancela scan/sensor y pausa audio;
- `dispose` es seguro aunque una operación fallara.

### BLE

- scan limitado y sin duplicados;
- lista deduplicada, sin persistir IDs;
- conexión con timeout;
- intercambio GATT mínimo configurable;
- desconexión/error recuperables;
- fake con éxito, timeout y desconexión.

### Sensores

- stream de aceleración del usuario;
- última muestra y magnitud visible;
- actualización UI limitada;
- ausencia/error representado;
- cancelación demostrable.

### Multimedia

- `image/png`/`image/jpeg`, máximo 5 MiB;
- verificación por decodificación;
- ancho máximo 1024;
- codificación JPEG calidad 85 y firma comprobable;
- original y derivada en directorio privado con `DEMO-*`;
- borrador local explícitamente no subido;
- medio corrupto produce error recuperable.

### Reproducción/animación

- WAV sintético local;
- load/play/pause/error/dispose;
- animación controlada por actividad;
- respeta reducción de movimiento.

## Ruta del laboratorio · 75 min

| Min | Acción |
|---:|---|
| 0–8 | ejecuta starter y registra estado inicial |
| 8–20 | conecta controller/puertos y corrige permisos |
| 20–32 | completa cleanup BLE/sensor |
| 32–50 | valida/procesa/guarda fixture |
| 50–60 | integra player y animación |
| 60–68 | provoca timeout, sensor ausente y medio corrupto |
| 68–75 | ejecuta checklist, registra evidencia y prepara entrega |

Las katas previas ya prepararon cada pieza; no se repiten dentro de estos 75 min.

## Evidencias entregables

- repositorio/diff sin secretos;
- app y comandos reproducibles;
- `02_DECISIONES_PM5.md` con tres decisiones;
- `04_REGISTRO_EVIDENCIAS_PM5.md` con entorno/estado;
- captura o vídeo corto solo con fixtures y IDs redactados;
- explicación de una suscripción y una excepción;
- límite `PROD-01` visible.

## I3

La variante se asigna en el taller 3. Dispones de 23 minutos simultáneos sin agente. Después ejecutas y explicas. No memorices una solución: practica localizar el puerto, cambiar una transición y demostrar el efecto.


