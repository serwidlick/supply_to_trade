import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Base class for all states with built-in loading support.
abstract class IState<IStateType> extends Equatable {
  /// Constant constructor for IState
  const IState({this.isLoading = false});

  /// Loading variable for all IState Instances
  final bool isLoading;

  /// Additional properties for the state, can be overridden in subclasses
  /// to provide more context or data.
  /// This is an empty list by default, but can be extended.
  List<dynamic> get additionalProps;

  /// Return a copy of the state with `isLoading` modified
  IStateType copyWith({bool? isLoading});

  /// Reset to the initial state
  IStateType reset();

  @override
  @nonVirtual
  List<Object?> get props => [isLoading, ...additionalProps];
}
