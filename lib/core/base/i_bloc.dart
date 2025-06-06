import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// Base class for all custom BLoCs with safe helpers.
abstract class IBloc<E, S extends IState> extends Bloc<E, S> {
  /// Constructor for IBloc
  IBloc(super.initialState);

  /// Adds a new event safely if the Bloc is still active.
  void safeAdd(E event) {
    if (!isClosed) add(event);
  }

  /// Emits/logs an error message.
  void emitError(String message) {
    if (kDebugMode) {
      print('Bloc error: $message');
    }
  }
}
