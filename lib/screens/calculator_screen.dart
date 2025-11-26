import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';
import '../widgets/display_area.dart';
import '../widgets/button_grid.dart';
import '../widgets/app_drawer.dart';

import '../models/calculator_mode.dart';

import '../utils/basic_layout.dart';
import '../utils/scientific_layout.dart';
import '../utils/programmer_layout.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorProvider>(context);

    // Select layout based on mode
    final layout = switch (calc.mode) {
      CalculatorMode.basic => basicModeLayout,
      CalculatorMode.scientific => scientificModeLayout,
      CalculatorMode.programmer => programmerModeLayout,
    };

    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        title: Text(switch (calc.mode) {
          CalculatorMode.basic => "Standard Calculator",
          CalculatorMode.scientific => "Scientific Calculator",
          CalculatorMode.programmer => "Programmer Calculator",
        }),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: DisplayArea(
              expression: calc.expression,
              result: calc.result,
              error: calc.errorMessage,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ButtonGrid(
                layout: layout,
                onButtonPressed: (value) {
                  switch (value) {
                    case "=":
                      calc.calculate();
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
