import 'package:flutter/material.dart';

/// Page for the MyInformation feature.
class MyInformationPage extends StatelessWidget {
  /// Const constructor for MyInformation page
  const MyInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Information')),
      body: const Center(child: Text('My Information Page')),
    );
  }
}
