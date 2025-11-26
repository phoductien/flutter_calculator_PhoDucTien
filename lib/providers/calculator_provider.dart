import 'package:flutter/material.dart';
import '../models/calculator_mode.dart';
import '../utils/expression_parser.dart';
import '../utils/calculator_logic.dart';

enum AngleMode { degrees, radians }

class CalculatorProvider extends ChangeNotifier {
  String _expression = '';
  String _result = '0';
  String _errorMessage = '';

  CalculatorMode _mode = CalculatorMode.basic;
  AngleMode _angleMode = AngleMode.degrees;

  double _memory = 0;
  bool _hasMemory = false;

  String get expression => _expression;
  String get result => _result;
  String get errorMessage => _errorMessage;

  CalculatorMode get mode => _mode;
  AngleMode get angleMode => _angleMode;
  bool get hasMemory => _hasMemory;

  // ================================
  // Expression input
  // ================================
  void addToExpression(String value) {
    _expression += value;
    notifyListeners();
  }

  // ================================
  // Calculate result
  // ================================
  void calculate() {
    if (_expression.isEmpty) return;

    try {
      final parser = ExpressionParser(angleMode: _angleMode);
      final num res = parser.evaluate(_expression);
      _result = res.toString();
      _errorMessage = '';
    } catch (_) {
      _result = "0";
      _errorMessage = "Invalid Expression";
    }
    notifyListeners();
  }

  // ================================
  // Clear
  // ================================
  void clear() {
    _expression = '';
    _result = '0';
    _errorMessage = '';
    notifyListeners();
  }

  void clearEntry() {
    _expression = CalculatorLogic.clearEnd(_expression);
    notifyListeners();
  }

  // ================================
  // Sign toggle
  // ================================
  void toggleSign() {
    _expression = CalculatorLogic.toggleSign(_expression);
    notifyListeners();
  }

  // ================================
  // Percentage
  // ================================
  void addPercentage() {
    _expression = CalculatorLogic.percent(_expression);
    notifyListeners();
  }

  // ================================
  // Scientific functions
  // ================================
  void addScientificFunction(String func) {
    switch (func) {
      case "sin":
        _expression = "sin($_expression)";
        break;
      case "cos":
        _expression = "cos($_expression)";
        break;
      case "tan":
        _expression = "tan($_expression)";
        break;
      case "ln":
        _expression = "ln($_expression)";
        break;
      case "log":
        _expression = "log($_expression)";
        break;
      case "√":
        _expression = "sqrt($_expression)";
        break;
      case "x²":
        _expression = "($_expression)^2";
        break;
      case "x^y":
        _expression += "^";
        break;
      case "π":
        _expression += "3.141592653589";
        break;
      case "e":
        _expression += "2.71828182846";
        break;
    }
    notifyListeners();
  }

  // ================================
  // Mode switcher
  // ================================
  void setMode(CalculatorMode mode) {
    _mode = mode;
    notifyListeners();
  }

  // ================================
  // Angle mode DEG / RAD
  // ================================
  void setAngleMode(AngleMode mode) {
    _angleMode = mode;
    notifyListeners();
  }

  // ================================
  // Memory: M+, M-, MR, MC
  // ================================
  void memoryAdd() {
    _memory += double.tryParse(_result) ?? 0;
    _hasMemory = true;
    notifyListeners();
  }

  void memorySubtract() {
    _memory -= double.tryParse(_result) ?? 0;
    _hasMemory = true;
    notifyListeners();
  }

  void memoryRecall() {
    _expression = _memory.toString();
    _result = _memory.toString();
    notifyListeners();
  }

  void memoryClear() {
    _memory = 0;
    _hasMemory = false;
    notifyListeners();
  }
}
