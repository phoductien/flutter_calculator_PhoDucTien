import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/calculator_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final calc = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // =========================
          // THEME MODE
          // =========================
          const Text(
            "Theme",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          RadioGroup<ThemeMode>(
            value: theme.themeMode,
            onChanged: (mode) => theme.setTheme(mode),
            items: const [
              RadioGroupItem(value: ThemeMode.light, label: "Light"),
              RadioGroupItem(value: ThemeMode.dark, label: "Dark"),
              RadioGroupItem(value: ThemeMode.system, label: "System Default"),
            ],
          ),

          const Divider(height: 32),

          // =========================
          // ANGLE MODE (DEG / RAD)
          // =========================
          const Text(
            "Angle Mode",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          RadioGroup<AngleMode>(
            value: calc.angleMode,
            onChanged: (mode) => calc.setAngleMode(mode),
            items: const [
              RadioGroupItem(value: AngleMode.degrees, label: "Degrees (DEG)"),
              RadioGroupItem(value: AngleMode.radians, label: "Radians (RAD)"),
            ],
          ),

          const Divider(height: 32),
        ],
      ),
    );
  }
}

class RadioGroupItem<T> {
  final T value;
  final String label;
  const RadioGroupItem({required this.value, required this.label});
}

class RadioGroup<T> extends StatelessWidget {
  final T value;
  final ValueChanged<T> onChanged;
  final List<RadioGroupItem<T>> items;

  const RadioGroup({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return RadioMenuButton<T>(
          value: item.value,
          groupValue: value,
          onChanged: (val) => onChanged(val as T),
          child: Text(item.label),
        );
      }).toList(),
    );
  }
}
