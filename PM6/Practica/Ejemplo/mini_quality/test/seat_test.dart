import 'package:flutter_test/flutter_test.dart';
import 'package:mini_quality/main.dart';

void main() {
  test('tres plazas y una reserva dejan dos libres', () {
    const capacity = 3; // Arrange: datos conocidos.
    const reserved = 1;
    final result = availableSeats(capacity, reserved); // Act: regla.
    expect(result, 2); // Assert: conducta que queremos conservar.
  });

  test('el aforo completo no deja plazas negativas', () {
    expect(availableSeats(3, 3), 0);
    expect(() => availableSeats(3, 4), throwsArgumentError);
  });

  testWidgets('reservar cambia la salida visible y respeta el límite', (
    tester,
  ) async {
    await tester.pumpWidget(const SeatApp());
    expect(find.text('Libres: 2'), findsOneWidget);
    await tester.tap(find.text('Reservar'));
    await tester.pump();
    expect(find.text('Libres: 1'), findsOneWidget);
    await tester.tap(find.text('Reservar'));
    await tester.pump();
    expect(find.text('Libres: 0'), findsOneWidget);
    await tester.tap(find.text('Reservar'));
    await tester.pump();
    expect(find.text('Libres: 0'), findsOneWidget);
  });
}
