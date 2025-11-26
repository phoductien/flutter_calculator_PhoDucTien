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
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Biểu thức (scroll ngang khi dài)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(
              expression,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Kết quả
          Text(
            result,
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),

          // Thông báo lỗi
          if (error.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                error,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                ),
              ),
            )
        ],
      ),
    );
  }
}
