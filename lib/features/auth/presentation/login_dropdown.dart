import 'package:flutter/material.dart';

class LoginDropdown extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? selectedValue;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const LoginDropdown({
    super.key,
    required this.label,
    required this.icon,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        dropdownColor: colours.surface,
        icon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(Icons.arrow_drop_down_rounded, color: colours.secondary),
        ),
        borderRadius: BorderRadius.circular(20),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 20, right: 16),
            child: Icon(icon, color: colours.primary, size: 22),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelStyle: TextStyle(
            color: colours.onSurface.withOpacity(0.7),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
        ),
        style: TextStyle(
          color: colours.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        items:
            options
                .map(
                  (branch) =>
                      DropdownMenuItem(value: branch, child: Text(branch)),
                )
                .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
