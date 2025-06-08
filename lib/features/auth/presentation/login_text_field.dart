import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function(String) onChanged;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool? showPassword;
  final VoidCallback? onTogglePassword;

  const LoginTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.keyboardType,
    this.isPassword = false,
    this.showPassword,
    this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colours.surface.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colours.primary.withOpacity(0.12),
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
            color: colours.onSurface.withOpacity(0.7),
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
