import 'package:flutter/material.dart';

/// Page for the Quotes feature.
class QuotesPage extends StatelessWidget {
  /// Const constructor for Quotes page
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quotes')),
      body: const Center(
        child: Text('Quotes Page'),
      ),
    );
  }
}
