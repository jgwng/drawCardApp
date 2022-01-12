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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              colorButton(Colors.red),
              colorButton(Colors.yellow),
              colorButton(Colors.green),
              colorButton(Colors.purple),
              colorButton(Colors.brown),
              colorButton(Colors.grey),

            ],
          ),
          Obx((){
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
              child: Text('초기화',style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }

  Widget colorButton(Color color){
    return Flexible(
      child: GestureDetector(
        onTap: () => controller.colorChange(color),
        child: Container(
          color: color,
          height: 30,
        ),
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
