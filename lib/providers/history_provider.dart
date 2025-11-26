import 'dart:convert';
import 'package:flutter/material.dart';

import '../models/calculation_history.dart';
import '../services/storage_service.dart';

class HistoryProvider extends ChangeNotifier {
  List<CalculationHistory> _list = [];

  List<CalculationHistory> get history => _list;

  Future<void> loadHistory() async {
    final raw = await StorageService.loadHistory();
    _list = raw.map((e) => CalculationHistory.fromJson(e)).toList();
    notifyListeners();
  }

  void addHistory(String exp, String result) {
    if (exp.isEmpty || result.isEmpty) return;

    final entry = CalculationHistory(
      expression: exp,
      result: result,
      timestamp: DateTime.now(),
    );

    _list.insert(0, entry);
    _save();
  }

  void clearHistory() {
    _list.clear();
    _save();
  }

  void _save() {
    final data = _list.map((e) => e.toJson()).toList();
    StorageService.saveHistory(data);
    notifyListeners();
  }
}
