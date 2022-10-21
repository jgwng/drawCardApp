import '../business_logic/model/drawn_line.dart';
import 'package:flutter/material.dart';

class Sketcher extends CustomPainter {
  final List<DrawnLine> lines;
  Sketcher({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    for (final stroke in lines) {
      final paint = Paint()
        ..strokeWidth = stroke.width
        ..color =
            (stroke.isErase) ? Colors.transparent : stroke.paint ?? Colors.red
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..blendMode = (stroke.isErase) ? BlendMode.clear : BlendMode.srcOver;
      canvas.drawPath(stroke.path, paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return true;
  }
}
