import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State for the Dashboard feature.
class DashboardState extends IState<DashboardState> {
  /// Const constructor for Dashboard state
  const DashboardState({super.isLoading = false});

  @override
  DashboardState copyWith({bool? isLoading}) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [];

  @override
  DashboardState reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }
}
