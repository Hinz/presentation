import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const StudentMarketplaceApp());
}

class StudentMarketplaceApp extends StatelessWidget {
  const StudentMarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color seed = Colors.indigo;
    return MaterialApp(
      title: 'Student Marketplace',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          isDense: true,
        ),
        chipTheme: ChipThemeData(
          side: BorderSide.none,
          selectedColor: seed.withOpacity(0.12),
        ),
      ),
      home: const HomePage(),
    );
  }
}
