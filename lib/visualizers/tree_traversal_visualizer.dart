import 'package:flutter/material.dart';

class TreeTraversalVisualizer extends StatelessWidget {
  final String type;

  const TreeTraversalVisualizer({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          type.replaceAll('Traversal', '') + ' Traversal',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        const Text(
          'Traversal order will be highlighted here',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
