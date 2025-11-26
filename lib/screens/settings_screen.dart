import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/calculator_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final calc = context.watch<CalculatorProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),

      body: ListView(
        children: [
          const ListTile(
            title: Text("Theme Mode"),
            subtitle: Text("Light / Dark / System default"),
          ),

          RadioListTile(
            value: ThemeMode.light,
            groupValue: theme.themeMode,
            title: const Text("Light"),
            onChanged: (v) => theme.setThemeMode(v!),
          ),

          RadioListTile(
            value: ThemeMode.dark,
            groupValue: theme.themeMode,
            title: const Text("Dark"),
            onChanged: (v) => theme.setThemeMode(v!),
          ),

          RadioListTile(
            value: ThemeMode.system,
            groupValue: theme.themeMode,
            title: const Text("System"),
            onChanged: (v) => theme.setThemeMode(v!),
          ),

          const Divider(),

          const ListTile(title: Text("Angle Mode")),

          RadioListTile(
            value: AngleMode.degrees,
            groupValue: calc.angleMode,
            title: const Text("Degrees (DEG)"),
            onChanged: (v) => calc.setAngleMode(v!),
          ),

          RadioListTile(
            value: AngleMode.radians,
            groupValue: calc.angleMode,
            title: const Text("Radians (RAD)"),
            onChanged: (v) => calc.setAngleMode(v!),
          ),
        ],
      ),
    );
  }
}
