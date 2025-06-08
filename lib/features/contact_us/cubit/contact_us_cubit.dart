import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/contact_us/data/contact_us_state.dart'
    show ContactUsState;

/// Cubit for the ContactUs feature.
class ContactUsCubit extends ICubit<ContactUsState> {
  /// Const constructor for ContactUs cubit
  ContactUsCubit() : super(const ContactUsState());
}
