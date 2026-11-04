# Ejemplos guiados · PM7

Son demostraciones reproducibles de decisiones de proceso. No son un historial de uso real de un agente o de un equipo. Realiza tu intento antes de consultar el resultado razonado. Registra únicamente los comandos que ejecutes tú.

## Antes de empezar · ejecuta un ejemplo completo

Descarga **PM7_EJEMPLO_AVISOS.zip** desde «Ejecuta el ejemplo completo · Avisos DEMO». Abre `avisos_demo` y sigue los comandos de su README para ver la pantalla y las pruebas iniciales. Contiene la especificación, una decisión, código y pruebas del mismo resultado. El ejemplo usa prioridad y avisos leídos; tu laboratorio usa búsqueda de títulos y estado. Estudia la relación entre regla y prueba antes de transferirla. Los 8 min iniciales forman parte de A02; el defecto preparado se trabaja una sola vez en T1.

## Tu primera prueba del laboratorio · rojo que sí discrimina

Trabaja en **tu copia** de `Practica/Starter/spec_search/`, la carpeta de `pubspec.yaml`. Ejecuta `flutter pub get`, `flutter analyze --fatal-infos` y `flutter test`: la prueba inicial monta la pantalla y cuenta cuatro entradas, pero todavía no contrasta búsqueda. En `lib/catalog.dart` añade temporalmente, debajo de `demoEntries`, esta firma de práctica (la implementación devuelve todo a propósito):

```dart
enum StatusFilter { all, pending, done }

List<Entry> selectEntries(
  List<Entry> source,
  String query,
  StatusFilter status,
) =>
    List<Entry>.of(source); // stub para provocar un rojo discriminante
```

Crea `test/search_test.dart` en esa misma copia:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:spec_search/catalog.dart';

