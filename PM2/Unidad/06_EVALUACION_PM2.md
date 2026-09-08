# Evaluación PM2 · RA2.a

## Trazabilidad

| CE | Evidencia | Instrumento | Autenticidad |
|---|---|---|---|
| **RA2.a · «Se ha generado la estructura de clases necesaria para la aplicación.»** | K7–K12; código y decisiones del laboratorio; ejecución; microvariación | I1 katas formativas + I2 rúbrica/artefacto + I3 microvariación individual controlada | localizar, predecir, modificar, ejecutar, analizar y explicar sin agente |

RA2 pesa 35 % del módulo completo. PM2 no asigna peso a RA2.a ni porcentajes I1/I2/I3. El juicio es criterial y se integra después en el registro de RA2. La prueba presencial global de PMDM permanece separada.

## I1 · Entrenamiento

Sirve para localizar necesidades y dar feedback. No se transforma en doce notas. Evidencia útil: predicción, corrección y explicación de katas 7–12, apoyada por las anteriores.

## I2 · Artefacto

Debe permitir:

- ejecutar el caso;
- reconstruir responsabilidad de cada clase;
- demostrar tipos/null safety/colecciones;
- observar invariantes;
- comprobar composición y mutabilidad;
- leer una operación asíncrona local y su error;
- contrastar decisiones escritas con código.

## I3 · Verificación individual escalable

Se realiza **simultáneamente dentro de 20 min del taller 2**, sin agente. Cada estudiante recibe una microvariación individual o parametrizada y deja evidencia mínima identificable:

1. predicción del impacto;
2. archivo/clase/método afectado;
3. cambio o debugging realizado;
4. comando de ejecución y resultado;
5. explicación breve de la regla o alternativa descartada.

El docente observa el proceso, muestrea pantallas/cambios y contrasta dos o tres casos en el cierre del taller. No se pretende hacer una entrevista secuencial de 5–8 min a toda la clase. Solo cuando I2+I3 de una persona dejan una duda concreta se programa una comprobación focalizada posterior en T o recuperación.

La evidencia puede ser tecleada, oral con registro docente o una combinación equivalente por accesibilidad. Una adaptación conserva predicción, modificación/diagnóstico, ejecución y explicación.

## Rúbrica descriptiva

| Dimensión | 4 · sólida/transferible | 3 · suficiente | 2 · parcial | 1 · insuficiente/sin evidencia |
|---|---|---|---|---|
| Necesidad y cohesión | toda clase responde a responsabilidad/regla; elimina decorativas | estructura adecuada con justificación comprensible | alguna clase anémica/genérica o responsabilidad mezclada | maps/funciones débiles o clases arbitrarias |
| Invariantes/encapsulación | estados inválidos imposibles por vías públicas | reglas principales protegidas | reglas solo documentadas o rompibles | acepta estados esenciales inválidos |
| Tipos/null safety | tipos expresivos; ausencia legítima; sin `dynamic`/`!` injustificado | tipado coherente con incidencias menores | nulos/promociones frágiles | `dynamic`, casts o `!` impiden confiar |
| Colecciones/inmutabilidad | colección elegida y exposición controlada con motivo | colecciones tipadas y mutabilidad razonable | alias/copia poco clara | colección débil o expuesta rompe reglas |
| Composición/enums | relaciones/vocabulario modelados con criterio | composición y enum correctos | herencia/string libre dudosos | diseño contradice el problema |
| Funciones/Dart moderno | nombres/params claros; record/switch solo donde simplifican | código legible y moderno suficiente | sintaxis opaca o duplicación | no puede explicar transformaciones |
| Asincronía/error | entiende `Future`, espera y preserva fallo observable | operación local correcta y explicable | funciona por ensayo; manejo pobre | Future ignorado o error oculto |
| Cambio/defensa | anticipa impacto, cambia sin romper y justifica alternativas | localiza y completa cambio con explicación | necesita guía intensa o rompe otra regla | no localiza/comprende su código |

Los niveles orientan el juicio profesional; no son una suma automática ni nuevos pesos.

## Estados de registro

- `EVIDENCIA_SUFICIENTE`: I2 e I3 permiten decidir RA2.a.
- `PENDIENTE_EVIDENCIA`: artefacto presente pero falta autenticidad/ejecución.
- `RECUPERACIÓN`: evidencia muestra que la estructura aún no cumple.
- `PENDIENTE_ENTORNO`: bloqueo técnico documentado impide ejecución; no equivale a logro ni a suspenso automático.

## Política de entrega

Se aplica el marco 2026/27: en plazo ordinaria; retraso justificado reprogramado; hasta 72 h no justificado se evalúa la competencia pero puede perder ciclo de feedback; más de 72 h pasa a recuperación; sin entrega, RA/CE pendiente. No hay penalización numérica automática por retraso.

## IA y autenticidad

IA permitida como apoyo donde se indique, con revisión y trazabilidad. Nunca se toma detector, estilo o número de commits como prueba. I3 verifica comprensión individual y se realiza sin agente.

