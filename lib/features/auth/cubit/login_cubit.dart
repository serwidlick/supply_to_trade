import 'package:firebase_auth/firebase_auth.dart';
import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/auth/data/login_state.dart'
    show LoginState;
import 'package:supply_to_trade/shared/storage/storage_service.dart';

/// Cubit for managing login state
class LoginCubit extends ICubit<LoginState> {
  /// Creates a new instance of [LoginCubit].
  LoginCubit() : super(const LoginState()) {
    final storage = StorageService();

    final userId = storage.getLastUserId();
    if (userId != null) {
      safeEmit((s) => s.copyWith(email: userId));
      safeEmit(
        (s) =>
            s.copyWith(password: storage.get("password", userId: userId) ?? ''),
      );
      login();
    }
  }

  /// Updates the identifier (email or username) in the state.
  void updateEmail(String identifier) {
    safeEmit((s) => s.copyWith(email: identifier));
  }

  /// Updates the password in the state.
  void updatePassword(String password) {
    safeEmit((s) => s.copyWith(password: password));
  }

  /// Updates the selected branch in the state.
  /// This is used to set the branch for the user.
  void updateBranch(String branch) {
    safeEmit((s) => s.copyWith(selectedBranch: branch));
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
        final storage = StorageService();

        await storage.openUserBox(state.email);

        await storage.set("email", state.email, userId: state.email);
        await storage.set("password", state.password, userId: state.email);
        await storage.set("branch", state.selectedBranch, userId: state.email);

        safeEmit((s) => s.copyWith(user: user));
      }
    });
  }
}
