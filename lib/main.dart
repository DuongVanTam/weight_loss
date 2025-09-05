import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'features/_demo/theme_preview_page.dart';

void main() {
  runApp(const WeightLossApp());
}

class WeightLossApp extends StatelessWidget {
  const WeightLossApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Loss App',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const ThemePreviewPage(), // Temporary for testing theme
      debugShowCheckedModeBanner: false,
    );
  }
}
