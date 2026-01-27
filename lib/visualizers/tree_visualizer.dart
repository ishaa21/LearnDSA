import 'package:flutter/material.dart';

class TreeVisualizer extends StatelessWidget {
  const TreeVisualizer({super.key});

  Widget node(String value) {
    return CircleAvatar(
      radius: 18,
      child: Text(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Binary Tree'),
        const SizedBox(height: 20),
        node('A'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            node('B'),
            const SizedBox(width: 40),
            node('C'),
          ],
        ),
      ],
    );
  }
}
