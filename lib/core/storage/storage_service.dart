import '../constants/storage_keys.dart';
import 'local_storage.dart';
import 'secure_storage.dart';

class StorageService {
  StorageService({required this._secureStorage, required this._localStorage});

  final SecureStorage _secureStorage;
  final LocalStorage _localStorage;

  // ==============================
  // Authentication
  // ==============================

  Future<void> saveAccessToken(String token) async {
    await _secureStorage.write(key: StorageKeys.accessToken, value: token);
  }

  Future<String?> getAccessToken() async {
    return _secureStorage.read(key: StorageKeys.accessToken);
  }

  Future<void> saveRefreshToken(String token) async {
    await _secureStorage.write(key: StorageKeys.refreshToken, value: token);
  }

  Future<String?> getRefreshToken() async {
    return _secureStorage.read(key: StorageKeys.refreshToken);
  }

  Future<void> clearAuthentication() async {
    await _secureStorage.delete(key: StorageKeys.accessToken);

    await _secureStorage.delete(key: StorageKeys.refreshToken);
  }

  // ==============================
  // Remember Me
  // ==============================

  bool get rememberMe {
    return _localStorage.getBool(StorageKeys.rememberMe) ?? false;
  }

  Future<void> setRememberMe(bool value) async {
    await _localStorage.setBool(StorageKeys.rememberMe, value);
  }

  // ==============================
  // Onboarding
  // ==============================

  bool get onboardingCompleted {
    return _localStorage.getBool(StorageKeys.onboardingCompleted) ?? false;
  }

  Future<void> setOnboardingCompleted(bool value) async {
    await _localStorage.setBool(StorageKeys.onboardingCompleted, value);
  }

  // ==============================
  // Language
  // ==============================

  String? get selectedLanguage {
    return _localStorage.getString(StorageKeys.selectedLanguage);
  }

  Future<void> setSelectedLanguage(String language) async {
    await _localStorage.setString(StorageKeys.selectedLanguage, language);
  }

  // ==============================
  // Sync
  // ==============================

  int? get lastSyncTime {
    return _localStorage.getInt(StorageKeys.lastSyncTime);
  }

  Future<void> setLastSyncTime(int timestamp) async {
    await _localStorage.setInt(StorageKeys.lastSyncTime, timestamp);
  }

  // ==============================
  // Clear everything
  // ==============================

  Future<void> clearLocalData() async {
    await _localStorage.clear();
  }

  Future<void> clearAll() async {
    await clearAuthentication();
    await clearLocalData();
  }
}
