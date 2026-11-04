# PM4 · Ruta de aprendizaje

## La misión

En PM3 tu app trabajaba con datos locales. En PM4 una operación cruza una frontera: Flutter construye una petición, una API responde, el JSON puede no cumplir el contrato y el almacenamiento local también puede fallar.

Vas a completar **AulaFlow Flutter Data Client**, una demo con datos `DEMO-*`. Al terminar podrás:

- construir peticiones HTTP y explicar qué cambia con HTTPS;
- interpretar códigos, JSON y errores sin convertirlos todos en «algo salió mal»;
- mapear DTO externos a un dominio estable;
- gestionar login, token, 401 y logout sin guardar contraseñas;
- elegir almacenamiento seguro, preferencia o cache según el dato;
- aplicar `remote-first` con fallback visible y estado `stale`;
- diagnosticar la capa que falla y demostrarlo con una prueba mínima.

Esta demo no define el backend ni la arquitectura contractual de AulaFlow 2.0.

## Qué necesitas de PM3

Debes reconocer `View → ViewModel → Repository`, inyectar una dependencia por constructor, leer un `Future` y capturar una excepción.

Checkpoint rápido:

- localiza en el starter la View y `RemoteOnlyRepository`;
- señala dónde se crea la dependencia;
- explica qué ocurriría si una llamada de red se iniciara desde `build()`.

Si no puedes responder, consulta solo el recordatorio de PM3 sobre ViewModel/Repository. PM4 no reenseña navegación o widgets como núcleo.

## Herramientas

- **VS Code + extensiones Flutter/Dart** es la opción recomendada para editar.
- **Android Studio + plugins Flutter/Dart** también es válido y se utiliza para SDK Manager y Device Manager.
- Baseline del curso: **Flutter 3.47.2 y Dart 3.13.2**. Usa esa instalación y comprueba su versión; no actualices el SDK para resolver un error de este ejercicio.
- Necesitas dos terminales, `curl` o navegador para `/health` y un destino de `flutter devices`.

Desde cualquier terminal comprueba:

```bash
flutter --version
dart --version
flutter doctor -v
flutter devices
```

Abre siempre la carpeta que contiene `pubspec.yaml`. No abras únicamente `lib/main.dart`.

## Mapa de carpetas y dos terminales

