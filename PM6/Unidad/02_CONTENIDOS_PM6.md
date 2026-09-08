# Calidad observable en Flutter

## 1. Fallo, defecto y prueba

Un fallo es un comportamiento observado que no coincide con el esperado; un defecto es la causa en el código o diseño. Una prueba crea condiciones y compara resultados. No empieces cambiando código al azar: fija versión, entrada, acción y salida esperada/obtenida. «No funciona» no permite reproducir. «Con dos trabajos abiertos y uno terminado, el contador muestra1 en lugar de 2» ya distingue un comportamiento concreto.

Una prueba de regresión conserva esa distinción para detectar si el defecto vuelve. Primero debe fallar por el motivo previsto. Si falla porque el paquete no se encuentra, todavía no has probado el contador. Cuando la corrección la pone verde, revisa un caso límite que evite una solución demasiado específica: todos terminados, ninguno o lista vacía. El objetivo es confianza proporcional, no acumular tests.

## 2. Elegir nivel de prueba

Una prueba unitaria observa una función/clase; es rápida y controla dependencias. Una de widget monta UI en el entorno de test de Flutter, interactúa y examina árbol/resultados. Una de integración ejecuta una parte amplia o la app sobre un entorno objetivo. Ninguna sustituye automáticamente a todas las demás. Una unit de pendingCount no detecta un botón desconectado; una widget de botón no demuestra que Android instaló el paquete.

Para Quality Gate usamos unitarias de estado/orden/retry/dispose, widgets de error/vacío/toggle y un recorrido de integración Android. Este último usa datos DEMO; no acredita backend ni permisos nativos. El paquete integration_test no interactúa por sí solo con todos los diálogos del sistema: no lo uses como prueba de permisos que no has observado. PM5 conserva su QA física particular.

La cobertura muestra qué código se ejecutó, no si las expectativas detectan el error importante. Una prueba puede recorrer todo y no comprobar nada relevante. Al diseñar la suite pregunta: ¿qué regresión concreta detecta?, ¿qué dependencia controla?, ¿qué queda fuera? No se otorga nota por porcentaje aislado o cantidad de tests.

## 3. Dependencias, fakes e inyección

TaskStore define una operación fetch. QualityController recibe un store por constructor; no crea una red oculta dentro de cada método. Esto permite usar DemoStore en la aplicación y ControlledStore en pruebas. Un fake implementa un comportamiento controlado: aquí devuelve Futures que el test resuelve cuando necesita. No es una mentira si se identifica como tal; sí lo sería presentarlo como observación de un servidor real.

Un stub suele devolver respuestas predefinidas; un mock permite comprobar interacciones; un fake tiene implementación simplificada. No necesitas una biblioteca de mocks para cada clase. Prefiere el doble más sencillo que permita observar el contrato, evitando expectativas sobre detalles privados que hagan frágil la suite. Inyectar una dependencia no implica introducir un contenedor de DI complejo.

En Dart, Completer permite crear un Future y decidir cuándo se completa. Inicias solicitud1 y 2; completas2 primero con NEW, después1 con OLD. El estado debe conservar NEW si la política es «la última solicitud iniciada gobierna». Esa política debe escribirse; otro producto podría necesitar cola o cancelación. Una generación incremental identifica qué respuesta puede modificar el estado. No es cancelación de la operación externa: la respuesta vieja puede terminar, pero se ignora.

## 4. Estado asíncrono y ciclo de vida

Un flujo de carga tiene inicio, éxito, error y finalización. Al empezar, loading se activa y el error anterior se limpia. Si hay éxito se reemplaza la lista; si hay error se muestra una salida recuperable; finalmente loading debe dejar de indicar trabajo en curso. Un error que deja un spinner eterno impide comprender si se puede reintentar.

