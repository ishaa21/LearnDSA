import 'package:flutter/material.dart';

class BFSVisualizer extends StatefulWidget {
  const BFSVisualizer({super.key});

  @override
  State<BFSVisualizer> createState() => _BFSVisualizerState();
}

class _BFSVisualizerState extends State<BFSVisualizer> {
  final List<String> order = ['A', 'B', 'C', 'D'];
  int index = 0;

  void next() {
    if (index < order.length - 1) {
      setState(() => index++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'BFS Traversal',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        Wrap(
          spacing: 16,
          children: order.map((n) {
            return CircleAvatar(
              radius: 24,
              backgroundColor:
                  order[index] == n ? Colors.green : Colors.grey,
              child: Text(n),
            );
          }).toList(),
        ),

        const SizedBox(height: 20),
        ElevatedButton(onPressed: next, child: const Text('Next')),
      ],
    );
  }
}
