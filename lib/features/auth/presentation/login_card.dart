import 'package:flutter/material.dart';
import 'package:supply_to_trade/features/auth/presentation/forgot_password_button.dart';
import 'package:supply_to_trade/features/auth/presentation/login_button.dart';
import 'package:supply_to_trade/features/auth/presentation/login_dropdown.dart';
import 'package:supply_to_trade/features/auth/presentation/login_text_field.dart';

/// LoginCard class used for the login page
class LoginCard extends StatelessWidget {
  /// Creates an instance of [LoginCard].
  const LoginCard({
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
    super.key,
  });

  /// Email address entered by the user.
  final String? email;

  /// Password entered by the user.
  final String? password;

  /// Selected branch from the dropdown.
  final String? selectedBranch;

  /// Whether the password field should show the password or not.
  final bool showPassword;

  /// Whether the login button is in loading state.
  final bool isLoading;

  /// Error message to display, if any.
  final String? error;

  /// Callback function to handle email changes.
  final void Function(String) onEmailChanged;

  /// Callback function to handle password changes.
  final void Function(String) onPasswordChanged;

  /// Callback function to handle branch selection changes.
  final void Function(String?) onBranchChanged;

  /// Callback function to toggle password visibility.
  final VoidCallback onTogglePassword;

  /// Callback function to handle login button press.
  final VoidCallback onLoginPressed;

  /// Callback function to handle forgot password button press.
  final VoidCallback onForgotPasswordPressed;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: Material(
        color: colours.surfaceContainerHighest,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: colours.primary.withValues(alpha: 0.08)),
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
        color: colours.error.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colours.error.withValues(alpha: 0.2)),
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
