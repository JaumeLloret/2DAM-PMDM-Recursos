# Trabaja con un agente: observa, limita, verifica y corrige

Este recorrido se integra en A03, T1, A04 y A05. No añade otra aplicación ni otra entrega: ensayas sobre **Avisos DEMO** y transfieres lo aprendido a Consulta DEMO. El registro es una fila breve en D03–D06 cuando corresponda. En T1 reservas 15 min para los pasos 1–4; los 30 restantes conservan tu primer incremento de Consulta DEMO. El ejemplo sustituye el ejercicio suelto de revisar OR/AND, no lo duplica.

## 1. Abre una copia de ensayo y predice antes de ejecutar

Descarga `PM7_EJEMPLO_AVISOS.zip` desde «Ejecuta el ejemplo completo». Abre su raíz, con `pubspec.yaml`, en tu IDE. Comprueba Flutter 3.47.8/Dart 3.13.7 y Python 3. En Windows usa `py -3` donde aparezca `python`. Ejecuta `flutter pub get` y `flutter test`: las tres pruebas del ejemplo deben pasar. Si falla la instalación, usa la página Entorno; no atribuyas ese error a un agente.

Escribe tu predicción: prioridad mínima 3, ocultar leídos → solo AV-A. Cambiar solo ocultar leídos a falso → AV-A, AV-C. La fuente conserva A,B,C. No mires aún la propuesta preparada. Esta expectativa procede de la regla, por lo que puede detectar un error compartido por código y tests.

El script del siguiente paso prepara una carpeta **nueva** `ensayo_agente` dentro del ejemplo, copiando únicamente los archivos necesarios. Se detiene si esa carpeta ya existe; no borra ni reemplaza tu trabajo. El contenido es un caso simulado explícito, no una transcripción de una sesión real de IA.

## 2. Ejecuta la propuesta defectuosa y el test débil

Desde la raíz de Avisos DEMO:

```sh
python ensayo_agente.py preparar
cd ensayo_agente
flutter pub get
flutter test
```

Esperas **un test verde** que solo afirma que la lista no está vacía. Abre `lib/notices.dart` y `test/propuesta_test.dart`. La propuesta combina condiciones con OR. Para prioridad 3 y ocultar leídos, obtiene A,B,C: B entra por no leído y C por prioridad. El test débil acepta ese resultado porque contiene elementos. Es un verde real y una conclusión de producto falsa.

**Detente y explica:** ¿qué afirmación puedes sostener? Que esa aserción pasó en ese corte. ¿Cuál no? Que se cumple la regla de prioridad y lectura. Si el test no llega a ejecutarse, conserva el primer error y corrige el montaje antes de sacar conclusiones.

## 3. Añade una comprobación independiente y lee el rojo

Vuelve un nivel a la raíz del ejemplo y copia la prueba independiente mediante el script:

```sh
cd ..
python ensayo_agente.py reforzar
cd ensayo_agente
flutter test test/contrato_test.dart
```

Esperas un **fallo de aserción**: debía aparecer solo AV-A y aparecen A,B,C. La prueba verifica IDs desde la regla, no desde lo que devolvió la implementación. Abre `test/contrato_test.dart`, localiza su expectativa y compárala con tu predicción inicial. No edites la expectativa para aceptar el defecto.

Ahora corrige en `ensayo_agente/lib/notices.dart` la combinación para exigir ambas condiciones. Ejecuta:

```sh
dart format lib test
flutter analyze --fatal-infos
flutter test
```

Esperas dos pruebas verdes: la débil y la independiente. La segunda es la que discrimina este error. Escribe una fila en D05 con modo **ENSAYO SIMULADO**, comando, antes/después y límite: no se ha ejecutado un modelo ni observado una sesión de agente. El docente valida estos mismos pasos en el material; tus resultados deben ser los de tu ejecución.

## 4. Construye un contexto que permita revisar la misma tarea

Abre `lab_agente/encargo_revision.md` y `lab_agente/AGENTS.ejemplo.md`. El primero contiene el objetivo de un incremento; el segundo muestra reglas persistentes del proyecto. No son intercambiables: el objetivo cambia entre tareas, mientras los comandos y límites estables pueden conservarse.

Prepara esta petición con tus palabras: «Lee la regla y `lib/notices.dart`. Sin editar, predice los IDs para prioridad 3 y ocultar leídos. Señala si el código actual cumple la regla y qué prueba lo demostraría. No aceptes el verde de `propuesta_test.dart` como prueba del contrato». Si completaste el paso 3, el código actual ya utiliza AND y debe devolver AV-A. Contrástalo con los A,B,C que registraste para la propuesta OR anterior: no presentes ese defecto histórico como si siguiera en el archivo corregido. La respuesta útil localiza función y condición y distingue ambos cortes.

Si solo hay modo MANUAL, haz tú ese recorrido sobre los archivos del ensayo: produces la misma decisión y evidencia. Si hay una herramienta real autorizada, sigue el capítulo siguiente y compara su propuesta con tu predicción, sin sustituirla por una respuesta modelo. La competencia consiste en dirigir y verificar, no en aparentar una conversación.

## 5. Vía con agente real: ejemplo concreto con Pi

Esta vía requiere **entorno y acceso a modelo autorizados**. El ejercicio reproducible anterior funciona sin ellos; no se contrata una suscripción ni se obliga a usar un proveedor. El docente no certifica una sesión de modelo por haber verificado el CLI. Pi es una referencia concreta de aplicación; las decisiones son transferibles a otra herramienta autorizada.

