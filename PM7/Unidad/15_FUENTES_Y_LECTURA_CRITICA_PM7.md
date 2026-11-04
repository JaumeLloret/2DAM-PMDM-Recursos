# Fuentes comentadas y lectura crítica

La teoría, los ejemplos y las consignas esenciales están escritos en PM7. Estos vídeos amplían, contrastan o muestran herramientas; no hay que verlos completos para realizar la unidad y no crean otra entrega. Las interfaces, paquetes y políticas cambian: contrasta los comandos con la versión y documentación oficial indicada en el laboratorio.

## 1. Vídeos aportados para la unidad

| Fuente | Para qué consultar y qué cuestionar |
|---|---|
| MoureDev · [El nuevo programador](https://www.youtube.com/watch?v=wbQWrrW_RI0) | Fundamentos, contexto, reglas y ampliación del entorno del agente. Distingue reglas escritas de controles efectivos. Una ventana grande no garantiza comprensión ni convierte una salida en verificación. |
| MoureDev · [Curso de Claude Code](https://www.youtube.com/watch?v=TCq7eZ9Lhc8) | Observa el trabajo por pasos y compara memoria, modos, skills y conexiones. Comprueba los permisos reales: las denominaciones de una interfaz no describen todos los límites de otra. |
| MoureDev · [Mi nuevo flujo con IA](https://www.youtube.com/watch?v=2G4aeaCTsHc&t=367s) | Desde 6:07, examina intención, diálogo y contexto. Conserva una especificación comprobable después de explorar; conversar no sustituye decidir qué resultado aceptarás. |
| HolaMundo · [Me equivoqué, NO uses Spec Driven Development](https://www.youtube.com/watch?v=5JjuF1zpNbI&t=1659s) | Desde 27:39, contrasta incrementos pequeños, pruebas y refactorización. La crítica a delegar grandes bloques no obliga a abandonar requisitos: en PM7 se documenta lo necesario y se verifica cada incremento. |
| Gentleman Programming Vods · [Matamos al SDD para siempre](https://www.youtube.com/watch?v=eGJoDxuILK0&t=20s) | Examina la crítica a una planificación rígida y a la documentación desproporcionada. Distingue el nombre de una metodología de sus prácticas concretas. Las cifras de ahorro requieren evidencia y condiciones de comparación. |
| HolaMundo · [La IA me tiene podrido...](https://www.youtube.com/watch?v=odwJdZNRxgU&t=275s) | Fuente complementaria de opinión, desde 4:35. No se utiliza como autoridad para comandos, requisitos o evaluación; no contiene una consigna obligatoria de PM7. |
| BettaTech · [El código generado por IA funciona. Ese es el problema](https://www.youtube.com/watch?v=t-Ilj_NgbNI&t=37s) | Desde 0:37, razona sobre calidad, mantenibilidad y confianza excesiva en tests. El ensayo del libro de trabajo con agente convierte esa preocupación en un fallo que puedes reproducir. |
| HolaMundo · [Pi es IMPRESIONANTE!](https://www.youtube.com/watch?v=p2kspDx5G6w) | Distingue modelo y harness; compara el contexto que añade cada configuración. Una demostración de latencia no fija un ganador universal. No deduzcas seguridad de que un modelo parezca competente. |
| MoureDev · [Control total con Pi Agent](https://www.youtube.com/watch?v=oKKJr7QIskI) | Consulta selectiva: 55:56 sesiones/contexto; 1:09:42 reglas y extensiones; 1:30:27 MCP; 1:41:26 seguridad, según el índice del autor. El laboratorio usa documentación oficial y una versión fijada, sin exigir este vídeo completo. |

## 2. Documentación primaria para resolver diferencias

| Pregunta | Referencia |
|---|---|
| ¿Cómo se relacionan modelo, herramientas y ciclo? | [Cómo funciona Claude Code](https://code.claude.com/docs/en/how-claude-code-works) y [cómo funciona Pi](https://pi.dev/docs/latest/how-pi-works) |
| ¿Qué son las reglas persistentes? | [AGENTS.md](https://agents.md/) y [memoria de Claude Code](https://code.claude.com/docs/en/memory) |
| ¿Qué configura realmente permisos? | [Claude Code](https://code.claude.com/docs/en/permissions), [OpenCode](https://opencode.ai/docs/permissions/) y [seguridad de Pi](https://pi.dev/docs/latest/security) |
| ¿Qué incluye una skill? | [Especificación Agent Skills](https://agentskills.io/specification) |
| ¿Qué estandariza MCP? | [Arquitectura de Model Context Protocol](https://modelcontextprotocol.io/docs/learn/architecture) |
| ¿Cómo inicio la referencia concreta de Pi? | [Quickstart](https://pi.dev/docs/latest/quickstart) y [CLI](https://pi.dev/docs/latest/cli) |
| ¿Por qué seleccionar el contexto y empezar sencillo? | [Ingeniería de contexto](https://www.anthropic.com/research/effective-context-engineering-for-ai-agents) y [agentes efectivos](https://www.anthropic.com/research/building-effective-agents) |

Documentación consultada el 03/11/2026. Son referencias de comportamiento y formatos; no prueban que un alumno haya ejecutado una sesión, dominado la técnica o adquirido RA2.i.

## 3. Tres preguntas para leer con criterio

Durante A05 elige **una** afirmación que afecte a tu práctica y añade su contraste a D06, sin crear otro documento. Puedes hacerlo con el contenido escrito de PM7, sin reproducir un vídeo.

1. **«Más contexto siempre mejora».** Selecciona qué información falta de verdad para S3. Explica por qué no necesitas todo el curso ni cómo encaja un recuerdo contradictorio con C5.
2. **«Si todo está verde, ya está terminado».** Usa el ensayo de la prueba débil: señala qué está comprobado, qué falla y qué evidencia independiente cambia la conclusión.
3. **«Esta metodología ya no sirve» o «esta herramienta es la mejor».** Traduce el eslogan a una decisión comprobable: tamaño de incremento, documentación necesaria, tiempo hasta resultado correcto, permisos o facilidad de modificación. Conserva la práctica útil, justifica el límite y evita convertir una opinión o demostración individual en una regla universal.

No se evalúa estar de acuerdo con un divulgador. Se evalúa explicar una decisión mediante comportamiento, código y evidencia auténtica. No es necesario comprar cursos, instalar paquetes de terceros ni contratar un modelo para realizar este contraste.
