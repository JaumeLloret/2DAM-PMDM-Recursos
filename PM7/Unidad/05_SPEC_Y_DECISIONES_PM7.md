# Encargo Consulta DEMO y tarjeta de decisiones

## Petición inicial para tu intento

“La lista de consulta necesita encontrar lo que interesa por título y estado. Debe ser fácil volver a ver la información y reconocer que no hay resultados”. Antes de abrir la tarjeta siguiente, redacta una spec provisional y al menos dos preguntas que cambien comportamiento. No implementes reglas ambiguas por intuición.

## Tarjeta autorizada de entrenamiento

Autoridad: consigna docente del caso sintético, no cliente ni contrato real. Datos: DEMO-A Revisión de cámara/pendiente; DEMO-B Preparar documentación/terminada; DEMO-C Revision de cámara/terminada; DEMO-D Plan de mañana/pendiente. Se mantienen esos IDs y orden.

| Decisión | Regla acordada | Motivo y efecto |
|---|---|---|
| C1 | Solo subcadena del título | Un ID interno no debe producir coincidencia invisible |
| C2 | trim y minúsculas; á/é/í/ó/ú/ü equivalen a a/e/i/o/u/u; ñ distinta de n | Alcance lingüístico español explícito, sin promesa universal |
| C3 | Consulta y estado se combinan con AND | Deben cumplirse ambas restricciones |
| C4 | Conservar orden original e identidad por ID | Dos títulos iguales siguen siendo dos entradas |
| C5 | Limpiar borra texto y conserva estado | Evita cambiar una elección no relacionada |
| C6 | Sin persistencia, red, cuentas, dependencias nuevas ni rediseño | Feature realizable y revisable en el tiempo disponible |

## Spec de referencia que debes reconstruir

| Criterio del producto | Ejemplo verificable |
|---|---|
| S1 Consulta vacía/espacios conserva orden sin mutar fuente | Todas → A,B,C,D; fuente sigue con cuatro entradas |
| S2 Normalización acotada | “ REVISION ” → A,C; CÁMARA normaliza a camara |
| S3 AND con estado | cámara + pendientes → A; cámara + terminadas → C |
| S4 Búsqueda solo por título; no coincidencia válida | DEMO-A o meteorito → vacío |
| S5 Identidad y ñ | Dos títulos iguales no se fusionan; mañana no equivale a manana |
| S6 UI y contador | Buscar meteorito muestra 0 de 4 y mensaje de orientación |
| S7 Limpiar conserva filtro | cámara + pendientes → A; limpiar → A,D y 2 de 4 |

Estos identificadores describen comportamiento didáctico, no CE exclusivos ni IDs contractuales. El criterio curricular primario es RA2.i. No objetivos: búsqueda tolerante a errores, indexación masiva, persistencia, autenticación, analítica o integración con catálogo real. A01 recoge baseline; D01/D02 deben conservar tus preguntas y cómo la tarjeta las resuelve. Si detectas una contradicción en tu implementación, revisa código o solicita una decisión; no alteres la tarjeta para encubrirla.
