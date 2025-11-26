class CalculatorLogic {
  // CE – Xóa ký tự cuối
  static String clearEnd(String exp) {
    if (exp.isEmpty) return "";
    return exp.substring(0, exp.length - 1);
  }

  // ± – Đổi dấu
  static String toggleSign(String exp) {
    if (exp.isEmpty) return exp;

    if (exp.startsWith("-")) {
      return exp.substring(1);
    } else {
      return "-$exp";
    }
  }

  // % – Tính phần trăm
  static String percent(String exp) {
    try {
      final num value = num.parse(exp);
      return (value / 100).toString();
    } catch (_) {
      return exp;
    }
  }
}
