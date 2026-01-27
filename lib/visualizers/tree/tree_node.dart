import 'package:flutter/material.dart';

class TreeNodeWidget extends StatelessWidget {
  final int value;
  final bool active;
  final bool visited;

  const TreeNodeWidget({
    super.key,
    required this.value,
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
      width: 44,
      height: 44,
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
        value.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
