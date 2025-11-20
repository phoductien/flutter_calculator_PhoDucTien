import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        scaffoldBackgroundColor: const Color(0xFF2D3142),
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = "0";
  double _num1 = 0;
  double _num2 = 0;
  String _operation = "";

  // ------------------------------------------------------------
  // 1. Number Input
  // ------------------------------------------------------------
  void _pressNumber(String num) {
    setState(() {
      if (_display == "0" || _display == "0000") {
        _display = num;
      } else {
        _display += num;
      }
    });
  }

  // ------------------------------------------------------------
  // 2. Decimal Handling
  // ------------------------------------------------------------
  void _pressDecimal() {
    if (!_display.contains(".")) {
      setState(() => _display += ".");
    }
  }

  // ------------------------------------------------------------
  // 3. Operation Handling (+ – × ÷)
  // ------------------------------------------------------------
  void _pressOperation(String op) {
    _num1 = double.tryParse(_display) ?? 0;
    _operation = op;
    setState(() => _display = "0");
  }

  // ------------------------------------------------------------
  // 4. Toggle Plus/Minus (±)
  // ------------------------------------------------------------
  void _toggleSign() {
    setState(() {
      if (_display.startsWith("-")) {
        _display = _display.substring(1);
      } else {
        _display = "-$_display";
      }
    });
  }

  // ------------------------------------------------------------
  // 5. Percentage %
  // ------------------------------------------------------------
  void _pressPercent() {
    double num = double.tryParse(_display) ?? 0;
    setState(() {
      _display = (num / 100).toString();
    });
  }

  // ------------------------------------------------------------
  // 6. Clear (C)
  // ------------------------------------------------------------
  void _clear() {
    setState(() {
      _display = "0";
      _num1 = 0;
      _num2 = 0;
      _operation = "";
    });
  }

  // ------------------------------------------------------------
  // 7. Clear End (CE)
  // ------------------------------------------------------------
  void _clearEnd() {
    setState(() {
      if (_display.length > 1) {
        _display = _display.substring(0, _display.length - 1);
      } else {
        _display = "0";
      }
    });
  }

  // ------------------------------------------------------------
  // 8. Calculate Result (=)
  // ------------------------------------------------------------
  void _calculateResult() {
    _num2 = double.tryParse(_display) ?? 0;
    double result = 0;

    switch (_operation) {
      case "+":
        result = _num1 + _num2;
        break;
      case "-":
        result = _num1 - _num2;
        break;
      case "×":
        result = _num1 * _num2;
        break;
      case "÷":
        if (_num2 == 0) {
          setState(() => _display = "Error");
          return;
        }
        result = _num1 / _num2;
        break;
      default:
        return;
    }

    setState(() {
      _display = result.toString();
      _operation = "";
    });
  }

  // ------------------------------------------------------------
  // 9. UI Button Builder (Circle)
  // ------------------------------------------------------------
  Widget _circleButton(String text, Color color, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(1000),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // 10. UI BUILD
  // ------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    const secondary = Color(0xFF4F5D75);
    const accent = Color(0xFFEF8354);

    final layout = [
      ["C", "CE", "%", "÷"],
      ["7", "8", "9", "×"],
      ["4", "5", "6", "-"],
      ["1", "2", "3", "+"],
      ["±", "0", ".", "="],
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // DISPLAY --------------------------------------------------
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _display,
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // BUTTON GRID ----------------------------------------------
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final text = layout[index ~/ 4][index % 4];

                  Color color = secondary;
                  Function()? action;

                  switch (text) {
                    case "C":
                      color = accent;
                      action = _clear;
                      break;

                    case "CE":
                      color = secondary;
                      action = _clearEnd;
                      break;

                    case "%":
                      action = _pressPercent;
                      break;

                    case "±":
                      action = _toggleSign;
                      break;

                    case "÷":
                    case "×":
                    case "-":
                    case "+":
                      color = Colors.green.shade700;
                      action = () => _pressOperation(text);
                      break;

                    case "=":
                      color = Colors.green.shade800;
                      action = _calculateResult;
                      break;

                    case ".":
                      action = _pressDecimal;
                      break;

                    default:
                      action = () => _pressNumber(text);
                  }

                  return _circleButton(text, color, action);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