Varias solicitudes simultáneas complican finally: una respuesta vieja no debe apagar el indicador de una nueva ni publicar su error encima. Comprueba generación tanto en éxito como error/finalización. En dispose se invalidan respuestas pendientes y se liberan referencias. notifyListeners tras dispose puede provocar error; ocultarlo con try/catch general no es gestión del ciclo de vida. Una prueba de notificaciones puede demostrar el contrato del controlador en host, pero no el ciclo de vida físico de Android.

La identidad estable importa al modificar elementos. Un índice puede cambiar por ordenación o filtrado; un ID identifica la entidad. En la práctica toggle recibe id y reconstruye una lista inmutable. Evita modificar una lista compartida que otro componente considera snapshot; esa mutación puede hacer que el test y la app observen estados distintos.

## 5. Escribir pruebas legibles

Organiza Arrange, Act, Assert: crea entrada/doble, ejecuta acción y examina salida. El nombre debe expresar conducta. «test1» no ayuda a diagnosticar. Usa addTearDown para liberar controlador cuando corresponde. Controla tiempo/respuestas; no uses esperas largas para confiar en que una red responderá antes de un límite arbitrario.

En widget tests, pump construye o avanza un frame; pumpAndSettle espera que no haya frames pendientes. Un spinner infinito puede impedir que se estabilice. Para un error de carga usa Completer y pump controlado, de modo que el test observe el estado sin esperar un final que el defecto impide. Busca por texto de usuario o Key estable cuando el texto pueda repetirse. Una Key no es una credencial ni dato privado.

Prueba también que una acción produce la consecuencia visible. Si el contador cambia pero el botón nunca invoca toggle, la unit estará verde y la interacción fallará. Una aserción que encuentra un widget no demuestra que el recorrido sea correcto. Incluye al menos un estado vacío y uno de error/reintento, con una salida comprensible para el usuario.

## 6. Analyzer, lints y depuración

El analyzer detecta problemas estáticos sin ejecutar la aplicación. Los lints ayudan a mantener reglas de código, pero no comprueban que el contador represente trabajos abiertos. `flutter analyze --fatal-infos` convierte los diagnósticos relevantes de ese comando en una condición del pipeline. No silencies todo un archivo para «pasar CI»; entiende el aviso y justifica excepciones puntuales si fueran necesarias.

`dart format` normaliza formato; no arregla la lógica. Comprueba el diff después de formatear, especialmente si se mezclan cambios de comportamiento. La versión fijada evita ruido de otro formateador. El pipeline puede comprobar `--output=none --set-exit-if-changed` y fallar si hay diferencias; el alumno ejecuta formato y revisa el resultado antes de subir.

Para depurar, crea un caso mínimo, pon un breakpoint antes de actualizar estado y observa entrada/generación/error. Paso a paso muestra una ejecución, no todas las intercalaciones. Convierte el caso encontrado en una prueba controlada. Registra la hipótesis que descartaste; no hace falta grabar horas de terminal ni publicar datos del entorno.

## 7. DevTools: inspector y rendimiento

El inspector ayuda a relacionar árbol de widgets con UI. Selecciona el contador, identifica su origen y comprueba restricciones de la lista. Si hay overflow, revisa el layout y el tamaño de texto antes de cambiar todo a tamaños fijos. Conserva una descripción textual junto a una captura saneada.

Para rendimiento, usa modo profile en un objetivo compatible; los tiempos debug no representan el rendimiento de release. Mantén dispositivo/modo/carga y recorrido iguales entre variantes, deja una fase de calentamiento y repite. Un primer frame puede incluir compilación/preparación; no extraigas una conclusión universal de una sola barra. En60Hz el presupuesto orientativo es16,7ms por frame; en 120 Hz es8,3ms. Debes registrar la frecuencia/objetivo, no usar16ms como ley de cualquier pantalla.

