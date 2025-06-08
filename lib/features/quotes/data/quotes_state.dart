import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State for the Quotes feature.
class QuotesState extends IState<QuotesState> {
  /// Const constructor for Quotes state
  const QuotesState({super.isLoading = false});

  @override
  QuotesState copyWith({bool? isLoading}) {
    return QuotesState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [];

  @override
  QuotesState reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }
}
