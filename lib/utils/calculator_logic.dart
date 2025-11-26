// ignore_for_file: avoid_function_literals_in_foreach_calls

class CalculatorLogic {
  /// Xóa 1 ký tự cuối (CE)
  static String clearEnd(String expr) {
    if (expr.isEmpty) return "";
    return expr.substring(0, expr.length - 1);
  }

  /// Đổi dấu ±
  static String toggleSign(String expr) {
    if (expr.isEmpty) return expr;

    // Nếu đã có dấu âm đầu chuỗi → bỏ dấu
    if (expr.startsWith("-")) {
      return expr.substring(1);
    }

    // Ngược lại thêm dấu âm
    return "-$expr";
  }

  /// Tính phần trăm %
  static String percent(String expr) {
    if (expr.isEmpty) return expr;

    try {
      final value = double.parse(expr);
      return (value / 100).toString();
    } catch (_) {
      return expr;
    }
  }

  /// ================================
  /// THÊM HÀM KHOA HỌC
  /// ================================
  static String addScientific(String expr, String func) {
    switch (func) {
      case "sin":
        return "sin($expr)";
      case "cos":
        return "cos($expr)";
      case "tan":
        return "tan($expr)";

      case "ln":
        return "ln($expr)";
      case "log":
        return "log($expr)";

      case "√":
        return "sqrt($expr)";

      case "x²":
        return "($expr)^2";

      case "x^y":
        return "$expr^";

      case "π":
        return "$expr${3.141592653589793}";

      case "e":
        return "$expr${2.718281828459045}";

      default:
        return expr;
    }
  }
}
