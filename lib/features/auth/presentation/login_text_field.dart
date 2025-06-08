import 'package:flutter/material.dart';

/// LoginTextField class used for the login page
class LoginTextField extends StatelessWidget {
  /// Creates an instance of [LoginTextField].
  const LoginTextField({
    required this.label,
    required this.icon,
    required this.onChanged,
    this.keyboardType,
    this.isPassword = false,
    this.showPassword,
    this.onTogglePassword,
    super.key,
  });

  /// Label for the text field.
  final String label;

  /// Icon for the text field.
  final IconData icon;

  /// Callback function to be called when the text changes.
  final void Function(String) onChanged;

  /// Keyboard type for the text field.
  final TextInputType? keyboardType;

  /// Whether the text field is for password input.
  final bool isPassword;

  /// Whether to show the password in the text field.
  final bool? showPassword;

  /// Callback function to toggle password visibility.
  final VoidCallback? onTogglePassword;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colours.surface.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colours.primary.withValues(alpha: 0.12),
          width: 1.5,
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: isPassword && !(showPassword ?? false),
        style: TextStyle(
          color: colours.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: colours.onSurface.withValues(alpha: 0.7),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 20, right: 16),
            child: Icon(icon, color: colours.primary, size: 22),
          ),
          suffixIcon:
              isPassword
                  ? IconButton(
                    onPressed: onTogglePassword,
                    icon: Icon(
                      (showPassword ?? false)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: colours.secondary,
                      size: 22,
                    ),
                    splashRadius: 20,
                  )
                  : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
