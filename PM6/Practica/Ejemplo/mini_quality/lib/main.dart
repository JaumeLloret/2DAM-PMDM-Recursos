import 'package:flutter/material.dart';

// Regla pura: no necesita Flutter, red ni un dispositivo para comprobarse.
int availableSeats(int capacity, int reserved) {
  if (capacity < 0 || reserved < 0 || reserved > capacity) {
    throw ArgumentError('La reserva debe estar entre cero y el aforo.');
  }
  return capacity - reserved;
}

void main() => runApp(const SeatApp());

class SeatApp extends StatefulWidget {
  const SeatApp({super.key});

  @override
  State<SeatApp> createState() => _SeatAppState();
}

class _SeatAppState extends State<SeatApp> {
  int reserved = 1;

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Reservas · ejemplo PM6')),
      body: Column(
        children: [
          Text('Libres: ${availableSeats(3, reserved)}'),
          FilledButton(
            onPressed: reserved < 3 ? () => setState(() => reserved++) : null,
            child: const Text('Reservar'),
          ),
        ],
      ),
    ),
  );
}
