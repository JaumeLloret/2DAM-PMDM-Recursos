import 'package:flutter/material.dart';

void main() => runApp(const DistanceApp());

class DistanceApp extends StatelessWidget {
  const DistanceApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: DistancePage());
}

class DistancePage extends StatefulWidget {
  const DistancePage({super.key});
  @override
  State<DistancePage> createState() => _DistancePageState();
}

class _DistancePageState extends State<DistancePage> {
  String input = '';
  String result = 'Introduce kilómetros / Introduïx quilòmetres';

  void convert() {
    final value = double.tryParse(input);
    setState(() {
      result = value == null
          ? 'Entrada no numérica / Entrada no numèrica'
          : '${value * 1000} m';
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Distancias DEMO / Distàncies DEMO')),
        body: SafeArea(
          child: ListView(padding: const EdgeInsets.all(16), children: [
            TextField(
              key: const Key('distance'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: const InputDecoration(labelText: 'km'),
              onChanged: (value) => input = value,
            ),
            ElevatedButton(onPressed: convert, child: const Text('Convertir')),
            Text(result, key: const Key('result')),
          ]),
        ),
      );
}
