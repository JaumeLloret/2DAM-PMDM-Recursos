# Laboratorio principal · AulaFlow Dart Domain Lab

## Naturaleza

Caso **didáctico y pure Dart**. Se inspira en un tablero de tareas, pero no define contrato, AulaTokens, modelo final, API ni arquitectura de AulaFlow 2.0.

## Punto de partida

El starter funciona por consola, pero usa `Map<String, dynamic>`, strings libres, nulos ambiguos, reglas duplicadas y una lista expuesta. Su debilidad es plausible: no está construido para ser ridículo ni fallar a propósito.

Ruta pública: [Alumnado/Starter/aulaflow_dart_domain_lab/](../Alumnado/Starter/aulaflow_dart_domain_lab).

## Encargo incluido en 70 min

| Tramo | Min | Acción |
|---|---:|---|
| Comprender | 10 | ejecutar, predecir salida y señalar tres riesgos |
| Diseñar | 15 | responsabilidades, reglas y clase que no crearás |
| Implementar | 30 | tipos, clases, enum, colecciones e invariantes |
| Asincronía | 5 | conservar/reescribir snapshot local con error observable |
| Evidenciar | 10 | ejecutar, completar decisiones y checklist |
| **Total** | **70** | |

La microvariación I3 está dentro del taller 2, no en estos 70 minutos.

## Requisitos funcionales

1. Una tarjeta tiene id y título no vacío de al menos 3 caracteres.
2. La prioridad pertenece a un conjunto cerrado.
3. El responsable puede estar ausente de forma explícita.
4. Un id de tarjeta no aparece dos veces en el tablero.
5. Una columna tiene capacidad positiva y no puede superarla.
6. Mover una tarjeta conserva la tarjeta si el destino está lleno o no existe.
7. La operación informa éxito + mensaje; un record es válido si no necesita vida propia.
8. Existe una operación `Future` local que genera una descripción reproducible del tablero y dispone de una **ruta de fallo asíncrono controlada y realmente alcanzable**. El fallo debe simularse localmente, sin introducir red ni persistencia.

## Requisitos de diseño

- tipos estáticos; `dynamic` solo podría sobrevivir en una frontera documentada;
- null safety sin `!` rutinario;
- al menos un enum si el vocabulario es cerrado;
- colecciones tipadas;
- constructores que protejan invariantes;
- getter calculado cuando evite estado duplicado;
- composición razonada;
- decisión explícita sobre mutabilidad;
- ninguna clase decorativa;
- nombres de dominio, no `Manager/Utils/Helper` genéricos.

No hay un número mínimo de clases.

## Evidencia

`DECISIONES.md`:

| Elemento | Responsabilidad/regla | Alternativa descartada | Motivo |
|---|---|---|---|

Incluye además «clase que no creé» y decisión de mutabilidad.

`EVIDENCIA.md`:

- `dart --version`;
- `dart format --output=none --set-exit-if-changed .`;
- `dart analyze`;
- `dart run bin/main.dart`;
- `dart test` si hay tests;
- salida real o bloqueo exacto;
- cambio individual recibido, impacto y resultado.

## Resultado de referencia

Ejemplo de salida válida:

```text
ANTES · todo=2 · doing=0
MOVE · true · C-1 movida a doing
DESPUÉS · todo=1 · doing=1
SNAPSHOT · board-demo|doing:C-1|todo:C-2
```

La operación asíncrona debe disponer de un caso de fallo que puedas ejecutar y explicar.

## Cambio individual

En taller se asigna una variación breve: responsable opcional, prioridad urgente, capacidad, retorno doble, fallo asíncrono, clase redundante o nueva regla de validez. Cada persona la resuelve simultáneamente durante el bloque I3, deja predicción/cambio/comando/salida y explica el impacto. No se publica de antemano la microvariación exacta.

## Límites

Sin widgets, navegación, estado de interfaz, arquitectura Flutter, HTTP, JSON de API, autenticación, persistencia, sensores, permisos, multimedia, DevTools/CI como contenido, SDD/agentes o contrato/AulaTokens.

