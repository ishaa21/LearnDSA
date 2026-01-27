import 'package:flutter/material.dart';

class StackPlate extends StatelessWidget {
  final int value;

  const StackPlate({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green.shade500,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        value.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
