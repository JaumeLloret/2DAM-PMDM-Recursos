import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quality_gate/main.dart';
import 'package:quality_gate/quality.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('DEMO flow loads, retries and toggles on target OS', (
    tester,
  ) async {
    await tester.pumpWidget(
      QualityApp(store: DemoStore(failFirst: true, count: 3)),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reintentar'));
    await tester.pumpAndSettle();
    expect(find.text('Pendientes: 2'), findsOneWidget);
    await tester.tap(find.text('Trabajo de muestra 1'));
    await tester.pumpAndSettle();
    expect(find.text('Pendientes: 1'), findsOneWidget);
  });
}
