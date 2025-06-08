import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/my_information/data/my_information_state.dart'
    show MyInformationState;

/// Cubit for the MyInformation feature.
class MyInformationCubit extends ICubit<MyInformationState> {
  /// Const constructor for MyInformation cubit
  MyInformationCubit() : super(const MyInformationState());
}
