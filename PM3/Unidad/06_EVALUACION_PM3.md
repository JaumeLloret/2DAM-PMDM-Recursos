# Evaluación, autenticidad y trazabilidad · PM3

## Identidad criterial

RA2.b es el único CE primario:

> Se han analizado y utilizado las clases que modelan ventanas, menús, alertas y
> controles para el desarrollo de aplicaciones gráficas sencillas.

RA2 conserva el 35 % del módulo. PM3 no crea pesos internos ni mínimos
porcentuales. La prueba presencial global de PMDM sigue separada.

## Instrumentos

- **I1 · entrenamiento:** ejemplos, predicciones y 12 katas; formativo.
- **I2 · artefacto:** app ejecutable + decisiones + evidencia reproducible.
- **I3 · autenticidad:** microvariación simultánea sin agente + explicación.

## Trazabilidad

| Foco de RA2.b | Evidencia | Instrumento | Autenticidad |
|---|---|---|---|
| pantalla/ventana | shell y detalle ejecutables | I2 | recorrer compacto/ancho |
| menús/navegación | bar, rail, popup y rutas | I1/I2 | variación de destino/ruta |
| alertas/feedback | diálogo cancelable + SnackBar | I2 | cambiar condición |
| controles | filtro, orden, switch, botones | I1/I2 | explicar evento→estado |
| adaptación | decisión basada en constraints | I1/I2 | redimensionar y justificar |
| estado | local frente a feature | I1/I2 | microcambio en VM |
| separación | View/ViewModel/repository fake | I2 | sustituir fake/fallo |
| accesibilidad | texto/teclado/etiquetas | I2 | prueba directa |

## Rúbrica criterial

| Dimensión | Evidencia sólida | Evidencia parcial | Evidencia insuficiente |
|---|---|---|---|
| UI gráfica | usa y explica Scaffold, menú, alerta y controles con propósito | funcionan, pero la explicación o elección es débil | faltan controles esenciales o la app no ejecuta |
| Adaptación | bar/rail dependen de constraints y no pierden contenido | dos layouts con defectos menores o criterio poco justificado | layout fijo/overflow o clasificación por dispositivo sin medir |
| Navegación | rutas declarativas, id pequeño, detalle y salida inválida | navegación funciona con acoplamiento evitable | destinos rotos o objeto mutable imprescindible |
| Estado | una fuente, local/feature distinguidos, UI reacciona | ViewModel existe pero quedan reglas/copias en View | estado disperso/incoherente o no observable |
| Arquitectura | View→VM→Repository real, DI por constructor, sin ceremonia | separación incompleta pero responsabilidades reconocibles | nombres de capas sin flujo real o fuente creada en ViewModel |
| Interacción/accesibilidad | confirmación, feedback, teclado, texto grande y etiquetas verificados | funciona con alguna carencia comprobable | acción opaca, solo color o funcionalidad inaccesible |
| Explicación/autenticidad | predice, modifica, ejecuta y explica causalmente | ejecuta pero explica por receta | no puede producir/explicar variación propia |

El juicio final es profesional y criterial sobre el conjunto. Una dimensión sin
evidencia suficiente queda pendiente; no se oculta mediante media aritmética.

## Evidencia mínima válida

La app compila/ejecuta, permite demostrar los cuatro grupos literales del CE y la
persona explica al menos un flujo completo: control → callback → comando → estado
→ `notifyListeners` → rebuild. Una maqueta, captura o repositorio no ejecutable no
basta.

## Autenticidad escalable

I3 reserva **23 min de microvariación simultánea** dentro del taller 2, coherentes
con la ruta de trabajo de la unidad. El docente recorre, observa ejecución y selecciona explicaciones breves;
solo los casos dudosos pasan a T. El registro distingue `OBSERVADA`,
`PENDIENTE_EVIDENCIA` y `PENDIENTE_ENTORNO`. No se usan detectores de IA, número
de commits ni estilo como prueba de autoría.

## IA

Apoyo opcional, declarado y verificable. El alumno conserva registro de consulta,
decisión y comprobación. I3 se realiza sin agente. Los prompts no son criterio y
SDD/agentes siguen reservados a PM7.

## Entrega tardía o entorno bloqueado

Un problema de entorno no se confunde con falta de aprendizaje. Se conserva el
artefacto y se habilita ejecución equivalente supervisada. La ausencia de
evidencia auténtica tampoco se convierte automáticamente en cero: se marca y se
recupera con un caso nuevo.

