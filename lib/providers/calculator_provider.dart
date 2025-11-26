import 'package:flutter/material.dart';
import '../utils/expression_parser.dart';
import '../utils/calculator_logic.dart';
import '../models/calculator_mode.dart';

enum AngleMode { degrees, radians }

class CalculatorProvider extends ChangeNotifier {
  String _expression = "";
  String _result = "0";
  String _error = "";

  CalculatorMode _mode = CalculatorMode.basic;
  AngleMode _angleMode = AngleMode.degrees;

  double _memory = 0;

  String get expression => _expression;
  String get result => _result;
  String get errorMessage => _error;

  CalculatorMode get mode => _mode;
  AngleMode get angleMode => _angleMode;

  // ================================
  // THÊM KÝ TỰ VÀO BIỂU THỨC
  // ================================
  void addToExpression(String value) {
    _error = "";
    _expression += value;
    notifyListeners();
  }

  // ================================
  // TÍNH TOÁN KẾT QUẢ
  // ================================
  void calculate() {
  if (_expression.isEmpty) return;

  try {
    final parser = ExpressionParser(angleMode: _angleMode);
    final num res = parser.evaluate(_expression);

    // =============================
    // FORMAT KẾT QUẢ BỎ .0
    // =============================
    if (res is double && res == res.toInt()) {
      _result = res.toInt().toString();  // ví dụ 325.0 → 325
    } else {
      _result = res.toString();
    }

    _error = "";
  } catch (e) {
    _result = "0";
    _error = "Invalid expression";
  }

  notifyListeners();
}

  // ================================
  // CLEAR
  // ================================
  void clear() {
    _expression = "";
    _result = "0";
    _error = "";
    notifyListeners();
  }

  void clearEntry() {
    _expression = CalculatorLogic.clearEnd(_expression);
    notifyListeners();
  }

  // ================================
  // CHANGE SIGN
  // ================================
  void toggleSign() {
    _expression = CalculatorLogic.toggleSign(_expression);
    notifyListeners();
  }

  // ================================
  // PERCENTAGE
  // ================================
  void addPercentage() {
    _expression = CalculatorLogic.percent(_expression);
    notifyListeners();
  }

  // ================================
  // SCIENTIFIC FUNCTION
  // ================================
  void addScientificFunction(String func) {
    _expression = CalculatorLogic.addScientific(_expression, func);
    notifyListeners();
  }

  // ================================
  // MODE CHANGE
  // ================================
  void setMode(CalculatorMode mode) {
    _mode = mode;
    notifyListeners();
  }

  void setAngleMode(AngleMode m) {
    _angleMode = m;
    notifyListeners();
  }
}
