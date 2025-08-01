import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:supply_to_trade/features/auth/cubit/login_cubit.dart';
import 'package:supply_to_trade/features/auth/data/login_state.dart';
import 'package:supply_to_trade/features/auth/presentation/animated_background.dart';
import 'package:supply_to_trade/features/auth/presentation/login_card.dart';

/// LoginPage class used for the login screen
class LoginPage extends StatefulWidget {
  /// Creates an instance of [LoginPage].
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  String? _selectedBranch;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            context.go('/dashboard');
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();

          return Scaffold(
            backgroundColor: colours.surface,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                const AnimatedBackground(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () => context.go('/dashboard'),
                          child: Text(
                            'Bypass Login',
                            style: TextStyle(
                              color: colours.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(flex: 2),
                        _buildHeader(colours),
                        const Spacer(flex: 2),
                        LoginCard(
                          email: state.email,
                          password: state.password,
                          selectedBranch: _selectedBranch,
                          showPassword: _showPassword,
                          isLoading: state.isLoading,
                          error: state.error,
                          onEmailChanged: cubit.updateEmail,
                          onPasswordChanged: cubit.updatePassword,
                          onBranchChanged: cubit.updateBranch,
                          onTogglePassword:
                              () => setState(
                                () => _showPassword = !_showPassword,
                              ),
                          onLoginPressed: cubit.login,
                          onForgotPasswordPressed: () {
                            // TODO(serwidlick): Navigate to reset password
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(ColorScheme colours) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colours.primary,
                colours.primary.withValues(alpha: 0.8),
                colours.secondary.withValues(alpha: 0.6),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: colours.primary.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/logo.svg',
              width: 40,
              height: 40,
              semanticsLabel: 'Logo',
              colorFilter: ColorFilter.mode(colours.onPrimary, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: colours.onSurface,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in to your professional trading account',
          style: TextStyle(
            fontSize: 14,
            color: colours.onSurface.withValues(alpha: 0.7),
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
