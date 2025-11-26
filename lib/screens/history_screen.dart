import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/history_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<HistoryProvider>().history;

    return Scaffold(
      appBar: AppBar(title: const Text("History")),

      body: history.isEmpty
          ? const Center(child: Text("No history yet"))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, i) {
                final h = history[i];

                return ListTile(
                  title: Text(h.expression),
                  subtitle: Text("= ${h.result}"),
                );
              },
            ),
    );
  }
}
