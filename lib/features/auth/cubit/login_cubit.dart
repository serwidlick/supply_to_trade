import 'package:firebase_auth/firebase_auth.dart';
import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/auth/data/login_state.dart'
    show LoginState;

/// Cubit for managing login state
class LoginCubit extends ICubit<LoginState> {
  /// Creates a new instance of [LoginCubit].
  LoginCubit() : super(const LoginState());

  /// Updates the identifier (email or username) in the state.
  void updateEmail(String identifier) {
    safeEmit((s) => s.copyWith(email: identifier));
  }

  /// Updates the password in the state.
  void updatePassword(String password) {
    safeEmit((s) => s.copyWith(password: password));
  }

  /// Attempts to log in the user with the provided email and password.
  void login() {
    runAsync(() async {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      if (user.user == null) {
        safeEmit((s) => s.copyWith(error: 'Login failed. Please try again.'));
      } else {
        safeEmit((s) => s.copyWith(user: user));
      }
    });
  }
}