void main() {
  test('S3: cámara y pendientes muestran solo DEMO-A', () {
    final visible = selectEntries(demoEntries, 'cámara', StatusFilter.pending);
    expect(visible.map((entry) => entry.id).toList(), ['DEMO-A']);
  });
}
```

Ejecuta `flutter test test/search_test.dart`. **Esperas un fallo de aserción:** el stub devuelve A,B,C,D y el criterio S3 espera solo A. Si falta el import o no compila, es un error de montaje, no ese rojo esperado: revisa nombre `spec_search` en `pubspec.yaml`, firma y carpeta con [Ayuda](11_AYUDA_PM7.md). Conserva en D05 comando, corte local y expected/actual. Ahora implementa una política que cumpla la tarjeta, añade casos S1–S5 y repite hasta verde; revisa el diff. El stub es un andamio didáctico, **no** una solución para entregar. Si usas otro nombre de API, adapta el test y deja la correspondencia en D04.

## 1. Convertir “buscador útil” en un contrato

Entrada: catálogo A “Revisión de cámara” pendiente, B “Preparar documentación” terminada, C “Revision de cámara” terminada, D “Plan de mañana” pendiente. Petición: “Quiero encontrar rápidamente lo que falta”. Paso 1: subraya términos ambiguos: encontrar, rápidamente, falta. Paso 2: pregunta por campo, coincidencia, estado y orden. Paso 3: escribe un ejemplo que distinguiría dos respuestas: REVISION sobre A/C prueba la regla de acentos; consulta cámara + pendientes prueba la combinación.

Resultado razonado: búsqueda por subcadena de título y filtro de estado combinados con AND; vacío muestra todos los del estado seleccionado y conserva orden original. “Rápidamente” queda fuera de una promesa de milisegundos sin dispositivo/medición; la feature se acota a los cuatro datos DEMO. Error frecuente: convertir “falta” directamente en un filtro permanente de pendientes sin preguntar. Comprobación: otra persona puede predecir IDs visibles con cada entrada sin leer código.

## 2. Encargo acotado y modo manual equivalente

Entrada: S1–S5 cerrados en la spec. Prepara este encargo como texto de práctica: “Implementa selectEntries y searchKey en lib/catalog.dart, más test/search_test.dart para S1–S5. No cambies UI, dependencias ni configuración. Conserva ñ distinta de n. Ejecuta las pruebas si tienes terminal; si no, identifica los comandos como pendientes. Entrega diff y dudas”. Revisa permisos antes de usar cualquier agente.

Antes de aceptar el resultado, compara el diff con D03/D04 y ejecuta tú el test S3. Si hay herramienta autorizada, ejecuta solo ese incremento y conserva salida saneada. Si no la hay, implementa manualmente las mismas reglas y anota MANUAL. El resultado esperado es una función pura que devuelve una nueva lista y no muta la entrada. No hay un número mínimo de prompts. Comprobación: el diff solo contiene los archivos previstos y las aserciones cubren ambos estados de S3. Error frecuente: aceptar una actualización de pubspec porque el agente la propone aunque el SDK baste.

## 3. Una revisión descubre una desviación con tests verdes

Entrada didáctica de diff: `return titleMatches || stateMatches;`. Un test existente solo usa consulta vacía y estado todas; pasa con OR y con AND. Predice consulta cámara + pendientes: con OR también aparecerían C por texto y D por estado. Eso contradice S3, que espera solo A. El ensayo ejecutable de T1 aplica este mismo problema a Avisos DEMO; no tienes que fabricar además otro defecto en Consulta DEMO. En tu producto escribe el caso discriminante de S3 y corrige únicamente desviaciones que existan.

Registro de revisión modelo: “En selectEntries, la unión permite elementos que no cumplen ambas condiciones; afecta S3. Añadir consulta cámara/pendientes, esperar A; corregir combinación”. No afirmes que has encontrado ese bug en tu proyecto si no existía: el ejemplo es sintético. Comprobación: explica por qué el test anterior estaba verde y qué nuevo caso cambia la confianza.

## 4. Limpiar texto tiene una decisión propia

Entrada: consulta cámara con filtro pendientes deja A visible. Una propuesta limpia texto y además vuelve a estado todas. D02 dice que se conserva estado. Reproduce primero el comportamiento esperado: tras limpiar deben verse A y D, contador 2 de 4. Inspecciona el callback del botón y comprueba que solo borra el controlador de texto. Ejecuta la prueba widget correspondiente en tu implementación.

Documenta S7 → decisión “limpiar conserva estado” → tarea UI → prueba de interacción. Error frecuente: juzgar la propuesta como “más cómoda” y cambiar la regla sin consulta. Si se quisiera otro comportamiento, habría que versionar D02/D01 y actualizar pruebas; no es una corrección silenciosa.

## 5. Escribir una PR que se pueda revisar

Entrada: implementación y pruebas disponibles. Redacta cinco párrafos breves: necesidad, comportamiento acordado, archivos/cambios, comandos realmente ejecutados con corte, pendientes/límites. Ejemplo de verificación prudente: “flutter analyze y flutter test ejecutados en el corte local indicado en D05; publicación y pruebas de emulador pendientes”. Sustituye esa frase por tus resultados reales, no por un texto decorativo.

Añade enlace relativo al dossier y señala la decisión de ñ como límite conocido. Pide revisión del comportamiento y de la coherencia documental. Comprobación: el revisor puede saber si está ante una PR propuesta, revisada o fusionada; no confunde un APK con instalación física. Error frecuente: marcar una checklist completa solo porque el agente terminó su respuesta.

## Del ejemplo Avisos DEMO a tu incremento

En el ZIP del ejemplo, `lib/notices.dart:selectNotices` combina prioridad mínima y ocultar leídos. `lib/main.dart` conserva esas dos decisiones en estado local y deriva la lista en cada reconstrucción. No almacena una segunda lista que pueda quedar desactualizada. `test/notices_test.dart` distingue AND de OR y comprueba que restablecer prioridad conserva ocultar leídos.

1. Predice prioridad 3 y ocultar leídos: solo AV-A.
2. Ejecuta `flutter test test/notices_test.dart`; compara con esa predicción.
3. Durante T1 sigue el libro [Trabajo con agente](14_TRABAJO_CON_AGENTE_PM7.md): el script prepara una copia con OR y un test débil. No hagas además una mutación manual del ejemplo original.
4. En ese único ensayo añade el test independiente, observa el rojo y corrige a AND; anota una fila breve de lo observado. No entregues este ejemplo como tu producto.
5. Transfiere el procedimiento a S3 de Consulta DEMO: define primero la entrada y los IDs esperados; no copies la política de prioridad para resolver búsquedas.

El ejemplo no crea una entrega nueva ni reemplaza tu intento. La aserción roja verifica la regla; un error de compilación requiere corregir el montaje antes de interpretar el comportamiento.
