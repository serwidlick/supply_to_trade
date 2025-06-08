import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/dashboard/data/dashboard_state.dart'
    show DashboardState;

/// Cubit for the Dashboard feature.
class DashboardCubit extends ICubit<DashboardState> {
  /// Const constructor for Dashboard cubit
  DashboardCubit() : super(const DashboardState());
}
