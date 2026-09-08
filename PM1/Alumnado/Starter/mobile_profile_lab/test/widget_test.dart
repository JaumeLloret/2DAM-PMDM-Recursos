import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_profile_lab/main.dart';

void main() {
  testWidgets('shows the starter profile and pending decision', (tester) async {
    await tester.pumpWidget(const ProfileLabApp());

    expect(find.text('Perfil de laboratorio'), findsOneWidget);
    expect(find.text('API mínima'), findsOneWidget);
    expect(find.text('4 GB'), findsOneWidget);
    expect(find.text('Pendiente de analizar'), findsOneWidget);
  });
}


