# Laboratorio · Balizas del muelle

## Entrada y alcance

Trabaja desde Starter/beacon_dock, conservando baseline. No copies la solución. El starter abre y permite moverse; sus límites están marcados: recogida, daño/victoria incompletos, solo CellA y audio collect. Un arranque o smoke verde no acepta el producto final. Debes completar G01–G08, construir/configurar objetos y recursos y contrastar la experiencia completa.

## Desarrollo por cortes

**Diseño y objetos, A03/T1/A04.** Redacta G01 con casos y estados. Instancia CellB/CellC con IDs/posiciones del contrato y registra creación propia en G02. Verifica relaciones de escena y formas. Completa recogida única, daño/inmunidad y victoria; mantén guardas de fase, tiempo y reinicio. Prueba antes de continuar, sin retirar condiciones porque la escena esté mal configurada.

**Recursos y física, A05/T2.** Crea o duplica de forma controlada un material propio de baliza y uno de peligro; asigna color/roughness conservando formas y lectura sin depender solo de color. Registra usuarios del recurso y valores. Configura/verifica formas, capas/máscaras, velocidad/gravedad y respawn seguro. Recorre pared, recogida, muelle prematuro, daño y pausa con inputs reales del entorno. Distingue edición de material y propiedad física.

**Presentación, A06/A07.** Completa los cuatro tonos y puntos de evento; prueba silencio con información visual equivalente. Configura cámara ortogonal y luz/ambiente para ver todo el recinto; justifica encuadre e intensidad. Revisa HUD y controles al cambiar tamaño de ventana. Añade pruebas de reglas y al menos un recorrido de integración del motor, guardando fallo real/corrección si existe. No inventes un fallo para cumplir una cuota.

**Android y mejora, T3/A08/A09.** Configura templates/preset/JDK/SDK, exporta APK debug y registra hash/corte. Instala y prueba en dispositivo autorizado cuando exista acceso, con estados pendientes hasta observación. Mide un recorrido comparable, cambia una variable y conserva regresión/legibilidad. No conviertas un build o una captura de CI en instalación física.

**Cierre, T4/A10/A11.** Realiza cambio nuevo individual sin ayuda generativa, explica diff y ejecuta prueba. Corrige hallazgo, repite lo necesario en el corte final y entrega dossier/recursos/fuentes, sin APK ni claves dentro del repositorio de fuentes si la política del espacio no los admite. Usa el canal autorizado para artefactos de QA. Mantén límites y evidencia pendientes explícitos.

## Evidencia mínima suficiente del producto

El juego puede iniciarse, jugarse, pausarse, ganar/perder por sus condiciones y reiniciarse sin acumular objetos o conservar progreso incorrecto. Tres balizas tienen identidades distintas. El personaje colisiona y responde a input móvil/teclado en destinos observados. Materiales, audio, cámara/iluminación y HUD tienen propósito y configuración propia explicada. Hay pruebas/optimización/documentación auténticas y seguimiento de Android real. G01–G08 enlazan todo con CE; no se concede automáticamente un CE por recibir el componente ya preparado en el starter.
