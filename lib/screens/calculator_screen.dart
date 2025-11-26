import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';
import '../providers/history_provider.dart';

import '../widgets/display_area.dart';
import '../widgets/button_grid.dart';

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
      default:
        layout = basicModeLayout;
    }

    return Scaffold(
      drawer: _buildDrawer(context, calc),  // ⬅ THÊM MENU NÀY
      appBar: AppBar(
        title: const Text("Advanced Calculator"),
        centerTitle: false,
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Display
            Padding(
              padding: const EdgeInsets.all(24),
              child: DisplayArea(
                expression: calc.expression,
                result: calc.result,
                error: calc.result == "Error" ? "Invalid Expression" : "",
              ),
            ),

            // Nút layout
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

                      default:
                        calc.addToExpression(value);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Drawer Menu giống Windows Calculator
  Widget _buildDrawer(BuildContext context, CalculatorProvider calc) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF1E1E1E)),
            child: Text("Calculator Modes",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),

          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Standard"),
            selected: calc.mode == CalculatorMode.basic,
            onTap: () {
              calc.toggleMode(CalculatorMode.basic);
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.science),
            title: const Text("Scientific"),
            selected: calc.mode == CalculatorMode.scientific,
            onTap: () {
              calc.toggleMode(CalculatorMode.scientific);
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.code),
            title: const Text("Programmer"),
            selected: calc.mode == CalculatorMode.programmer,
            onTap: () {
              calc.toggleMode(CalculatorMode.programmer);
              Navigator.pop(context);
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("History"),
            onTap: () {
              Navigator.pushNamed(context, "/history");
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, "/settings");
            },
          ),
        ],
      ),
    );
  }
}
