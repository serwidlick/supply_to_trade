import 'package:flutter/material.dart';

/// Page for the ContactUs feature.
class ContactUsPage extends StatelessWidget {
  /// Const constructor for ContactUs page
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: const Center(child: Text('Contact Us Page')),
    );
  }
}
