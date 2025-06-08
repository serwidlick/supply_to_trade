import 'package:flutter/material.dart';

/// ForgotPasswordButton class used for the login page
class ForgotPasswordButton extends StatelessWidget {
  /// Creates an instance of [ForgotPasswordButton].
  const ForgotPasswordButton({required this.onPressed, super.key});

  /// Callback function to be called when the button is pressed.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        'Forgot your password?',
        style: TextStyle(
          color: colours.secondary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
