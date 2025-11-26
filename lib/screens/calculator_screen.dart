import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/calculator_mode.dart';

import '../providers/calculator_provider.dart';
import '../providers/history_provider.dart';

import '../utils/basic_layout.dart';
import '../utils/scientific_layout.dart';
import '../utils/programmer_layout.dart';

import '../widgets/display_area.dart';
import '../widgets/button_grid.dart';
import '../widgets/mode_selector.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calc = context.watch<CalculatorProvider>();
    final history = context.read<HistoryProvider>();

    List<List<String>> layout;

    switch (calc.mode) {
      case CalculatorMode.basic:
        layout = basicModeLayout;
        break;
      case CalculatorMode.scientific:
        layout = scientificModeLayout;
        break;
      case CalculatorMode.programmer:
        layout = programmerModeLayout;
        break;
    }

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: DisplayArea(
              expression: calc.expression,
              result: calc.result,
              error: calc.errorMessage,
            ),
          ),

          ModeSelector(
            currentMode: calc.mode.index,
            onModeChanged: (m) => calc.setMode(CalculatorMode.values[m]),
          ),

          const SizedBox(height: 18),

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
    );
  }
}

