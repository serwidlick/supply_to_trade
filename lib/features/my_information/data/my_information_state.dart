import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State for the MyInformation feature.
class MyInformationState extends IState<MyInformationState> {
  /// Const constructor for MyInformation state
  const MyInformationState({super.isLoading = false});

  @override
  MyInformationState copyWith({bool? isLoading}) {
    return MyInformationState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [];

  @override
  MyInformationState reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }
}
