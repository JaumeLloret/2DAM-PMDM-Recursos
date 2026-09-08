# Guía del alumnado · PM4

## Qué vas a construir

Un cliente Flutter de datos ficticios `DEMO-*`: inicia sesión, obtiene tareas por REST/JSON, muestra listado y detalle, cambia el estado de una tarea, conserva una preferencia y una cache pequeña, restaura la sesión desde almacenamiento seguro y reacciona a 401, vacío, error y timeout.

## Ruta única · 840 min

Sigue estas 11 fases en orden. El cuestionario, las 14 katas y la entrega están incluidos en esos minutos. Los tres talleres son 27/10, 03/11 y 10/11, 19:30–20:25. Si no puedes asistir, usa la equivalencia publicada; no hagas ambas.


| Fase | Trabajo | Modalidad | Min |
|---|---|---|---:|
| 1 | Diagnóstico PM3 → frontera de datos real | autónoma | 35 |
| 2 | HTTP/HTTPS, REST, JSON, códigos y errores | autónoma | 90 |
| 3 | Service, DTO y mapeo dominio | autónoma | 85 |
| 4 | Taller 1 · 27/10 | colectiva | 55 |
| 5 | Autenticación, sesión y token | autónoma | 95 |
| 6 | Persistencia local y seguridad | autónoma | 90 |
| 7 | Repository remoto/local y estados UI | autónoma | 100 |
| 8 | Taller 2 · 03/11 | colectiva | 55 |
| 9 | Laboratorio integrado RA2.e/f | autónoma | 120 |
| 10 | Robustez, microcambio, autorrevisión y documentación | autónoma | 60 |
| 11 | Taller 3 · 10/11 | colectiva | 55 |
| **Total** | **675 autónomos + 165 colectivos** |  | **840** |

Lecturas, katas, cuestionarios y evidencias están dentro de estas fases. Las tutorías T solo apoyan o sustituyen trabajo ya presupuestado.



## Antes de empezar

Debes poder leer un `Future`, capturar una excepción, reconocer View/ViewModel/Repository e inyectar una dependencia por constructor. Haz el diagnóstico del cuaderno. Si fallas un punto, usa solo la cápsula PM2/PM3 indicada.

## Puesta en marcha

Desde `PM4`:

```bash
dart run Recursos/API/demo_api.dart --port=8080
```

En otra terminal, dentro de una copia de [Alumnado/Starter/aulaflow_flutter_data_client](../Alumnado/Starter/aulaflow_flutter_data_client):

```bash
flutter create . --platforms=android --project-name aulaflow_flutter_data_client_starter
flutter pub get
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

En escritorio usa `http://127.0.0.1:8080`. En dispositivo físico usa la IP accesible del equipo y una red de aula autorizada. La credencial ficticia es `demo@aulaflow.local` / `DEMO-pass`; no reutilices una contraseña real.

## Método de diagnóstico

1. Describe lo esperado.
2. Captura método, URI, código y duración; sanea `Authorization`.
3. Decide capa: transporte, HTTP, autenticación, formato, persistencia o UI.
4. Reproduce con un escenario determinista.
5. Cambia una sola cosa.
6. Ejecuta de nuevo y anota evidencia.

## Entrega I2

- repositorio o zip del código sin `.dart_tool`, builds ni secretos;
- app ejecutable y comandos exactos;
- `02_PLANTILLA_DECISIONES_PM4.md` completada;
- `04_REGISTRO_ENTREGA_PM4.md` con escenarios 200/401/404/500/timeout y persistencia;
- breve evidencia de URL HTTPS válida sin desactivar TLS;
- diff respecto al starter.

## I3

En el taller 3 recibirás un cambio pequeño no preparado. Tendrás 23 min sin agente para modificar código, luego ejecutar/depurar y explicar dónde vive la decisión. No se valora memorizar; se valora comprender, localizar y verificar.

## Uso de IA

Puede ayudarte fuera de I3 si registras y revisas sus aportaciones. Debes poder explicar petición, JSON, estado, almacén, diff y pruebas. No inventes resultados de red, persistencia o ejecución. I3 y la prueba presencial global se realizan sin agente.

## Límites

No necesitas programar la API, diseñar SQL, implementar OAuth/JWT, añadir sensores, aprender CI ni planificar AulaFlow 2.0. Si una ampliación te atrae, termina primero el carril obligatorio.

