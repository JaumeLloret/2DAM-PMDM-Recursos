import 'package:flutter/foundation.dart';

class TaskItem {
  const TaskItem(this.id, this.title, {this.done = false});
  final String id;
  final String title;
  final bool done;
  TaskItem copyWith({bool? done}) =>
      TaskItem(id, title, done: done ?? this.done);
}

abstract interface class TaskStore {
  Future<List<TaskItem>> fetch();
}

class DemoStore implements TaskStore {
  DemoStore({this.failFirst = false, this.count = 30});
  final bool failFirst;
  final int count;
  int calls = 0;
  @override
  Future<List<TaskItem>> fetch() async {
    final requestNumber = ++calls;
    await Future<void>.delayed(const Duration(milliseconds: 250));
    if (failFirst && requestNumber == 1) {
      throw StateError('Fallo de demostración');
    }
    return List.generate(
      count,
      (i) => TaskItem('DEMO-$i', 'Trabajo de muestra $i', done: i % 3 == 0),
    );
  }
}

class QualityController extends ChangeNotifier {
  QualityController(this.store);
  final TaskStore store;
  List<TaskItem> items = const [];
  bool loading = false;
  String? error;
  bool _disposed = false;
  int _generation = 0;
  final List<List<TaskItem>> history = [];
  int get pendingCount => items.where((item) => item.done).length;
  void _notify() {
    if (!_disposed) notifyListeners();
  }

  Future<void> load() async {
    final generation = ++_generation;
    loading = true;
    error = null;
    _notify();
    try {
      final result = await store.fetch();
      if (_disposed) return;
      items = List.unmodifiable(result);
      history.add(items);
      // TODO: define a bounded retention policy after observing the workload.
    } catch (_) {
      if (_disposed) return;
      error = 'No se pudo cargar. Puedes reintentar.';
    } finally {
      if (!_disposed && generation == _generation) {
        loading = error != null;
        _notify();
      }
    }
  }

  void toggle(String id) {
    items = List.unmodifiable(
      items.map(
        (item) => item.id == id ? item.copyWith(done: !item.done) : item,
      ),
    );
    _notify();
  }

  @override
  void dispose() {
    _disposed = true;
    _generation++;
    history.clear();
    super.dispose();
  }
}
