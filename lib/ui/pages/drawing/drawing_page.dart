import 'package:drawcard/business_logic/controller/draw_page/draw_page_controller.dart';
import 'package:drawcard/painter/sketcher.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DrawingPage extends GetView<DrawPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: drawPad(),
          ),
          Container(
            height: 80,
            width: Get.width,
            child: Center(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemCount: controller.palette.length,
                itemBuilder: (ctx, i) {
                  return colorButton(controller.palette[i]);
                },
                separatorBuilder: (ctx, i) {
                  return SizedBox(width: 20);
                },
              ),
            ),
          ),
          Obx(() {
            return GestureDetector(
              onTap: () => controller.toggleEraseMode(),
              child: Container(
                width: Get.width,
                height: 40,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  controller.isEraseMode.value ? '지우는 중' : '그리는 중',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),),
              ),
            );
          }),
          GestureDetector(
            onTap: () => controller.clearScreen(),
            child: Container(
              width: Get.width,
              height: 40,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text('초기화', style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }


  Widget drawPad() {
    return Obx(() {
      if (controller.lines.isEmpty) {
        print(controller.lines);
      }
      return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: GestureDetector(
              onPanStart: controller.onDrawStart,
              onPanUpdate: controller.onDrawing,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return CustomPaint(
                      painter: Sketcher(lines: controller.lines),
                    );
                  }
              )));
    });
  }

  Widget colorButton(Color color) {
    return GestureDetector(
      onTap: () => controller.colorChange(color),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
        alignment: Alignment.center,
        child: Obx(() {
          return controller.drawColor.value == color ? Icon(Icons
              .brush,color: Colors.white) : SizedBox();
        }),
      ),
    );
  }

}
