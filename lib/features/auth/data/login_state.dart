import 'package:firebase_auth/firebase_auth.dart';
import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State management for login
class LoginState extends IState<LoginState> {
  /// Const constructor for login state
  const LoginState({
    this.email = '',
    this.password = '',
    this.user,
    this.error,
    this.selectedBranch = '',
    super.isLoading = false,
  });

  /// User credential after successful login
  final UserCredential? user;

  /// User email
  final String email;

  /// user password
  final String password;

  /// user branch
  final String selectedBranch;

  /// stores potential error
  final String? error;

  @override
  LoginState reset() => const LoginState();

  @override
  LoginState copyWith({
    String? email,
    String? password,
    UserCredential? user,
    String? error,
    String? selectedBranch,
    bool? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      selectedBranch: selectedBranch ?? this.selectedBranch,
      error: error,
      user: user,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [
    user,
    email,
    password,
    error,
    selectedBranch,
  ];

  /// Checks if the user is authenticated
  bool get isAuthenticated => user != null && user!.user != null;
}
