# PM3 · Ampliación opcional

Estas propuestas son voluntarias, no añaden minutos obligatorios ni mejoran por sí solas la calificación. Elige una únicamente después de cerrar la autoevaluación.

## A1 · Lista y detalle coordinados

En ancho suficiente, muestra lista y detalle sin cambiar el modelo. Decide si el shell y el detalle necesitan el mismo breakpoint.

## A2 · Recuperar el foco tras un diálogo

Usa `FocusNode` para devolver el foco al control que abrió el diálogo. Documenta ciclo de vida y `dispose`.

## A3 · Tema en memoria

Eleva claro/oscuro a estado de aplicación con `ChangeNotifier`. Se pierde deliberadamente al reiniciar: persistencia pertenece a PM4.

## A4 · Filtro como query pequeña

Representa `?filter=pending`, valida valores desconocidos y explica path frente a query, sin autenticación ni redirecciones protegidas.

## A5 · Comprender qué simplifica `provider`

Implementa un `InheritedNotifier` mínimo, compara coste y decide cuál conservarías. No construyas un framework.

## A6 · Accesibilidad ampliada

Prueba lector de pantalla, contraste, teclado y texto grande; registra hallazgos y corrige los dos de mayor impacto. Indica herramienta y alcance real de la prueba.

## Límite

No uses ampliación para adelantar REST/auth/persistencia, sensores/permisos/multimedia, CI profesional, SDD/agentes o arquitectura contractual de PI II.
