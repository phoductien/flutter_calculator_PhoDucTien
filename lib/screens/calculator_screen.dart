import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';
import '../providers/history_provider.dart';

import '../widgets/display_area.dart';
import '../widgets/button_grid.dart';
import '../widgets/mode_selector.dart';

import '../utils/basic_layout.dart';
import '../utils/scientific_layout.dart';
import '../utils/programmer_layout.dart';
import '../models/calculator_mode.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorProvider>(context);
    final history = Provider.of<HistoryProvider>(context);

    // Chọn layout theo mode
    final layout = switch (calc.mode) {
      CalculatorMode.basic => basicModeLayout,
      CalculatorMode.scientific => scientificModeLayout,
      CalculatorMode.programmer => programmerModeLayout,
    };

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Hiển thị biểu thức + kết quả
            Padding(
              padding: const EdgeInsets.all(24),
              child: DisplayArea(
                expression: calc.expression,
                result: calc.result,
                error: calc.result == "Error" ? "Invalid Expression" : "",
              ),
            ),

            // Chọn chế độ Basic / Sci / Programmer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ModeSelector(
                currentMode: calc.mode.indexValue,
                onModeChanged: (modeIndex) {
                  calc.toggleMode(
                    CalculatorModeExtension.fromIndex(modeIndex),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Lưới nút tính toán
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ButtonGrid(
                  layout: layout,
                  onButtonPressed: (value) {
                    switch (value) {
                      case "=":
                        calc.calculate();
                        history.addHistory(calc.expression, calc.result);
                        break;

                      case "C":
                        calc.clear();
                        break;

                      case "CE":
                        calc.clearEntry();
                        break;

                      case "%":
                        calc.addPercentage();
                        break;

                      case "±":
                        calc.toggleSign();
                        break;

                      case "sin":
                      case "cos":
                      case "tan":
                      case "ln":
                      case "log":
                      case "√":
                      case "x²":
                      case "x^y":
                      case "π":
                      case "e":
                        calc.addScientificFunction(value);
                        break;

                      default:
                        calc.addToExpression(value);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
