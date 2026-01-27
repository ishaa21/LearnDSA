import 'package:flutter/material.dart';

class GraphNode extends StatelessWidget {
  final String label;
  final bool active;
  final bool visited;

  const GraphNode({
    super.key,
    required this.label,
    this.active = false,
    this.visited = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.blueGrey;

    if (visited) color = Colors.green;
    if (active) color = Colors.orange;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
