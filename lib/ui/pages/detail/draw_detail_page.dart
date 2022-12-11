import 'dart:io';

import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/painter/sketcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawDetailPage extends StatefulWidget {
  const DrawDetailPage({Key? key}) : super(key: key);

  @override
  State<DrawDetailPage> createState() => _DrawDetailPageState();
}

class _DrawDetailPageState extends State<DrawDetailPage> {
  List<DrawnLine> drawLines = [];
  @override
  void initState() {
    super.initState();
    drawLines = Get.arguments['drawLines'] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 56,
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 30,
                      ))),
            ),
            Expanded(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return CustomPaint(
                        painter: Sketcher(lines: drawLines),
                      );
                    }))),
            Container(
              height: 70,
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0)),
            )
          ],
        ),
      ),
    );
  }
}

class SOP extends CustomPainter {
  final List<DrawnLine> lines;
  SOP({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    var path_width = Get.width - 16;
    var path_height = Get.height - 200 - Get.mediaQuery.padding.top + 16;
    var screen_width = size.width;
    var screen_height = size.height;
    var x_scale = screen_width / path_width;
    var y_scale = screen_height / path_height;
    //UNCOMMENT the following line to see the scaling effect
    canvas.scale(x_scale, y_scale);
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
