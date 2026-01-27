import 'package:flutter/material.dart';

class ArrayCaption extends StatelessWidget {
  final String text;

  const ArrayCaption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: Text(
        text,
        key: ValueKey(text),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
