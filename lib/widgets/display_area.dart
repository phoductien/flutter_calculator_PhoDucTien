import 'package:flutter/material.dart';

class DisplayArea extends StatelessWidget {
  final String expression;
  final String result;
  final String error;

  const DisplayArea({
    super.key,
    required this.expression,
    required this.result,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            expression,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            result,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (error.isNotEmpty)
            Text(
              error,
              style: const TextStyle(color: Colors.redAccent),
            ),
        ],
      ),
    );
  }
}
