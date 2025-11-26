// Lưu dữ liệu bằng SharedPreferences
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _historyKey = "calc_history";
  static const _themeKey = "theme_mode";
  static const _modeKey = "calculator_mode";
  static const _memoryKey = "memory_value";
  static const _angleKey = "angle_mode";

  // ------------------------------
  // LỊCH SỬ TÍNH TOÁN
  // ------------------------------

  // Lưu lịch sử: List<Map<String, dynamic>>
  static Future<void> saveHistory(List<Map<String, dynamic>> history) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = history.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList(_historyKey, jsonList);
  }

  // Tải lịch sử
  static Future<List<Map<String, dynamic>>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_historyKey);

    if (raw == null) return [];

    return raw
        .map((e) => jsonDecode(e))
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  // ------------------------------
  // THEME (Light / Dark / System)
  // ------------------------------

  static Future<void> saveThemeMode(int modeIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, modeIndex);
  }

  static Future<int?> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_themeKey);
  }

  // ------------------------------
  // CALCULATOR MODE (Basic / Scientific / Programmer)
  // ------------------------------

  static Future<void> saveCalculatorMode(int modeIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_modeKey, modeIndex);
  }

  static Future<int?> loadCalculatorMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_modeKey);
  }

  // ------------------------------
  // MEMORY (MR / M+ / M- / MC)
  // ------------------------------

  static Future<void> saveMemory(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_memoryKey, value);
  }

  static Future<double?> loadMemory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_memoryKey);
  }

  // ------------------------------
  // ANGLE MODE (DEG / RAD)
  // ------------------------------

  static Future<void> saveAngleMode(int angleMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_angleKey, angleMode);
  }

  static Future<int?> loadAngleMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_angleKey);
  }
}
