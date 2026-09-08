# Guía del alumnado · PM5

## Reto

Construirás una app Flutter que entiende que cámara, Bluetooth, sensores y reproducción no son «funciones que siempre están»: son capacidades con permiso, disponibilidad, lifecycle, eventos, errores y recursos que deben liberarse.

El producto ordinario es **AulaFlow Device & Media Companion**. Todo dato o medio debe ser `DEMO-*` o una escena neutra. La asociación a AulaFlow es local: la subida real no existe en esta unidad.

## Prerrequisitos

- leer Dart moderno y usar `Future`, `Stream`, null safety, clases e interfaces;
- componer UI, navegación, estado y ViewModel;
- reconocer Repository/Service y errores tipados de PM4;
- ejecutar `flutter pub get`, `flutter run` y `flutter analyze` con ayuda del runbook.

## Ruta cerrada

| Fase | Qué haces | Entregable dentro del bloque | Min |
|---|---|---|---:|
| 1 | diagnóstico y mapa capability | predicción inicial | 35 |
| 2 | permisos/lifecycle | tabla de estados + katas 1–3 | 70 |
| 3 | BLE/puerto | secuencia y katas 4–5 | 80 |
| 4 | taller 1 | conexión/fake + ticket | 55 |
| 5 | sensores/streams | katas 6–7 + traza | 80 |
| 6 | media | katas 8–11 + fixture procesada | 100 |
| 7 | taller 2 | debugging + registro | 55 |
| 8 | player/eventos/animación | katas 12–14 | 80 |
| 9 | laboratorio | producto integrado | 75 |
| 10 | taller 3 | I3 y defensa | 55 |
| 11 | revisión | entrega y autoauditoría | 35 |
| **Total** | **555 autónomos + 165 colectivos** |  | **720** |

## Evidencias

- **I1**: respuestas y diffs breves de las 15 katas.
- **I2**: app ejecutable, decisiones, registro de evidencias y demo.
- **I3**: microcambio individual no preparado, 23 minutos sin agente, ejecución y explicación.

No hay porcentajes nuevos. Los instrumentos aportan evidencias a los CE indicados y la prueba presencial global de PMDM permanece separada.

## Definition of Done del producto

- cada feature solicita solo su permiso y explica denegación/permanente;
- BLE descubre, conecta, intercambia un dato mínimo y limpia suscripciones;
- el sensor emite como stream, limita la actualización visual y se cancela;
- una imagen `DEMO-*` se valida, decodifica, redimensiona y convierte realmente a JPEG;
- original y derivada tienen nombres/rutas controlados en espacio privado de la app;
- existe previsualización y reproducción de audio DEMO con cargar/reproducir/pausar/error/dispose;
- una animación refleja un estado, no decora sin propósito;
- `paused/resumed` no deja recursos activos;
- los errores son visibles y recuperables;
- se puede ejecutar con fakes sin hardware;
- se documenta qué fue observado realmente.

## Seguridad, privacidad y honestidad

No uses fotos personales, conversaciones, ubicaciones, MAC, tokens ni nombres reales. No subas `.env`. No concedas permisos «por si acaso». Que un test fake pase no significa que Bluetooth o la cámara funcionen físicamente: usa el estado de evidencia correcto.

## Entrega

Incluye código, decisiones, registro de evidencias, comandos ejecutados y limitaciones. No incluyas la solución docente ni una captura que revele identificadores de dispositivo. Si usaste IA, describe la ayuda y una corrección o verificación propia; I3 debe permanecer sin agente.


