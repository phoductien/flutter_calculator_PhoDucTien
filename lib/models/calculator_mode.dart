// Định nghĩa các chế độ máy tính

enum CalculatorMode {
  basic,       // Standard
  scientific,  // Scientific
  programmer,  // Programmer
}

// Extension tiện dùng index nếu cần
extension CalculatorModeExt on CalculatorMode {
  int get indexValue => index;

  static CalculatorMode fromIndex(int i) {
    if (i < 0 || i >= CalculatorMode.values.length) {
      return CalculatorMode.basic;
    }
    return CalculatorMode.values[i];
  }
}
