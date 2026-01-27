import 'package:flutter/material.dart';

class NodeWidget extends StatelessWidget {
  final int value;
  final bool active;

  const NodeWidget({
    super.key,
    required this.value,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 70,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? Colors.orangeAccent : Colors.indigo.shade300,
        borderRadius: BorderRadius.circular(8),
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
