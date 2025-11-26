import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';
import '../models/calculator_mode.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorProvider>(context);

    return Drawer(
      child: ListView(
        children: [

          const DrawerHeader(
            child: Text(
              "Calculator Modes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // Standard
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Standard"),
            onTap: () {
              calc.setMode(CalculatorMode.basic);
              Navigator.pop(context);
            },
          ),

          // Scientific
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text("Scientific"),
            onTap: () {
              calc.setMode(CalculatorMode.scientific);
              Navigator.pop(context);
            },
          ),

          // Programmer
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text("Programmer"),
            onTap: () {
              calc.setMode(CalculatorMode.programmer);
              Navigator.pop(context);
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("History (coming soon)"),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, "/settings");
            },
          )
        ],
      ),
    );
  }
}

