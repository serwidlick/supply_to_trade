import 'package:supply_to_trade/core/base/i_cubit.dart';
import 'package:supply_to_trade/features/dashboard/data/dashboard_state.dart';
import 'package:supply_to_trade/shared/storage/storage_service.dart';

/// Cubit for the Dashboard feature.
class DashboardCubit extends ICubit<DashboardState> {
  /// Constructor with optional [StorageService] injection for testing/mocking.
  DashboardCubit({StorageService? storage})
    : _storage = storage ?? StorageService(),
      super(const DashboardState());
  final StorageService _storage;

  /// Initializes the cubit.
  Future<void> init() async {
    await runAsync(() async {
      await Future.delayed(Duration(seconds: 2));
      final user = _storage.getLastUserId();
      final hasDismissedWelcome =
          _storage.get<bool>("has_dismissed_welcome", userId: user) ?? false;

      safeEmit((s) => s.copyWith(hasDismissedWelcome: hasDismissedWelcome));
    });
  }

  /// Updates and persists the dismissed welcome state.
  void setDismissedWelcome(bool? value) {
    final user = _storage.getLastUserId();
    _storage.set("has_dismissed_welcome", value, userId: user);
    print("Setting hasDismissedWelcome to: $value for user: $user");

    safeEmit((s) => s.copyWith(hasDismissedWelcome: value));
  }
}
