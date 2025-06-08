import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State for the Orders feature.
class OrdersState extends IState<OrdersState> {
  /// Const constructor for Orders state
  const OrdersState({super.isLoading = false});

  @override
  OrdersState copyWith({bool? isLoading}) {
    return OrdersState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [];

  @override
  OrdersState reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }
}
