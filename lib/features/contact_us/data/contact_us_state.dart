import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State for the ContactUs feature.
class ContactUsState extends IState<ContactUsState> {
  /// Const constructor for ContactUs state
  const ContactUsState({super.isLoading = false});

  @override
  ContactUsState copyWith({bool? isLoading}) {
    return ContactUsState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [];

  @override
  ContactUsState reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }
}
