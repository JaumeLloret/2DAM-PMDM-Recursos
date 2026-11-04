# PM2 · Autoevaluación antes de entregar

Esta revisión es formativa. No sustituye el laboratorio ni la microvariación individual.

## Puedo hacerlo sin ayuda

- [ ] Distingo una referencia `final` de un objeto inmutable.
- [ ] Sustituyo un `dynamic` innecesario por tipos que muestran el contrato.
- [ ] Trato una ausencia legítima con null safety sin usar `!` por reflejo.
- [ ] Elijo `List`, `Set` o `Map` y explico por qué.
- [ ] Uso un record para un resultado local pequeño y una clase cuando hay responsabilidad o invariantes.
- [ ] Protejo una regla tanto al construir como al modificar un objeto.
- [ ] Prefiero composición cuando no existe una relación «es-un» estable.
- [ ] Espero un `Future` y conservo un error observable.
- [ ] Localizo una clase que no necesito crear.
- [ ] Puedo explicar un cambio pequeño en mi propio laboratorio sin agente.

## Comprueba tu entrega

Ejecuta desde la carpeta con `pubspec.yaml`:

```bash
dart pub get
dart format --output=none --set-exit-if-changed .
dart analyze
dart run bin/main.dart
dart test
```

Si no tienes tests propios, indica `NO APLICA` en `EVIDENCIA.md`; no inventes un PASS.

## Qué revisar según tu duda

| Si dudas en… | Vuelve a… |
|---|---|
| tipos, `dynamic`, `final` o nulos | Contenidos §2–4 y K1–K2 |
| funciones, colecciones o records | Contenidos §5–6 y K3–K6 |
| clases, invariantes o composición | Contenidos §7 y K7–K9/K11–K12 |
| `Future` y errores | Contenidos §8, E8 y K10 |
| diagnóstico de un fallo | Debugging PM2 y Ayuda PM2 |
| formato de entrega | Evaluación y entrega PM2 + checklist |

Después completa Q06–Q12. Si aciertas pero no puedes explicar por qué, vuelve al recurso correspondiente: el cuestionario orienta; la evidencia práctica demuestra.

