import 'package:flutter/material.dart';

class SortBar extends StatelessWidget {
  final int value;
  final bool active;

  const SortBar({
    super.key,
    required this.value,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 32,
      height: value.toDouble() * 3,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: active ? Colors.redAccent : Colors.greenAccent.shade400,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
