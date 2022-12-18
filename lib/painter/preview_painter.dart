import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewPainter extends CustomPainter {
  final List<DrawnLine> lines;
  PreviewPainter({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in lines) {
      final paint = Paint()
        ..strokeWidth = stroke.width
        ..color =
            (stroke.isErase) ? Colors.transparent : stroke.paint ?? Colors.red
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..blendMode = (stroke.isErase) ? BlendMode.clear : BlendMode.srcOver;
      canvas.drawPath(stroke.drawPath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
