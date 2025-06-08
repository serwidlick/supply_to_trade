import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/quotes/data/quotes_state.dart'
    show QuotesState;

/// Cubit for the Quotes feature.
class QuotesCubit extends ICubit<QuotesState> {
  /// Const constructor for Quotes cubit
  QuotesCubit() : super(const QuotesState());
}
