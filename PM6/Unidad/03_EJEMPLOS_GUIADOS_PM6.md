# Ejemplos guiados · PM6

## Antes de E1 · Preparar una prueba que puedas ejecutar

En tu copia de `quality_gate`, crea `test/guided_example_test.dart` con el bloque siguiente. `ControlledStore` es un doble local: cada llamada a `fetch` guarda un `Completer` cuyo resultado decides desde la prueba. No necesita red ni un paquete nuevo. Este ejemplo enseña a construir pruebas; no incluye las correcciones del controlador ni la suite docente completa.

<!-- PM6_GUIDED_TEST_BEGIN -->
```dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quality_gate/main.dart';
import 'package:quality_gate/quality.dart';

class ControlledStore implements TaskStore {
  final requests = <Completer<List<TaskItem>>>[];

  @override
  Future<List<TaskItem>> fetch() {
    final request = Completer<List<TaskItem>>();
    requests.add(request);
    return request.future;
  }
}

void main() {
  test('guided: count two open tasks', () async {
    final store = ControlledStore();
    final controller = QualityController(store);
    addTearDown(controller.dispose);

    final loading = controller.load();
    store.requests.single.complete([
      const TaskItem('A', 'Abierta A'),
      const TaskItem('B', 'Terminada B', done: true),
      const TaskItem('C', 'Abierta C'),
    ]);
    await loading;

    expect(controller.pendingCount, 2);
  });

  testWidgets('guided: a tap completes the selected task', (tester) async {
    final store = ControlledStore();
    await tester.pumpWidget(QualityApp(store: store));
    store.requests.single.complete([
      const TaskItem('A', 'Abierta A'),
    ]);
    await tester.pump();

    await tester.tap(find.byKey(const ValueKey('A')));
    await tester.pump();
    expect(find.text('Pendientes: 0'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });
}
```
<!-- PM6_GUIDED_TEST_END -->

Ejecuta desde la raíz de esa copia:

```bash
flutter test test/guided_example_test.dart --reporter expanded
```

En el starter original deben fallar las dos aserciones: la primera obtiene 1 en lugar de 2; la segunda no encuentra `Pendientes: 0` después de completar A. Esa predicción no es tu registro de ejecución: guarda lo que observes. Si el error dice que falta un import, no se encuentra `ControlledStore` o no existe el paquete, revisa la ruta y `flutter pub get` antes de investigar la lógica.

Lee el primer caso como preparación → acción → comprobación. `load()` comienza la solicitud, `complete` le entrega datos y `await loading` espera su procesamiento; no uses `await controller.load()` antes de completar el Future, porque lo dejarías esperando. En la prueba widget, `pumpWidget` monta la app, `tap` ejecuta la interacción y `pump` deja reconstruir la pantalla. Desmontarla al final permite liberar el controlador que crea `QualityApp`.

Después de corregir el contador, ambas deben pasar. Ahora escribe tú los casos de vacío/todos terminados y reutiliza `ControlledStore` para E2–E4. Consulta primaria de apoyo: [dobles de dependencias](https://docs.flutter.dev/cookbook/testing/unit/mocking) y [pruebas de interacción con widgets](https://docs.flutter.dev/cookbook/testing/widget/tap-drag).

## E1 · Un contador y una aserción discriminante

Entrada: A abierto, B completado, C abierto. Predicción:2pendientes. Lee pendingCount y señala qué predicado selecciona. Escribe una prueba que cargue esa lista mediante TaskStore controlado y compare el resultado con2. Primero observa el fallo esperado1frente a2; después corrige el predicado y añade caso vacío. Una prueba que espere1solo para ponerse verde consolida el defecto.

## E2 · Ordenar Futures sin red

ControlledStore crea un Completer por fetch. Inicia `first=c.load()` y `second=c.load()`. Completa requests[1] con NEW y espera second; completa requests[0] con OLD y espera first. Resultado esperado: NEW. El arreglo consiste en comprobar si la respuesta sigue vigente antes de publicar. Una espera fija de 500 ms no garantiza el orden en todas las máquinas.

## E3 · El error también termina la carga

Completa la primera solicitud con error. Después de esperar load, error debe ser visible y loading false. Inicia reintento, completa con lista vacía y comprueba error nulo, loading false y vista vacía con acción. No ocultes la excepción sin cambiar estado; no dejes un spinner eterno. En widget test usa pump controlado para poder observar el defecto.

## E4 · Retención y medición son evidencias diferentes

Carga25snapshots y observa history.length. La política de producto de este laboratorio conserva20, por lo que el primer ID retenido debe ser5si las entradas empiezan en 0. Este test comprueba referencias lógicas. En DevTools repite el recorrido y observa objetos/heap; el resultado esperado es poder explicar la retención, no una cifra de memoria preescrita. Registra cualquier discrepancia y cómo la investigarías.

## E5 · Un verde de un SHA distinto

Tu pipeline validó códigoA, pero entregasBtras cambiar retry. Escribe en Q05 que el run deAes histórico, ejecuta los controles del nuevo corte y vincula B. Si solo cambió documentación, explica qué controles correspondían; antes del cierre final no uses un resultado de otro SHA como certificación deB.
