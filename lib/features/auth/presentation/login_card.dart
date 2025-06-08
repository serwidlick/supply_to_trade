import 'package:flutter/material.dart';

import 'forgot_password_button.dart';
import 'login_button.dart';
import 'login_dropdown.dart';
import 'login_text_field.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.email,
    required this.password,
    required this.selectedBranch,
    required this.showPassword,
    required this.isLoading,
    required this.error,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onBranchChanged,
    required this.onTogglePassword,
    required this.onLoginPressed,
    required this.onForgotPasswordPressed,
  });

  final String? email;
  final String? password;
  final String? selectedBranch;
  final bool showPassword;
  final bool isLoading;
  final String? error;

  final void Function(String) onEmailChanged;
  final void Function(String) onPasswordChanged;
  final void Function(String?) onBranchChanged;
  final VoidCallback onTogglePassword;
  final VoidCallback onLoginPressed;
  final VoidCallback onForgotPasswordPressed;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: Material(
        color: colours.surfaceVariant,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: colours.primary.withOpacity(0.08), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginTextField(
                label: 'Email Address',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                onChanged: onEmailChanged,
              ),
              const SizedBox(height: 20),
              LoginTextField(
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
                showPassword: showPassword,
                onTogglePassword: onTogglePassword,
                onChanged: onPasswordChanged,
              ),
              const SizedBox(height: 20),
              LoginDropdown(
                label: 'Select Branch',
                icon: Icons.location_on_outlined,
                selectedValue: selectedBranch,
                options: const [
                  'Bury',
                  'Chester',
                  'Northwich',
                  'Stoke',
                  'Telford',
                ],
                onChanged: onBranchChanged,
              ),
              if (error != null) ...[
                const SizedBox(height: 20),
                _buildErrorMessage(error!, colours),
              ],
              const SizedBox(height: 28),
              LoginButton(isLoading: isLoading, onPressed: onLoginPressed),
              const SizedBox(height: 20),
              ForgotPasswordButton(onPressed: onForgotPasswordPressed),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String error, ColorScheme colours) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colours.error.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colours.error.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colours.error, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              error,
              style: TextStyle(
                color: colours.error,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
