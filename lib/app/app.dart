import 'package:flutter/material.dart';
import 'package:travel_cost_log/features/auth/pages/auth_gate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Travel Cost Log',
        theme: ThemeData.dark(useMaterial3: true),
        home: const AuthGate(),
      );
}
