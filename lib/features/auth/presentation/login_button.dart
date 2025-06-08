import 'package:flutter/material.dart';

/// LoginButton class used for the login page
class LoginButton extends StatelessWidget {
  /// Creates an instance of [LoginButton].
  const LoginButton({
    required this.isLoading,
    required this.onPressed,
    super.key,
  });

  /// Loading property for the button to indicate if the button is in loading
  /// state.
  final bool isLoading;

  /// Callback function to be called when the button is pressed.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return Container(
      height: 52,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colours.primary,
            colours.primary.withValues(alpha: 0.9),
            colours.secondary.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: colours.primary.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child:
            isLoading
                ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: colours.onPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: colours.onPrimary,
                      size: 18,
                    ),
                  ],
                ),
      ),
    );
  }
}
