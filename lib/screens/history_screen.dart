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
            icon: const Icon(Icons.delete),
            onPressed: () {
              history.clearHistory();
            },
          )
        ],
      ),

      body: history.history.isEmpty
          ? const Center(
              child: Text(
                "No History",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: history.history.length,
              itemBuilder: (context, i) {
                final item = history.history[i];
                return ListTile(
                  title: Text(item.expression),
                  subtitle: Text(item.timestamp.toString()),
                  trailing: Text(
                    item.result,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
