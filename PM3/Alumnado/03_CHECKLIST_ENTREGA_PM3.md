# PM3 · Checklist de entrega

## Proyecto

- [ ] Abro la carpeta que contiene `pubspec.yaml` y la app arranca.
- [ ] `flutter pub get`, `flutter analyze` y `flutter test` reflejan el estado real.
- [ ] Lista, tablero, ajustes y detalle son recorribles.
- [ ] Detalle navega por id y un id inválido no bloquea.
- [ ] Bar compacta y rail ancho comparten destinos.
- [ ] ViewModel contiene el estado de feature.
- [ ] El repositorio abstracto se inyecta por constructor.
- [ ] Diálogo cancelable, cambio y feedback funcionan.
- [ ] Loading, vacío y error no se confunden.

## Comprobaciones

- [ ] 390 × 800: bar, sin overflow y acciones visibles.
- [ ] 900 × 700: rail y cuerpo ocupando el resto.
- [ ] Texto ampliado: acciones y etiquetas siguen disponibles.
- [ ] Teclado/foco: he indicado qué pude comprobar y con qué destino.
- [ ] He repetido una regresión después del último cambio.

## Evidencias

- [ ] Mapa antes/después.
- [ ] Plantilla de decisiones.
- [ ] Registro de versiones y comandos.
- [ ] Dos capturas sin datos personales.
- [ ] Declaración de ayuda/IA y verificación.
- [ ] I3: predicción, cambio, ejecución y explicación sin agente.

## Higiene del envío

- [ ] Incluyo `pubspec.yaml`, `lib/`, `test/` y documentos pedidos.
- [ ] No incluyo `build/`, `.env`, secretos, datos reales ni solución docente.
- [ ] No he inventado PASS de AVD, dispositivo o accesibilidad que no observé.
- [ ] Todos los datos ordinarios son `DEMO-*`.
- [ ] No he adelantado PM4+.
