import 'package:equatable/equatable.dart';

/// Base class for all states with built-in loading support.
abstract class IState extends Equatable {
  /// Constant constructor for IState
  const IState({this.isLoading = false});

  /// Loading variable for all IState Instances
  final bool isLoading;

  /// Return a copy of the state with `isLoading` modified
  IState copyWith({bool? isLoading});

  /// Reset to the initial state
  IState reset();

  @override
  List<Object?> get props => [isLoading];
}
