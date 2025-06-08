import 'package:flutter/material.dart';

/// Page for the Dashboard feature.
class DashboardPage extends StatelessWidget {
  /// Const constructor for Dashboard page
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(
        child: Text('Dashboard Page'),
      ),
    );
  }
}
