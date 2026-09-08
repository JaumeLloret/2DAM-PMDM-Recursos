import 'package:flutter/material.dart';

import 'mobile_profile.dart';

String buildDecisionText(MobileProfile profile) {
  return 'Pendiente de analizar';
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.profile, super.key});

  final MobileProfile profile;

  @override
  Widget build(BuildContext context) {
    final networkText = profile.meteredNetwork ? 'Medida' : 'No medida';

    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Profile Lab')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(profile.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          _InfoRow(label: 'API mínima', value: '${profile.minimumApi}'),
          _InfoRow(label: 'Memoria', value: '${profile.memoryGb} GB'),
          _InfoRow(label: 'Red', value: networkText),
          const SizedBox(height: 24),
          Semantics(
            label: 'Decisión para el perfil',
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  buildDecisionText(profile),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}


