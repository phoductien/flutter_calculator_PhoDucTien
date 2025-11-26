import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle, // NÚT TRÒN
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