El trabajo UI y raster representan partes distintas del frame. Una lista con1500hijos construidos de golpe puede aumentar trabajo del árbol; ListView.builder crea lo necesario de forma perezosa. Para probarlo, prepara una copia eager y una builder, usa la misma lista y recorrido, registra trazas y explica qué se modificó. No inventes una mejora porcentual si no se observó. Tampoco declares que builder garantiza60fps en cualquier equipo.

## 8. Memoria, retención y límites

La vista Memory ayuda a observar asignaciones, retención y evolución. Una lista history que guarda cada snapshot mantiene referencias: esas listas no se liberan mientras sigan alcanzables. El GC puede liberar objetos inalcanzables, pero no deduce que ya no necesitas una colección a la que tu programa sigue apuntando.

La práctica limita history a20snapshots como política didáctica. Una prueba verifica número/retención lógica. Para hablar de memoria real, toma cortes antes/después de un recorrido definido, repite cargas y observa objetos/referencias con las limitaciones del entorno. El RSS del proceso incluye más que heap Dart y puede no bajar de inmediato al quitar referencias. No confundas «history está acotado» con «se observaron exactamente X MB liberados».

Si la herramienta no está disponible, entrega procedimiento y marca PENDIENTE_DEVTOOLS; luego realiza la observación en un entorno docente. Una gráfica de un ejemplo ajeno no es tu medición. El informe distingue observación, hipótesis y prueba adicional necesaria.

## 9. Empaquetar e implantar en Android

Empaquetar produce un artefacto instalable con código/recursos/configuración. Desplegar implica instalarlo y comprobarlo en un destino concreto. `flutter build apk --debug` produce APK de práctica, no una release firmada para publicar en una tienda. La firma de producción y publicación comercial quedan fuera del alcance; no subas keystores ni contraseñas.

La plataforma Android se genera con Flutter fijado mediante `flutter create --platforms=android --org org.aulaflow.training --project-name quality_gate .` desde una copia de la práctica. Conserva lib/test/pubspec; revisa diff y evita mantener el test contador generado por la plantilla, que no corresponde a esta app. La generación no convierte el código del starter en solución. Comprueba `flutter doctor -v`, Java/SDK y licencias en tu entorno autorizado; no aceptes acuerdos ajenos sin autorización.

Después de construir, identifica SHA del código y huella SHA256 de la APK. En un emulador ejecuta el recorrido DEMO y registra API/arquitectura/modo. En dispositivo real habilita la conexión de depuración solo con autorización del propietario, selecciona el destino correcto e instala la APK de práctica. El flujo debe cargar, mostrar error recuperable, reintentar y modificar un trabajo. Registra lo observado y cualquier diferencia. No publiques seriales o capturas de notificaciones personales.

Si una instalación falla por firma incompatible, comprueba primero el ID de esta app de práctica; no borres AulaFlow real ni otros datos para resolverlo. Si falta hardware, organiza acceso real con el docente y deja RA2.h pendiente de evidencia. Una APK, un test de widget o un emulador no demuestran dispositivo móvil real.

## 10. CI y lectura de un resultado

Un pipeline ejecuta comprobaciones sobre un commit. Debe fijar toolchain, recuperar dependencias, comprobar formato/análisis, ejecutar tests y construir lo que corresponda. Un job falla para informar de una condición concreta; eliminar la aserción o ignorar todos los códigos de salida no corrige el defecto.

El SHA importa: si validas A y luego cambias código aB, el verde deA es histórico. Un checkout de una referencia de merge puede ser distinto del HEAD de la PR. El workflow docente hace checkout del SHA exacto que informa y verifica esa identidad. Después de una corrección repite los controles afectados y antes de entregar certifica el conjunto necesario.

Separa resultados: formato/analyzer, unit/widget, integración en emulador, build APK, instalación física, DevTools y accesibilidad real. El runner puede confirmar el baseline rojo esperado del starter en una copia temporal y la solución verde; lo registra explícitamente. Esa excepción didáctica no autoriza ignorar fallos inesperados. La CI nunca asigna nota ni concede puerta del proyecto por sí sola.
