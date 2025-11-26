import 'package:math_expressions/math_expressions.dart';
import '../providers/calculator_provider.dart';

class ExpressionParser {
  final AngleMode angleMode;

  ExpressionParser({required this.angleMode});

  num evaluate(String exp) {
    String processed = exp;

    // Thay thế ký tự toán học
    processed = processed.replaceAll("×", "*");
    processed = processed.replaceAll("÷", "/");
    processed = processed.replaceAll("√", "sqrt");
    processed = processed.replaceAll("π", "3.141592653589");
    processed = processed.replaceAll("e", "2.71828182846");

    // Chuyển ° sang rad nếu đang ở DEG
    if (angleMode == AngleMode.degrees) {
      processed = processed.replaceAllMapped(
        RegExp(r'(sin|cos|tan)\(([^)]+)\)'),
        (m) =>
            "${m[1]!}((${m[2]!})*3.141592653589/180)",
      );
    }

    // Parse expression
    final parser = Parser();
    final Expression expression = parser.parse(processed);

    final cm = ContextModel();
    return expression.evaluate(EvaluationType.REAL, cm);
  }
}