Descarga **PM4_MATERIALES_ALUMNADO.zip** desde esta página y descomprímelo. La raíz del paquete es la carpeta **PM4/**. Si trabajas con las fuentes del repositorio, equivale a `30 - PMDM/Unidades/PM4/`:

```text
30 - PMDM/Unidades/PM4/
├── tools/demo_api.dart
└── Alumnado/Starter/aulaflow_flutter_data_client/
    ├── pubspec.yaml
    ├── lib/
    └── test/
```

### Terminal 1 · API didáctica

Sitúate en la raíz `PM4/`:

```bash
dart run tools/demo_api.dart --port=8080
```

No cierres esta terminal. Debes ver:

```text
PM4_DEMO_API_READY http://127.0.0.1:8080
```

En otra pestaña o en el navegador comprueba:

```bash
curl -i http://127.0.0.1:8080/health
```

Resultado mínimo: código `200` y JSON con `"status":"ok"` y `"service":"PM4-DEMO-API"`. **Mantén la API abierta mientras pruebas el cliente.** Usa `Ctrl+C` únicamente al terminar la sesión de trabajo.

### Terminal 2 · Flutter

Desde la misma raíz **PM4/**, prepara el proyecto inicial:

```bash
dart run tools/preparar_proyecto.dart starter
cd Alumnado/Starter/aulaflow_flutter_data_client
flutter analyze
flutter test
flutter devices
```

El preparador genera las plataformas **Android y web**, configura el HTTP local de Android solo en debug y conserva `pubspec.yaml`, las fuentes y los tests del paquete. Retira únicamente la prueba del contador que Flutter añade si no existía. Si falla, conserva el primer error y consulta Ayuda; no borres todos los tests ni reemplaces `main.dart`.

En VS Code elige **Archivo → Abrir carpeta** y abre `Alumnado/Starter/aulaflow_flutter_data_client/`. En Android Studio abre esa misma carpeta. El editor debe mostrar `pubspec.yaml`, `lib/` y `test/`. La terminal de la API sigue en la raíz PM4; la del cliente está dentro del proyecto.

## Elige la URL correcta

| Dónde corre Flutter | `API_BASE_URL` | Por qué |
|---|---|---|
| Chrome en el PC | `http://127.0.0.1:8080` | cliente y API comparten sistema; el preparador genera `web/` y la API admite el origen local |
| Android Emulator | `http://10.0.2.2:8080` | `127.0.0.1` dentro del emulador apunta al propio Android virtual |
| dispositivo físico | `http://IP_DEL_EQUIPO:8080` | el móvil debe alcanzar al PC por una red autorizada |

Para empezar desde el navegador:

```bash
flutter run -d chrome --dart-define=API_BASE_URL=http://127.0.0.1:8080
```

Para Android Emulator, inicia el emulador del curso en Device Manager. Ejecuta lo siguiente y selecciona Android si Flutter ofrece varios destinos:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080
```

La configuración debug incluida permite HTTP a `localhost`, `127.0.0.1` y `10.0.2.2`. La vía de dispositivo físico requiere además una IP y configuración de red autorizadas por el docente; no abras el firewall ni cambies la configuración de release para resolverlo. Usa Chrome o el emulador del curso para el arranque guiado. Si el entorno pasa a Android API 37 con permiso de red local, aplica la contingencia del recurso de referencias con el docente; no confundas ese permiso con un fallo de DTO.

### Primera microvictoria

1. La terminal 1 sigue mostrando la API activa.
2. `/health` responde 200.
3. La app abre `PM4 starter remoto`.
4. Pulsa **Conectar demo**.
5. Aparecen tres tareas `DEMO-*`.

Si health falla, el problema todavía no está en Flutter. Si health funciona pero la app no conecta, revisa URL/destino antes de tocar DTO o UI.

### Un ejemplo completo antes de modificar el laboratorio

El paquete incluye **Alumnado/Ejemplos/pm4_datos_guiados/** con clases y pruebas que puedes ejecutar. Desde otra terminal en la raíz PM4:

```bash
dart run tools/preparar_proyecto.dart ejemplo
cd Alumnado/Ejemplos/pm4_datos_guiados
flutter test
flutter run -d chrome --dart-define=API_BASE_URL=http://127.0.0.1:8080
```

Abre su README: relaciona E6–E10 con `datos.dart`, `almacenes.dart`, `politica.dart` y sus tests. Empieza por JSON/DTO; añade sesión y persistencia cuando llegues a esas fases. Este ejemplo es parte del tiempo de los ejemplos y katas; no añade otra entrega ni horas. El laboratorio se trabaja en el **starter**, conservando ambos proyectos separados.

## Antes de avanzar: entiende la lista que acabas de ver

Abre **De la API a una lista Flutter · arranque guiado** en AULES o `Alumnado/06_DE_LA_API_A_LA_LISTA_FLUTTER.md` en el paquete. Sigue la petición hasta `ListTile`, cambia el identificador visible, añade un contador y un botón de reintento. Son los primeros 45 minutos de la fase 2; no añaden otra entrega. Después consulta HTTP/JSON y practica con errores. No empieces por caché o almacenamiento si aún no puedes explicar cómo llegaron las tres tareas.

## Ruta completa · 840 minutos

Los tres talleres son **apoyo opcional**. En las fases 4, 8 y 11 eliges taller o misión autónoma equivalente; no haces ambas.

| Fase | Min | Lee/consulta | Haz | Comprueba | Conserva |
|---:|---:|---|---|---|---|
| 1 | 35 | Esta ruta y diagnóstico | Herramientas, API, health y starter | Microvictoria o bloqueo clasificado | baseline y primer error |
| 2 | 90 | Teoría `1–5`; E1–E5 | K1–K5 y mesa de códigos/escenarios | 200, vacío, 401, 404, 500 y JSON inválido se distinguen | registro HTTP saneado |
| 3 | 85 | Teoría `6–8`; E6–E7 | K6–K8; DTO, timeout y fallos tipados | JSON externo no escapa como `dynamic` | tabla contrato → dominio |
| 4 | 45 | Talleres · misión 1 | Taller opcional o diagnóstico autónomo de red | fallo → capa → prueba → siguiente acción | evidencia de misión 1 |
| 5 | 105 | Teoría `9`; E2/E3 | K9–K10; login, Bearer, 401 y logout | contraseña no persiste; token no aparece en logs | ciclo de sesión |
| 6 | 90 | Teoría `10` y seguridad; E9 | K11; token/preferencia/cache | re-instanciación recupera solo lo previsto | matriz de persistencia |
| 7 | 100 | Teoría `11–12`; E8 | K12–K14; Repository y estados | fallback muestra `stale`; 401 no usa cache | política y estados |
| 8 | 45 | Talleres · misión 2 | Taller opcional o misión autónoma | store reinstanciado y política explicada | evidencia de misión 2 |
| 9 | 130 | Debugging + laboratorio | Práctica de diagnóstico y siete hitos | producto mínimo ejecutable | código y evidencias I2 |
| 10 | 70 | Evaluación, ayuda y autoevaluación | Escenarios, HTTPS cuando proceda, analyze/tests y paquete | sabes qué falta sin fabricar resultados | entrega preparada |
| 11 | 45 | Talleres · misión 3 | Taller opcional o vía autónoma I3 | microcambio sin agente, ejecución y explicación | evidencia I3 |
|  | **840** |  |  |  |  |

## Método de trabajo

Para ejemplos y katas usa:

1. **Lee/localiza** el contrato y el fichero.
2. **Predice** código, estado o fallo.
3. **Ejecuta** el baseline.
4. **Observa** método, URI, código, duración y salida sin secretos.
5. **Modifica** una causa.
6. **Verifica** el caso y una regresión.
7. **Explica** qué capa tomó la decisión.

## Fechas de la tarea de entrega PM4

- Apertura: `27/10/2026 00:00`.
- Entrega objetivo: `22/11/2026 23:59`.
- Cutoff (cierre de recepción): `25/11/2026 23:59`.

Estos tres campos están configurados en la tarea de entrega PM4 de AULES. Consulta esta ruta y la tarea para conocer los plazos; Avisos puede recordar un cambio, pero no es la única fuente.

Los talleres 19:30–20:25 son franjas de 55 min nominales, con 45 efectivos y 10 de margen. La misión desde casa dura 45 min y sustituye al taller. Los 30 min redistribuidos están en las fases 5, 9 y 10; el total sigue siendo 840 min.

Talleres opcionales: **03/11/2026** (red y errores), **10/11/2026** (sesión y persistencia) y **17/11/2026** (I3), de 19:30 a 20:25. Cada uno tiene una misión autónoma equivalente; elige una sola vía por bloque.

## Qué entregarás

- proyecto Flutter ejecutable o ZIP según indique la tarea;
- plantilla de decisiones y registro de entrega;
- diff respecto al starter;
- casos 200, vacío, 401, 404, 500/503, timeout y JSON inválido;
- evidencia de sesión, preferencia/cache, logout, fallback y `stale`;
- comprobación HTTPS indicada en el recurso, sin desactivar TLS;
- evidencia individual I3.

No incluyas `build/`, `.dart_tool/`, `.env`, contraseñas, tokens completos, IP pública, datos reales, logs con `Authorization` ni material reservado. No se inventa límite de ZIP: sigue la tarea cuando se publique.

## Si te bloqueas

Abre **Ayuda PM4** y conserva: fase, sistema, editor, destino, terminal implicada, comando, URL efectiva saneada, primer error, resultado esperado y dos hipótesis. Un bloqueo documentado puede quedar `PENDIENTE_ENTORNO`, pero una ejecución ajena no sustituye la tuya.
