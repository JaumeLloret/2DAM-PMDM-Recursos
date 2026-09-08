# Guía del alumnado PM2

## Meta

Al terminar podrás convertir datos y reglas dispersas en una estructura de clases Dart pequeña y defendible. No necesitas construir interfaz Flutter, conectarte a una API ni persistir datos.

## Ruta de 480 minutos

| Orden | Trabajo | Min | Termina cuando… |
|---|---|---:|---|
| 1 | Diagnóstico | 25 | ejecutas/lees `main` y registras bloqueo real |
| 2 | Tipos y null safety | 65 | completas K1–K2 y explicas por qué no usar `!` |
| 3 | Funciones, records y colecciones | 75 | completas K3–K6 con salida esperada |
| 4 | Taller 1 | 55 | localizas debilidades del starter |
| 5 | Clases, enums, composición e inmutabilidad | 80 | completas K7–K9, K11–K12 |
| 6 | Asincronía | 55 | corriges K10 y explicas el `Future` |
| 7 | Laboratorio | 70 | ejecutas tu solución y completas decisiones |
| 8 | Taller 2 | 55 | resuelves una variación individual sin agente y explicas el impacto |
| **Total** |  | **480** | |

No hay deberes obligatorios añadidos. Ampliación es voluntaria.

## Antes de empezar · 25 min

1. Ejecuta `dart --version` o anota `ENTORNO_PENDIENTE`.
2. Entra en el starter y prueba `dart run bin/main.dart`.
3. Localiza [bin/main.dart](../Alumnado/Starter/aulaflow_dart_domain_lab/bin/main.dart), [lib/](../Alumnado/Starter/aulaflow_dart_domain_lab/lib) y [pubspec.yaml](../Alumnado/Starter/aulaflow_dart_domain_lab/pubspec.yaml).
4. Predice una línea de salida antes de ejecutar.
5. Marca tu semáforo: verde, ámbar o rojo y describe un bloqueo reproducible.

No uses estos 25 minutos para reinstalar todo Flutter. Si el SDK no funciona, avisa con comando y mensaje exactos; continúa leyendo los ejemplos y usa la contingencia indicada.

## Cómo estudiar

Para cada fragmento:

1. predice tipo, valor o error;
2. ejecuta;
3. compara;
4. cambia una sola cosa;
5. explica la regla en una frase.

Copiar un fragmento sin poder predecirlo no completa la actividad.

## Entrega

Entrega un ZIP o repositorio con:

- paquete Dart ejecutable;
- código fuente, [pubspec.yaml](../Alumnado/Starter/aulaflow_dart_domain_lab/pubspec.yaml) y, si existen, tests;
- `DECISIONES.md` con clase → responsabilidad/regla → alternativa descartada;
- `EVIDENCIA.md` con versión, comandos y salidas relevantes;
- sin `.dart_tool/`, `build/`, secretos, datos personales ni soluciones docentes.

Los comandos de referencia del laboratorio son `dart format --output=none --set-exit-if-changed .`, `dart analyze`, `dart run bin/main.dart` y `dart test`.

## Criterio de éxito

No gana quien crea más clases. Tu diseño es válido si:

- cada clase tiene una responsabilidad explicable;
- el estado inválido se impide en el lugar adecuado;
- tipos y nulabilidad representan el problema;
- la composición evita herencia accidental;
- la mutabilidad está controlada;
- la operación asíncrona se entiende y maneja su fallo;
- puedes introducir un cambio pequeño sin romper el modelo.

## Uso de IA

Si la actividad lo permite, puedes pedir explicaciones, alternativas o revisión. Debes:

- anotar qué parte influyó en tu solución;
- verificar con analyzer/ejecución;
- corregir errores;
- explicar y modificar el resultado.

La verificación individual se hace sin agente. Nunca pegues credenciales, datos personales ni material reservado.

## Si te bloqueas

1. reduce el caso;
2. copia el error exacto;
3. identifica archivo/línea;
4. formula qué esperabas;
5. consulta teoría/ejemplo;
6. pide ayuda con esa evidencia.

Las tutorías T son apoyo bajo demanda, no una clase colectiva adicional.

