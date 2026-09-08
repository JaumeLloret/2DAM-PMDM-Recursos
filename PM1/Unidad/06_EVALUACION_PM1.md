# Evaluación · PM1

## 1. Marco vinculante

- RA1 pesa **10 % del módulo**.
- Todos los RA del módulo deben alcanzar 5/10.
- La prueba presencial obligatoria global de PMDM debe alcanzar 5/10.
- PM1 no crea un examen global propio ni un porcentaje paralelo.
- No se asignan ponderaciones internas nuevas a CE o instrumentos.
- Se recuperan RA/CE pendientes mediante evidencia nueva.

## 2. Instrumentos

- **I1 · Dossier técnico**: diagnóstico, limitaciones, comparación, perfil y entorno.
- **I2 · Artefacto**: starter modificado, diff y ejecución.
- **I3 · Verificación individual**: localización, predicción, ejecución, microcambio/diagnóstico y explicación sin agente.

## 3. Trazabilidad completa

| CE | Evidencia observable | Instrumento | Autenticidad |
|---|---|---|---|
| RA1.a | analiza batería, recursos, red, pantalla, interacción/ciclo de vida en el caso | I1 | pregunta contextual y contraejemplo |
| RA1.b | elige tecnología para escenarios con criterios y límites | I1 | justificación oral de una elección |
| RA1.c | versiones, `doctor`, SDK/licencias, dispositivos y comandos reproducibles | I1 + I3 | reproduce o diagnostica un paso |
| RA1.d | clasifica al menos dos configuraciones por API/recursos/pantalla/red | I1 | docente cambia una característica |
| RA1.e | relaciona perfil, función, riesgo, degradación y prueba | I1 + I3 | explica por qué una característica cambia la decisión |
| RA1.f | mapa `main → app → screen → model` y clases/widgets localizados | I2 + I3 | localización en copia controlada |
| RA1.g | regla funcional y perfil modificados con diff antes/después | I2 + I3 | microcambio individual inesperado |
| RA1.h | ejecución real en AVD, dispositivo visible y resultado comprobado | I2 + I3 | demo en emulador y pregunta |

## 4. Rúbrica analítica sin pesos inventados

### Dimensión A · Limitaciones y elección · RA1.a–b

- **Sin evidencia**: enumera lemas o copia ventajas sin relacionarlas con el caso.
- **Inicial**: identifica alguna limitación/tecnología, pero la decisión no es comprobable.
- **Adecuado**: relaciona varias restricciones con consecuencias y elige con criterios, incluyendo límites.
- **Sólido**: contrasta alternativas, explicita supuestos y propone evidencia para decidir.

### Dimensión B · Configuraciones y perfiles · RA1.d–e

- **Sin evidencia**: usa etiquetas vagas como «móvil normal».
- **Inicial**: lista características sin conectarlas con requisitos.
- **Adecuado**: define API/recursos/pantalla/red, riesgo y prueba coherentes.
- **Sólido**: compara perfiles y explica degradación/resultado esperable.

### Dimensión C · Entorno reproducible · RA1.c,h

- **Sin evidencia**: no hay comandos verificables ni ejecución en emulador.
- **Inicial**: toolchain parcial o captura sin trazabilidad; bloqueo no diagnosticado.
- **Adecuado**: versiones y comandos reproducibles, AVD Android visible y app ejecutada.
- **Sólido**: además diagnostica una incidencia separando síntoma, hipótesis, acción y verificación.

### Dimensión D · Lectura y modificación · RA1.f–g

- **Sin evidencia**: no localiza el flujo o entrega código no explicable.
- **Inicial**: localiza archivos, pero el cambio es cosmético/incompleto.
- **Adecuado**: reconstruye clases/flujo e implementa la regla con dos perfiles observables.
- **Sólido**: explica diff y adapta correctamente un microcambio no ensayado.

### Dimensión E · Autenticidad y comunicación

- **Sin evidencia**: no puede reproducir, localizar o explicar.
- **Inicial**: explicación memorizada que no resiste una variación.
- **Adecuado**: ejecuta, localiza y explica con vocabulario suficiente.
- **Sólido**: diagnostica o transfiere la decisión a un perfil nuevo justificando límites.

### Registro de la calificación de RA1

La rúbrica **no se convierte en una media automática ni en cinco porcentajes nuevos**. El registro numérico de RA1 se realiza mediante juicio profesional criterial, apoyado en:

1. la evidencia observable de los ocho CE;
2. los descriptores de esta rúbrica;
3. la triangulación I1 + I2 + I3;
4. la autenticidad demostrada.

No se presupone que todos los CE tengan el mismo peso ni se inventa una ponderación interna. Si un CE carece de evidencia suficiente, queda `pendiente` y debe recuperarse antes de considerar RA1 adquirido con ≥5. La nota de RA1 que finalmente se registre se integra después con el **10 % global** ya aprobado en la evaluación de PMDM.

## 6. IA y autenticidad

La ayuda opcional de IA no invalida la entrega si el alumno:

- declara la ayuda relevante;
- verifica la propuesta;
- explica y modifica el resultado;
- no comparte secretos/datos personales;
- completa I3 sin agente.

No se usan detectores automáticos como prueba de autoría.

## 7. Entregas tardías

- en plazo: evaluación ordinaria;
- justificada: reprogramación sin penalización automática;
- no justificada ≤72 h: se acepta tardía, puede perder el mismo ciclo de feedback;
- >72 h: carril de recuperación de RA1/CE afectados;
- sin entrega: sin evidencia / pendiente.

## 8. Decisión de suficiencia

No basta sumar productos. Para declarar RA1 adquirido debe existir evidencia auténtica suficiente de sus ocho CE y superación según el marco global de PMDM. Un CE puede requerir nueva evidencia aunque el artefacto general funcione.

