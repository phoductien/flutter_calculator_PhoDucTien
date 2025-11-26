enum CalculatorMode {
  basic,
  scientific,
  programmer,
}

extension ModeIndex on CalculatorMode {
  int get indexValue {
    switch (this) {
      case CalculatorMode.basic:
        return 0;
      case CalculatorMode.scientific:
        return 1;
      case CalculatorMode.programmer:
        return 2;
    }
  }
}

extension CalculatorModeExtension on CalculatorMode {
  static CalculatorMode fromIndex(int index) {
    switch (index) {
      case 0:
        return CalculatorMode.basic;
      case 1:
        return CalculatorMode.scientific;
      case 2:
        return CalculatorMode.programmer;
      default:
        return CalculatorMode.basic;
    }
  }
}
