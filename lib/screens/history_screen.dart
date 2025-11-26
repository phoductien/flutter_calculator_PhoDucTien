import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/history_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<HistoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        actions: [
          IconButton(
            onPressed: () {
              history.clearHistory();
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),

      body: history.history.isEmpty
          ? const Center(
              child: Text(
                "No history yet",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: history.history.length,
              itemBuilder: (context, index) {
                final item = history.history[index];
                return ListTile(
                  title: Text(item.expression),
                  subtitle: Text(item.result),
                  trailing: Text(
                    item.timestamp.toIso8601String().substring(11, 19),
                  ),
                );
              },
            ),
    );
  }
}
