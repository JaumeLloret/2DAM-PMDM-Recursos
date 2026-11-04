# PM2 · Checklist antes de crear el ZIP

## Diseño

- [ ] Puedo decir por qué existe cada clase y qué regla o responsabilidad protege.
- [ ] He eliminado clases decorativas.
- [ ] Las invariantes se protegen al construir y al modificar.
- [ ] Justifico composición o, si existe, una herencia real.

## Dart

- [ ] Tipos e inferencia expresan el contrato.
- [ ] `dynamic` y `!` no aparecen sin frontera justificada.
- [ ] Ausencias legítimas usan tipos anulables.
- [ ] Colecciones están tipadas y su mutabilidad está controlada.
- [ ] Record/enum/switch simplifican una decisión real.
- [ ] El `Future` se espera y el error se observa.

## Ejecución y evidencia

- [ ] `dart format --output=none --set-exit-if-changed .` termina correctamente.
- [ ] `dart analyze` termina sin errores.
- [ ] `dart run bin/main.dart` produce una salida reproducible.
- [ ] `dart test` pasa, o he indicado honestamente `NO APLICA`.
- [ ] `DECISIONES.md` coincide con el código.
- [ ] `EVIDENCIA.md` contiene versión, comandos y salidas reales.
- [ ] He incorporado y explicado la microvariación individual.

## Higiene del ZIP

- [ ] Contiene `pubspec.yaml`, `bin/`, `lib/`, `DECISIONES.md` y `EVIDENCIA.md`.
- [ ] Incluye `test/` si existe.
- [ ] No incluye `.dart_tool/`, `build/`, credenciales, `.env` o datos personales.
- [ ] No incluye soluciones docentes.
- [ ] He descomprimido una copia y comprobado que puede abrirse.

