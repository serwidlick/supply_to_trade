import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/splash/data/splash_state.dart'
    show SplashState;

/// Cubit for the Splash feature.
class SplashCubit extends ICubit<SplashState> {
  /// Const constructor for Splash cubit
  SplashCubit() : super(const SplashState());
}
