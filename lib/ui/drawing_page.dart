import 'package:drawcard/business_logic/controller/draw_page_controller.dart';
import 'package:get/get.dart';
import '../painter/sketcher.dart';
import 'package:flutter/material.dart';

class DrawingPage extends GetView<DrawPageController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                buildTotalPath(),
                buildCurrentPath(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => controller.clearScreen(),
            child: Container(
              height: 60,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }

  Widget buildTotalPath() {
    return RepaintBoundary(
      child: Obx((){
        return Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.all(4.0),
          color: Colors.transparent,
          alignment: Alignment.topLeft,
          child: CustomPaint(
            painter: Sketcher(
              lines: [controller.line.value],
            ),
          ),
        );
      }),
    );
  }

  Widget buildCurrentPath() {
    return GestureDetector(
      onPanStart: (details) => controller.onDrawStart(details),
      onPanUpdate: (details) => controller.onDrawing(details),
      onPanEnd: (details) => controller.onDrawEnd(details),
      child: Obx((){
        return RepaintBoundary(
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.all(4.0),
            color: Colors.transparent,
            alignment: Alignment.topLeft,
            child:CustomPaint(
              painter: Sketcher(
                lines: controller.lines..toList(),
              ),
            ),
          ),
        );
      }),
    );
  }

}
