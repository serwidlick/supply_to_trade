import 'package:hive/hive.dart';

/// Class to access Hive
class StorageService {
  /// Singleton instance
  factory StorageService() => _instance;
  StorageService._internal();
  static final StorageService _instance = StorageService._internal();

  static const _deviceBox = 'deviceBox';
  static const _lastUserKey = 'lastUserId';

  Future<void> init() async {
    await Hive.openBox(_deviceBox);

    final deviceBox = Hive.box(_deviceBox);
    final lastUserId = deviceBox.get(_lastUserKey) as String?;

    if (lastUserId != null) {
      final userBoxName = _userBoxName(lastUserId);
      if (!Hive.isBoxOpen(userBoxName)) {
        await Hive.openBox(userBoxName);
      }
    }
  }

  Future<void> openUserBox(String userId) async {
    final boxName = _userBoxName(userId);
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox(boxName);
    }

    // Remember the last user (optional)
    final deviceBox = Hive.box(_deviceBox);
    await deviceBox.put(_lastUserKey, userId);
  }

  String _userBoxName(String userId) => 'userBox_$userId';

  Box _getBox(String? userId) {
    final boxName = userId != null ? _userBoxName(userId) : _deviceBox;
    if (!Hive.isBoxOpen(boxName)) {
      throw HiveError(
        'Box "$boxName" is not open. Make sure to open it first.',
      );
    }
    return Hive.box(boxName);
  }

  Future<void> set(String key, dynamic value, {String? userId}) async {
    final box = _getBox(userId);
    await box.put(key, value);
  }

  T? get<T>(String key, {String? userId}) {
    final box = _getBox(userId);
    return box.get(key) as T?;
  }

  Future<void> remove(String key, {String? userId}) async {
    final box = _getBox(userId);
    await box.delete(key);
  }

  Future<void> clear({String? userId}) async {
    final box = _getBox(userId);
    await box.clear();
  }

  Future<void> clearLastUser() async {
    final deviceBox = Hive.box(_deviceBox);
    await deviceBox.delete(_lastUserKey);
  }

  String? getLastUserId() {
    final deviceBox = Hive.box(_deviceBox);
    return deviceBox.get(_lastUserKey) as String?;
  }
}
