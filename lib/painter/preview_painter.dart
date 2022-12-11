import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewPainter extends CustomPainter {
  final List<DrawnLine> lines;
  PreviewPainter({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    var pathWidth = Get.width - 16;
    var pathHeight = Get.height - 160 - Get.mediaQuery.padding.top + 16;
    var screenWidth = size.width;
    var screenHeight = size.height;
    var xScale = screenWidth / pathWidth;
    var yScale = screenHeight / pathHeight;
    //UNCOMMENT the following line to see the scaling effect
    canvas.scale(xScale, yScale);
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
