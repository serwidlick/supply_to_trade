import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State for the Splash feature.
class SplashState extends IState<SplashState> {
  /// Const constructor for Splash state
  const SplashState({super.isLoading = false});

  @override
  SplashState copyWith({bool? isLoading}) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [];

  @override
  SplashState reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }
}
