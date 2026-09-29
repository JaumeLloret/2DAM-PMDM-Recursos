# Evaluación y autenticidad · PM8

| CE primario | Literal exacto de matriz |
|---|---|
| RA4.a | Se han identificado los elementos que componen la arquitectura de un juego 2D y 3D. |
| RA4.b | Se han analizado los componentes de un motor de juegos. |
| RA4.c | Se han analizado entornos de desarrollo de juegos. |
| RA4.d | Se han analizado diferentes motores de juegos, sus características y funcionalidades. |
| RA4.e | Se han identificado los bloques funcionales de un juego existente. |
| RA4.f | Se ha reconocido la representación lógica y espacial de una escena gráfica sobre un juego existente. |

RA4 conserva 15 % global PMDM. Pesos globales: RA1 10 %, RA2 35 %, RA3 20 %, RA4 15 %, RA5 20 %; todos los RA ≥5, evidencia auténtica suficiente y prueba presencial práctica global obligatoria ≥5. I3 de esta UD no reemplaza la prueba global. No hay nuevos pesos por tabla, motor, experimento, test o número de nodos.

## Trazabilidad por CE

| CE | Evidencia | Instrumento | Autenticidad | Recuperación nueva |
|---|---|---|---|---|
| RA4.a | L01 diferencia arquitectura 2D/3D y responsabilidades | I1 identificación; I2 tabla explicada | Señalar ejemplos concretos en el proyecto propio | Expo Lab: exposición 2D y visor 3D, relaciones distintas |
| RA4.b | L01/L04 servicios motor y lógica específica | I2 mapa de subsistemas | Explicar un evento y la responsabilidad que lo procesa | Cámara orbital/UI/tiempo con nuevas preguntas |
| RA4.c | L02 editor/runtime/configuración y entorno | I2 recorrido del editor y registro | Abrir el corte, localizar propiedad y explicar efecto | Nuevo proyecto/escena principal y limitación de entorno |
| RA4.d | L03 comparación razonada con fuentes/límites | I2 decisión documentada | Defender qué está documentado y qué se observó | Selección para exposición interactiva, sin inventar benchmark |
| RA4.e | L04 bloques del minijuego existente | I2 mapa/estados y contraste | Predecir éxito, error, timeout y entrada terminal | Analizar timeout y reinicio desde nuevo recorrido; evidencia propia |
| RA4.f | L05/L06 árbol, dependencias y coordenadas | I2 experimento; I3 modificación nueva | Calcular, modificar y explicar sin ayuda generativa | Escala anidada en 2D y órbita de cámara sobre objeto fijo |

## Rúbrica analítica sin promedios internos nuevos

| CE | No evidenciado | En desarrollo | Suficiente | Avanzado |
|---|---|---|---|---|
| a | Confunde 2D/3D o no identifica partes | Enumera tipos sin relaciones | Explica partes y relaciones de ambas arquitecturas con ejemplos | Justifica una diferencia de diseño y su consecuencia |
| b | Atribuye todo al script o a la imagen | Reconoce algunos servicios sin flujo | Distingue subsistemas del motor y lógica del caso | Predice un fallo al cambiar una responsabilidad o conexión |
| c | No identifica proyecto/editor/runtime | Recorrido incompleto o versión indeterminada | Localiza herramientas/configuración y registra entorno real | Diagnostica una limitación sin generalizar fuera de evidencia |
| d | Opinión sin fuente o benchmark inventado | Comparación parcial sin implicación | Compara criterios pertinentes, fuentes y límites; justifica Godot | Explica una alternativa y coste de cambio sin contradecir decisión docente |
| e | Solo captura nodos sin comportamiento | Bloques sin transición o final de ronda | Relaciona entrada/estado/tiempo/UI/audio/reinicio con métodos | Detecta guard terminal o dependencia que evita un fallo concreto |
| f | Confunde local/global y padre/recurso | Cálculo o mapa incompleto | Representa jerarquía/dependencias y predice cambio contrastado | Explica una variante nueva con giro/escala o cámara y límite observable |

El docente juzga suficiencia por CE y evidencia individual, no suma celdas como porcentaje. Los tests headless del material controlan errores técnicos; no asignan nota ni observan la exploración del alumno. Una QA de entorno pendiente exige acceso y oportunidad, no un dato inventado.

## Verificación y devolución

I3: tramo de modificación individual y explicación dentro de la [misión T1 de 45 min](../Alumnado/03_MISION_T1_PM8.md), presencial o desde casa, **una vía**. La variante exige predecir y justificar una relación, no construir un juego desde cero. Recoger predicción, corte, diff/valores, comprobación, restauración y explicación individual observada; si falta supervisión, `PENDIENTE_SUPERVISION`. La cita sustituye parte de T1; no genera trabajo adicional. La prueba práctica presencial global del módulo sigue separada.

Feedback: indicar CE afectado, evidencia insuficiente, error conceptual concreto y nueva comprobación. Tardanza ≤72 h no produce recorte numérico automático; después, recuperación conforme a evaluación v1.0. Recuperación focalizable, con caso/condición nueva; ampliación voluntaria. No se califica estética, precio del equipo ni preferencia de motor.
