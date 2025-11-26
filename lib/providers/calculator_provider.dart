import 'package:flutter/material.dart';
import '../models/calculator_mode.dart';
import '../utils/calculator_logic.dart';
import '../utils/expression_parser.dart';

enum AngleMode { degrees, radians }

class CalculatorProvider extends ChangeNotifier {
  String _expression = "";
  String _result = "0";

  CalculatorMode _mode = CalculatorMode.basic;
  AngleMode _angleMode = AngleMode.degrees;

  double _memory = 0;
  bool _hasMemory = false;

  String get expression => _expression;
  String get result => _result;

  CalculatorMode get mode => _mode;
  AngleMode get angleMode => _angleMode;
  bool get hasMemory => _hasMemory;

  void addToExpression(String v) {
    _expression += v;
    notifyListeners();
  }

  void clear() {
    _expression = "";
    _result = "0";
    notifyListeners();
  }

  void clearEntry() {
    _expression = CalculatorLogic.clearEnd(_expression);
    notifyListeners();
  }

  void toggleSign() {
    _expression = CalculatorLogic.toggleSign(_expression);
    notifyListeners();
  }

  void addPercentage() {
    _expression = CalculatorLogic.percent(_expression);
    notifyListeners();
  }

  void calculate() {
    if (_expression.isEmpty) return;

    try {
      final parser = ExpressionParser(angleMode: _angleMode);
      final res = parser.evaluate(_expression);
      _result = res.toString();
    } catch (_) {
      _result = "Error";
    }

    notifyListeners();
  }

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

  void toggleMode(CalculatorMode newMode) {
    _mode = newMode;
    notifyListeners();
  }

  void setAngleMode(AngleMode mode) {
    _angleMode = mode;
    notifyListeners();
  }

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
