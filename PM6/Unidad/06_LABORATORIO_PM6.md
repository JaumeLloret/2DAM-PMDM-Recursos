# Laboratorio · AulaFlow Mobile Quality Gate

## Encargo y condiciones

Corrige la app de consulta DEMO conservando el contrato público TaskStore y la UI recuperable. Producto acotado: listado con contador de pendientes, toggle por ID, recarga y recuperación de errores. No añadas backend, autenticación o hardware nuevo. Se trabajan RA2.g/h; PM7 reserva el proceso formal SDD.

## Criterios del producto

1. Contador representa trabajos abiertos, incluidos vacío/todos terminados.
2. La última solicitud iniciada gobierna datos/error/loading cuando llegan respuestas fuera de orden.
3. Error finaliza carga y permite retry; una carga posterior correcta elimina el error.
4. Desmontar pantalla invalida respuestas y no notifica a un controlador desechado.
5. Historial de snapshots respeta una política de retención acotada explicada; producto de referencia 20.
6. La UI ofrece vacío/error legibles y toggle por ID estable.
7. Formato, analyzer y pruebas pertinentes pasan sobre el código entregado.
8. Interacción se observa en emulador; APK se empaqueta y se instala/prueba en dispositivo real con registro diferenciado.

## Desarrollo por cortes

En A01 guarda baseline. A03/T1 crea un fallo discriminante; A04 corrige por incrementos y añade regresiones de las condiciones anteriores. No copies la solución docente ni reescribas toda la arquitectura para evitar entender el bug. Conserva un diff acotado y explica por qué el guard de generación no es cancelación de red.

En A05 sigue el protocolo DevTools de Q03. No cambies a la vez carga, dispositivo, modo y estructura de lista: no podrías atribuir el resultado. En A06 prepara Android y workflow en el repositorio de práctica autorizado. El workflow requiere lectura del código; no necesita secretos de producción. Si se comparte un runner o móvil, confirma permisos y borra solo el artefacto temporal propio cuando proceda.

T2 aporta microcambio individual sin agente. A07 repite pruebas del corte corregido, completa evidencia Android y Q05; A08 entrega tras feedback. Si falta hardware, programa la evidencia real y conserva PENDIENTE_DISPOSITIVO, sin declarar adquirido RA2.h por build. Las condiciones de entorno no se convierten en culpa académica del alumno; el docente ofrece acceso y recuperación.

## Dossier mínimo

Q01 estrategia y fallos; Q02 pruebas/analyzer; Q03 DevTools; Q04 emulador/APK/dispositivo; Q05 SHA/CI/límites y explicación individual. Adjunta solo evidencias necesarias, con datos saneados. Un enlace debe permitir al docente acceder al corte correcto; no publicar el serial físico, cuentas personales o registros de otras apps.
