import 'package:flutter/material.dart';

/// Main dashboard page with bottom navigation
/// Contains workout, progress, and profile tabs
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Dashboard Page\n(To be implemented)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
