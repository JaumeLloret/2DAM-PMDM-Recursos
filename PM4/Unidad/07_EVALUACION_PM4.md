# PM4 · Evaluación y entrega

## Qué vas a demostrar

PM4 aporta evidencia a dos criterios ya fijados:

- **RA2.e:** utilizas clases para conexiones y comunicaciones HTTP y HTTPS. Lo demuestras con petición/respuesta, REST/JSON, RemoteService/DTO, códigos, timeout, configuración por entorno y tratamiento seguro de HTTPS.
- **RA2.f:** utilizas clases para conectar con almacenes garantizando persistencia. Lo demuestras con sesión segura, preferencia/cache, re-instanciación, borrado y política remoto/local.

RA2 conserva el 35 % global. PM4 no crea pesos internos ni mínimos nuevos. La prueba presencial global de PMDM sigue separada.

## Instrumentos

- **I1 · entrenamiento formativo:** diagnóstico, ejemplos, 14 katas, debugging y autoevaluación. No son 14 entregas.
- **I2 · producto aplicado:** cliente ejecutable, decisiones, diff y registro reproducible.
- **I3 · microvariación individual:** cambio pequeño no preparado, 23 minutos sin agente, ejecución/regresión y explicación.

## Qué debes entregar en I2

1. Proyecto Flutter o ZIP indicado por la tarea, con `pubspec.yaml`, `lib/` y `test/`.
2. Plantilla de decisiones completada.
3. Checklist de entrega con estado real.
4. Registro de ejecución de escenarios.
5. Diff respecto al starter.
6. Evidencia saneada de normal, vacío, 401, 404, 500/503, timeout y JSON inválido.
7. Evidencia de sesión, preferencia/cache, logout, fallback y `stale`.
8. Comprobación HTTPS indicada cuando proceda; si no fue posible, bloqueo documentado.
La comprobación individual posterior se adjunta al cierre final, no al corte inicial del laboratorio.

## Dónde y cuándo entregar

- **Laboratorio · primer corte:** 16/11/2026 23:59; admite envío tardío hasta 19/11 23:59. Entrega el proyecto y las evidencias I2 disponibles. La comprobación personal del 17/11 todavía no se exige aquí.
- **Entrega final y comprobación personal:** 22/11/2026 23:59; cierre 25/11 23:59. Enlaza la entrega de laboratorio, explica las correcciones y aporta I3: predicción, cambio, ejecución, regresión y explicación. Adjunta una versión actualizada solo si cambió el código o el docente no puede abrir el enlace; no comprimas otra vez el mismo proyecto sin cambios.
- **Entrenamiento:** las fechas de K1–K8 y K9–K14 orientan el trabajo; esas actividades no solicitan otra subida de ficheros.

Todos los plazos usan Europe/Madrid. Los dos canales son individuales. No publicas la evidencia personal en un repositorio público. La recuperación asignada abre el 27/11, vence el 10/12 y cierra el 13/12 a las 23:59; no es una segunda entrega ordinaria para toda la clase.

## Qué no debes entregar

- `build/`, `.dart_tool/` si no se solicita, `.env` o plataformas generadas innecesarias;
- contraseña, token completo, `Authorization`, claves, IP pública o datos reales;
- logs sin sanear, rutas personales, seriales o capturas con cuentas;
- material reservado o soluciones de referencia;
- resultados fabricados o copiados de otro entorno.

## Cómo comprobarlo antes de comprimir

Con API activa y desde la carpeta que contiene `pubspec.yaml`:

```bash
flutter pub get
flutter analyze
flutter test
flutter run --dart-define=API_BASE_URL=URL_DE_TU_DESTINO
```

Después pasa por **¿Estoy listo?**, abre el paquete resultante y confirma que contiene el proyecto, las decisiones y el registro. `NO EJECUTADO` con causa es preferible a un PASS inventado.

## Criterios visibles

| Foco | Evidencia suficiente |
|---|---|
| HTTP/HTTPS | URL por entorno, códigos/timeout, TLS explicado y sin bypass |
| REST/JSON/DTO | contrato tipado, opcionalidad y error de formato |
| Auth/sesión | login, Bearer, 401, restauración y logout coherentes |
| Persistencia | store adecuado, re-instanciación, delete y fallo representado |
| Repository/estado | remote-first, fallback visible, `stale`, retry y `sessionExpired` |
| Autenticidad | artefacto, ejecución, explicación y microcambio coherentes |

Un bypass TLS, secreto real o evidencia fabricada invalida esa evidencia y exige una corrección segura; no crea una penalización numérica paralela.

## I3 por dos vías equivalentes

Puedes realizar I3 en el taller opcional o mediante la misión autónoma de AULES. En ambos casos la variante exacta es reservada, el tiempo es el mismo y entregas la misma clase de evidencia. Si queda una duda de autoría se hace una comprobación focalizada, no se repite automáticamente toda PM4.

## IA

Fuera de I3, la IA es opcional cuando la actividad la admita. Indica para qué la usaste, qué aceptaste o rechazaste y cómo verificaste el resultado. No se evalúa la forma del prompt. I3 y la prueba global se realizan sin agente.

## Bloqueo de entorno

Registra `PENDIENTE_ENTORNO` con sistema, destino, comando, URL saneada, primer error y acciones probadas. Puedes avanzar en predicción y diseño, pero una ejecución ajena no sustituye la tuya. Un bloqueo técnico documentado no se confunde automáticamente con falta de aprendizaje.

## Recuperación

Si queda RA2.e y/o RA2.f pendiente, `PocketInventory Sync` produce evidencia nueva únicamente de esos focos, con otro contrato y otra regla de sesión/persistencia.

