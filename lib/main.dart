import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'health_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ).copyWith(
          background: const Color(0xFFF5F5F0), // Soft off-white
          surface: const Color(0xFFFAFAF8), // Slightly warmer white
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F0), // Soft off-white
      ),
      home: const LandingPage(),
      routes: {
        '/health': (context) => const HealthPage(),
      },
    );
  }
}
