import 'package:flutter/material.dart';

class ModeSelector extends StatelessWidget {
  final int currentMode;
  final Function(int) onModeChanged;

  const ModeSelector({
    super.key,
    required this.currentMode,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final modes = ["Basic", "Scientific", "Programmer"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(modes.length, (index) {
        final selected = index == currentMode;

        return Expanded(
          child: GestureDetector(
            onTap: () => onModeChanged(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: selected
                    ? Colors.blueAccent
                    : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                modes[index],
                style: TextStyle(
                  fontSize: 16,
                  color: selected ? Colors.black : Colors.white70,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
