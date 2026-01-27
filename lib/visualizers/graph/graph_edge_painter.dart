import 'package:flutter/material.dart';

class GraphEdgePainter extends CustomPainter {
  final Offset from;
  final Offset to;

  GraphEdgePainter(this.from, this.to);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2;

    canvas.drawLine(from, to, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
