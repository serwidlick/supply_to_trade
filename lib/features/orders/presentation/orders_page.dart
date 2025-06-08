import 'package:flutter/material.dart';

/// Page for the Orders feature.
class OrdersPage extends StatelessWidget {
  /// Const constructor for Orders page
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: const Center(
        child: Text('Orders Page'),
      ),
    );
  }
}
