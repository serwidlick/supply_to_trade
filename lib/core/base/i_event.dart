import 'package:equatable/equatable.dart';

/// Base interface for BLoC events.
abstract class IEvent extends Equatable {
  /// Constant constructor for IEvent
  const IEvent();

  /// Optional event label, useful for logging/analytics
  String get label => runtimeType.toString();

  @override
  List<Object?> get props => [];
}
