import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/orders/data/orders_state.dart'
    show OrdersState;

/// Cubit for the Orders feature.
class OrdersCubit extends ICubit<OrdersState> {
  /// Const constructor for Orders cubit
  OrdersCubit() : super(const OrdersState());
}
