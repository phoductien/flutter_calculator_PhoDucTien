import 'package:flutter/material.dart';
import '../services/storage_service.dart';

/// Provider quản lý theme Light / Dark / System
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  /// Giá trị theme hiện tại
  ThemeMode get themeMode => _themeMode;

  /// Đặt theme mới
  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    StorageService.saveThemeMode(mode.index);
    notifyListeners();
  }

  /// Load theme từ SharedPreferences
  Future<void> loadTheme() async {
    final saved = await StorageService.loadThemeMode();
    if (saved != null) {
      _themeMode = ThemeMode.values[saved];
      notifyListeners();
    }
  }
}
