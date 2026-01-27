import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2;

    final start = Offset(0, size.height / 2);
    final end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);

    final arrowSize = 6.0;
    canvas.drawLine(
      end,
      end - Offset(arrowSize, arrowSize),
      paint,
    );
    canvas.drawLine(
      end,
      end - Offset(arrowSize, -arrowSize),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
