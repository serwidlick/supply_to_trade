import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// Interface for Cubit
abstract class ICubit<T extends IState> extends Cubit<T> {
  /// Constructor for ICubit
  /// Pass in initial IState class to create
  ICubit(super.initialState);

  /// widget tree safe emit function
  /// allows developer to emit without affecting widget tree
  void safeEmit(T Function(T current) transform) {
    if (!isClosed) emit(transform(state));
  }

  /// Resets the cubit to initial state
  void reset() => emit(state.reset() as T);

  /// Takes String, logs error to console
  void emitError(String message) {
    // Extend with logger/Sentry/etc.
    // TODO(serwidlick): replace with logger package
    if (kDebugMode) {
      print('Cubit error: $message');
    }
  }

  /// Runs an asynchronous action with loading state management
  Future<void> runAsync(Future<void> Function() action) async {
    if (state.isLoading) return;

    try {
      safeEmit((s) => s.copyWith(isLoading: true) as T);
      await action();
    } on Exception catch (e) {
      emitError(e.toString());
    } finally {
      safeEmit((s) => s.copyWith(isLoading: false) as T);
    }
  }
}
