import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _onboardingCompleteKey = 'onboarding_complete';
  static const String _themeModeKey = 'theme_mode';

  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  // Onboarding
  bool get isOnboardingComplete => _prefs.getBool(_onboardingCompleteKey) ?? false;
  Future<void> setOnboardingComplete(bool complete) async {
    await _prefs.setBool(_onboardingCompleteKey, complete);
  }

  // Theme Mode: 'light' or 'dark'
  String get themeMode => _prefs.getString(_themeModeKey) ?? 'light';
  Future<void> setThemeMode(String mode) async {
    await _prefs.setString(_themeModeKey, mode);
  }
}