En la VM/copia de prácticas sin archivos ni credenciales ajenos al ejercicio, comprueba Node.js 22.19 o posterior y npm. Si Pi ya está preparado por el centro, registra `pi --version` y consulta `pi --help`. Para la referencia fijada de esta edición:

```sh
npm install -g --ignore-scripts @earendil-works/pi-coding-agent@1.0.0
pi --version
pi --help
```

El paquete y la versión se fijan para reproducir el ejemplo, no se usa `latest`. La documentación vigente usa `@earendil-works`; vídeos anteriores pueden mostrar `@mariozechner`. No combines nombres o flags de ediciones distintas. La referencia 1.0.0 no ofrece el argumento `--no-mcp` que aparece en documentación posterior: aquí `--no-extensions` desactiva también las extensiones integradas, incluido ese soporte; no se añaden extensiones explícitas. Si la versión o los argumentos no coinciden, conserva el diagnóstico y usa el ensayo sin modelo mientras el docente adapta la configuración. Las condiciones de acceso al proveedor se revisan por separado.

Desde **la carpeta del ensayo** inicia una sesión sin extensiones, skills ni conexiones MCP y con lectura como única herramienta ofrecida al modelo:

```sh
pi --no-extensions --no-skills --no-prompt-templates --no-context-files --tools read
```

Configura solo el proveedor autorizado mediante `/login` y elige el modelo disponible con `/model`; las claves se introducen en el mecanismo de la aplicación, nunca en el dossier, un prompt o Git. Indica las rutas exactas y pega la petición del capítulo 4. Al deshabilitar archivos de contexto, el ejemplo no carga automáticamente reglas del equipo: aporta explícitamente el encargo y comprueba las lecturas que muestra. Conserva versión de aplicación/modelo y la observación real.

Si ya corregiste AND, una revisión válida puede confirmar que no hace falta cambiarlo. No inventes un defecto para obtener una edición. Para ensayar una reparación con agente en lugar de la corrección manual del paso 3, utiliza otra copia limpia del ZIP, ejecuta los pasos 1–2 y detente antes de corregir. Mantén el mismo presupuesto de práctica: eliges una vía, no repites ambas como requisito.

Para ese incremento autorizado con edición, cierra la sesión y reinicia cambiando `--tools read` por `--tools read,edit`; así no ofreces la terminal al modelo. Pide corregir únicamente la combinación defectuosa en `lib/notices.dart` y explicar el diff. **La selección de herramientas no encierra la aplicación en esa carpeta**: el entorno aislado y sus accesos siguen siendo necesarios. Tú ejecutas el paso 3 para comprobar la expectativa independiente y los comandos de Flutter; no se atribuyen al agente si no los ejecutó.

No añadas flags de aprobación automática ni extensiones para resolver este ejercicio. [CLI de Pi](https://pi.dev/docs/latest/cli), [arranque](https://pi.dev/docs/latest/quickstart) y [seguridad](https://pi.dev/docs/latest/security) son las referencias primarias. Si usas Claude Code u OpenCode, identifica sus controles equivalentes con su documentación; no supongas que «Plan» significa la misma restricción en ambas.

## 6. De un ensayo a una funcionalidad propia

En Consulta DEMO sigue la misma disciplina, con la tarjeta S1–S7 como fuente. En T1 realiza tu primer incremento de búsqueda: entrada, IDs, prueba y cambio pequeño. Conecta pronto un caso visible en la pantalla; después completa los demás criterios en A04. Utiliza la función pura para probar la regla, no como excusa para posponer toda la interacción hasta el final.

Antes de cada incremento decide: qué sabe el agente, qué archivo puede cambiar, qué queda fuera y qué resultado aceptarás. Después revisa **todo** el diff respecto al baseline: código, tests, documentación y dependencias. Si propone silenciar un test, introducir una librería o reescribir la app, pídele que justifique la necesidad; rechaza lo que no responda al alcance. Si la spec necesita cambiar, registra primero la decisión en D02 y versiona la expectativa anterior.

En A05 añade una comprobación de mantenibilidad: explica dónde vive la regla y qué modificarías para cambiarla. Un diseño que no puedes explicar requiere simplificación o estudio. Anota una decisión profesional concreta, por ejemplo «no introduzco Repository porque no hay fuente remota ni persistencia; la función pura separa la política del estado de UI». No es una norma universal contra los repositorios: es una justificación para este caso.

## 7. Comprobar aprendizaje y continuidad

Sin abrir el agente, responde: qué hace OR con el ejemplo, por qué el test débil pasa, qué información debe sobrevivir a una sesión nueva, qué permiso sobra y qué documento cambia si se altera la regla. Localiza cada respuesta en código, prueba o decisión; no basta memorizar definiciones.

Para continuar otro día prepara cuatro líneas: corte guardado, regla vigente, comandos realmente ejecutados y siguiente paso. Distingue una sesión retomada de una copia del código: recuperar la conversación no revierte archivos, y recuperar archivos no recupera por sí solo la conversación. Verifica ambos estados.

Conserva el ensayo local para estudiar, pero entrega tu proyecto Consulta DEMO y el dossier único. La modificación supervisada I3 será nueva; este ejercicio enseña el procedimiento y no anticipa una variante reservada. Una ejecución doméstica sin supervisión no se presenta como I3 observado.
