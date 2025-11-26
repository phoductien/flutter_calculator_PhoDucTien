// enum chế độ máy tính: Basic / Scientific / Programmer
enum CalculatorMode {
  basic,
  scientific,
  programmer,
}

// Extension thêm index và chuyển đổi
extension CalculatorModeExt on CalculatorMode {
  int get index => indexOf[this] ?? 0;

  static const indexOf = {
    CalculatorMode.basic: 0,
    CalculatorMode.scientific: 1,
    CalculatorMode.programmer: 2,
  };

  static CalculatorMode fromIndex(int i) {
    switch (i) {
      case 1:
        return CalculatorMode.scientific;
      case 2:
        return CalculatorMode.programmer;
      default:
        return CalculatorMode.basic;
    }
  }
}
