import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppFontSize { small, medium, large }

class SettingsProvider with ChangeNotifier {
  AppFontSize _fontSize = AppFontSize.medium;

  AppFontSize get fontSize => _fontSize;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final fontSizeIndex = prefs.getInt('fontSizeIndex') ?? 1; // Default to medium
    _fontSize = AppFontSize.values[fontSizeIndex];
    notifyListeners();
  }

  Future<void> setFontSize(AppFontSize size) async {
    _fontSize = size;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('fontSizeIndex', size.index);
    notifyListeners();
  }

  // Helper getters for specific values
  double get titleSize {
    switch (_fontSize) {
      case AppFontSize.small: return 18.0;
      case AppFontSize.medium: return 22.0;
      case AppFontSize.large: return 26.0;
    }
  }

  double get bodySize {
    switch (_fontSize) {
      case AppFontSize.small: return 13.0;
      case AppFontSize.medium: return 15.0;
      case AppFontSize.large: return 17.0;
    }
  }

  double get codeSize {
    switch (_fontSize) {
      case AppFontSize.small: return 11.0;
      case AppFontSize.medium: return 13.0;
      case AppFontSize.large: return 15.0;
    }
  }
}
