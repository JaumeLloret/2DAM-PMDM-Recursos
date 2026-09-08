import 'package:flutter/material.dart';

import 'mobile_profile.dart';
import 'profile_screen.dart';

void main() {
  runApp(const ProfileLabApp());
}

class ProfileLabApp extends StatelessWidget {
  const ProfileLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    const profile = MobileProfile(
      name: 'Perfil de laboratorio',
      minimumApi: 24,
      memoryGb: 4,
      meteredNetwork: false,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Profile Lab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const ProfileScreen(profile: profile),
    );
  }
}


