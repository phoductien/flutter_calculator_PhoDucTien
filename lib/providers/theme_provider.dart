import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF2F2F7),
        colorScheme: ColorScheme.light(
          primary: Colors.blue.shade600,
        ),
        useMaterial3: false,
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF2B3040),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF4F5D75),
        ),
        useMaterial3: false,
      );
}
