import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:supply_to_trade/features/auth/cubit/login_cubit.dart';
import 'package:supply_to_trade/features/auth/data/login_state.dart';
import 'package:supply_to_trade/features/auth/presentation/animated_background.dart';
import 'package:supply_to_trade/features/auth/presentation/animated_login_content.dart';
import 'package:supply_to_trade/features/auth/presentation/login_card.dart';

class LoginPage extends StatefulWidget {
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
                  child: AnimatedLoginContent(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
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
                            onBranchChanged:
                                (value) =>
                                    setState(() => _selectedBranch = value),
                            onTogglePassword:
                                () => setState(
                                  () => _showPassword = !_showPassword,
                                ),
                            onLoginPressed: cubit.login,
                            onForgotPasswordPressed: () {
                              // TODO: Navigate to reset password
                            },
                          ),
                          const Spacer(flex: 1),
                          _buildFooter(colours),
                          const Spacer(flex: 1),
                        ],
                      ),
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
                colours.primary.withOpacity(0.8),
                colours.secondary.withOpacity(0.6),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: colours.primary.withOpacity(0.3),
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
            color: colours.onSurface.withOpacity(0.7),
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFooter(ColorScheme colours) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      colours.onSurface.withOpacity(0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Supply 2 Trade',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colours.primary,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      colours.onSurface.withOpacity(0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
