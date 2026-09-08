# Ampliación opcional · PM3

Estas rutas no son obligatorias, no añaden minutos al presupuesto y no adelantan
el núcleo de otras UDs.

## A1 · Adaptación de detalle

En ancho suficiente, muestra lista y detalle coordinados sin cambiar el modelo.
Justifica si el mismo breakpoint del shell sirve o necesita otro local.

## A2 · Foco tras diálogo

Usa `FocusNode` para devolver foco al control que abrió el diálogo. Documenta
ciclo de vida y `dispose`. No introduzcas automatización de testing como contenido.

## A3 · Preferencia de tema solo en memoria

Eleva claro/oscuro a estado de aplicación con `ChangeNotifier`. Se pierde al
reiniciar deliberadamente: persistencia pertenece a PM4.

## A4 · Navegación con query pequeña

Representa el filtro como `?filter=pending`, valida valores desconocidos y
explica diferencia entre path y query. Sin auth ni redirecciones protegidas.

## A5 · Sustituir provider manualmente

Implementa un `InheritedNotifier` mínimo para comprender qué simplifica
`provider`. Compara coste y decide cuál dejarías. No construyas un framework.

## A6 · Accesibilidad ampliada

Revisa con lector de pantalla, contraste, teclado y texto 200/300 %. Produce una
lista de hallazgos y corrige los dos de mayor impacto.

## Límite

No uses la ampliación para REST/auth/persistencia, sensores/permisos/multimedia,
CI/DevTools profesional, SDD/agentes o arquitectura contractual de PI II.

