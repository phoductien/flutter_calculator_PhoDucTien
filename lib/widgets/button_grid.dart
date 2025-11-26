import 'package:flutter/material.dart';
import 'calculator_button.dart';

class ButtonGrid extends StatelessWidget {
  final List<List<String>> layout;
  final Function(String) onButtonPressed;

  const ButtonGrid({
    super.key,
    required this.layout,
    required this.onButtonPressed,
  });

  Color _getColor(String value) {
    if (value == "C") return const Color(0xFFFF8C5A); // cam
    if (value == "CE") return const Color(0xFFFF6B6B);
    if (["÷", "×", "-", "+", "="].contains(value)) {
      return const Color(0xFF4CAF50); // xanh lá
    }
    return const Color(0xFF4F5D75); // nút số & %
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: layout.map((row) {
        return Expanded(
          child: Row(
            children: row.map((value) {
              return Expanded(
                child: CalculatorButton(
                  label: value,
                  color: _getColor(value),
                  onPressed: () => onButtonPressed(value),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
