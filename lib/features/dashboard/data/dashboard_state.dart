import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State for the Dashboard feature.
class DashboardState extends IState<DashboardState> {
  /// Const constructor for Dashboard state
  const DashboardState({
    this.hasDismissedWelcome = false,
    super.isLoading = false,
  });

  /// Indicates whether the welcome section has been dismissed.
  final bool hasDismissedWelcome;

  @override
  DashboardState copyWith({bool? hasDismissedWelcome, bool? isLoading}) {
    return DashboardState(
      hasDismissedWelcome: hasDismissedWelcome ?? this.hasDismissedWelcome,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [hasDismissedWelcome];

  @override
  DashboardState reset() {
    return const DashboardState();
  }
}
