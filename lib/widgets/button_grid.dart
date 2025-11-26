import 'package:flutter/material.dart';
import 'calculator_button.dart';

class ButtonGrid extends StatelessWidget {
  final List<List<String>> layout;
  final Function(String value) onButtonPressed;

  const ButtonGrid({
    super.key,
    required this.layout,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final allButtons = layout.expand((row) => row).toList();

    return GridView.builder(
      itemCount: allButtons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: layout.first.length,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final label = allButtons[index];

        Color color = Colors.grey.shade800;
        if (label == "=" || label == "C" || label == "CE") {
          color = Colors.redAccent.shade200;
        } else if (["+","-","×","÷","%"].contains(label)) {
          color = Colors.blueAccent.shade700;
        }

        return CalculatorButton(
          label: label,
          color: color,
          onPressed: () => onButtonPressed(label),
        );
      },
    );
  }
}
