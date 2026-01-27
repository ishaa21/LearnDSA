import 'package:flutter/material.dart';

class ArrayCell extends StatelessWidget {
  final int value;
  final int index;
  final bool active;

  const ArrayCell({
    super.key,
    required this.value,
    required this.index,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: 56,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? Colors.orange.shade300 : Colors.teal.shade300,
            borderRadius: BorderRadius.circular(10),
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '[$index]',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
