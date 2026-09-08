# Gimnasio · PM1

Estas actividades entrenan antes del laboratorio. No generan por sí solas toda la evidencia evaluable.

## G0 · Diagnóstico no punitivo · 20 min

Completa individualmente:

1. SO y arquitectura del equipo.
2. RAM disponible y espacio libre aproximado.
3. ¿Virtualización activada, desconocida o no disponible?
4. ¿Has usado Dart/Flutter? Describe una acción concreta, no «nivel medio».
5. ¿Puedes abrir una terminal y localizar una carpeta?
6. Interpreta:

```dart
if (profile.memoryGb <= 3) {
  return 'Modo ligero';
}
```

7. ¿Qué evidencia te convencería de que una app se ejecutó en emulador?
8. Primer bloqueo que anticipas y ayuda que necesitarías.

El diagnóstico no tiene calificación. Sirve para organizar equipos y contingencias.

## G1 · Restricción → consecuencia · 12 min

Relaciona y justifica cada pareja:

| Restricción | Consecuencia candidata |
|---|---|
| red medida/intermitente | A. no depender de procesos siempre vivos |
| memoria limitada | B. reducir descargas/reintentos inútiles |
| pausa por el sistema | C. evitar retener recursos innecesarios |
| interacción con un dedo | D. objetivos visibles y alcanzables |

No basta con escribir letras: explica una consecuencia si se ignora.

## G2 · Elección con contexto · 20 min

Elige una familia tecnológica y una alternativa para cada escenario:

1. Una empresa solo necesita Android, integra una API de hardware recién publicada y ya tiene equipo Kotlin.
2. Un equipo pequeño debe entregar Android e iOS con experiencia visual coherente y domina Dart/Flutter.
3. Un catálogo informativo cambia cada día, debe abrirse desde enlace y usa pocas capacidades del dispositivo.

Usa al menos cuatro criterios: acceso a plataforma, rendimiento, UI, equipo, reutilización, despliegue o mantenimiento. Incluye una limitación de tu elección.

## G3 · Detecta marketing · 8 min

Reescribe de forma profesional:

- «Flutter sirve para cualquier app».
- «Nativo siempre es más rápido».
- «Una PWA funciona igual en todos los móviles».
- «Un solo código elimina las pruebas por plataforma».

Patrón: **afirmación condicionada + contexto + evidencia que pedirías**.

## G4 · Clasifica dispositivos · 15 min

Ordena dos AVD propuestos:

- Perfil A: API 24, 2 GB, pantalla compacta, red medida.
- Perfil B: API 36, 6 GB, pantalla grande, red estable.

Para una app de consulta de tareas, decide:

- qué riesgo prueba cada uno;
- cuál usarías primero;
- qué resultado debe mantenerse en ambos;
- qué dato falta para afirmar compatibilidad real.

## G5 · Perfil dispositivo–aplicación · 20 min

Completa:

| Campo | Decisión |
|---|---|
| Usuario/contexto |  |
| Función crítica |  |
| API mínima |  |
| Memoria objetivo |  |
| Pantalla/orientación |  |
| Red |  |
| Capacidad física necesaria |  |
| Degradación aceptable |  |
| Evidencia en emulador |  |

Revisión por pares: la otra persona debe detectar una afirmación no comprobable.

## G6 · Lee la estructura · 15 min

Sin ejecutar el starter:

1. localiza `main()`;
2. enumera tres clases relevantes;
3. dibuja el recorrido hasta el texto de decisión;
4. predice la salida;
5. señala un archivo generado y otro escrito para la práctica.

## G7 · Triage de entorno · 15 min

Para cada caso escribe **primer comando**, **hipótesis** y **una acción**:

- terminal no encuentra `flutter`;
- `doctor` marca licencias;
- existe AVD pero `flutter devices` está vacío;
- emulador se cierra al arrancar;
- la app compila, pero el cambio no aparece.

## Criterio de autocorrección

Tu respuesta es útil si otra persona puede:

- reproducir el razonamiento;
- discutir el criterio elegido;
- saber qué observar o ejecutar;
- distinguir hecho, hipótesis y decisión.


