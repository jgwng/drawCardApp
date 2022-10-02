import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawPageController extends GetxController{
  RxList<DrawnLine> lines =  RxList<DrawnLine>();
  Rx<Color> drawColor = Colors.red.obs;
  RxBool isEraseMode = false.obs;
  Paint paint = Paint();

  static DrawPageController? get to{
    if(Get.isRegistered<DrawPageController>()){
      return Get.find<DrawPageController>();
    }else{
      return null;
    }
  }
  @override
  void onInit(){
    super.onInit();
    lines.add(DrawnLine());
    lines.removeLast();
  }
  void clearScreen(){
    lines.clear();
  }

  void onDrawStart(DragStartDetails details){
    final startX = details.globalPosition.dx;
    final startY = details.globalPosition.dy;

    final stroke = DrawnLine(
      paint: drawColor.value,
      width: 4.0,
      isErase: isEraseMode.value
    );
    print(stroke);
    stroke.path.moveTo(startX, startY);
    lines.add(stroke);

  }

  void onDrawing(DragUpdateDetails details){
    final endX = details.globalPosition.dx;
    final endY = details.globalPosition.dy;
    lines.last.path.lineTo(endX, endY);
    lines.refresh();
  }


  void colorChange(Color color){
    drawColor.value = color;
  }

  void toggleEraseMode(){
    isEraseMode.toggle();
  }
}