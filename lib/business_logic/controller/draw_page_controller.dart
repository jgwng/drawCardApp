import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawPageController extends GetxController{
  RxList<DrawnLine?> lines = <DrawnLine?>[].obs;
  Rx<DrawnLine?> line = DrawnLine().obs;
  Rx<Color> drawColor = Colors.red.obs;
  RxBool isEraseMode = false.obs;
  Paint paint = Paint();
  void clearScreen(){
    line.value =  DrawnLine();
    lines.clear();
  }

  void onDrawStart(DragStartDetails details){
    RenderBox box = Get.context!.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    if(isEraseMode.isTrue){
      paint = Paint()..color =  Colors.yellow[50]!
    ..blendMode = BlendMode.clear
    ..strokeWidth = 100
    ..style = PaintingStyle.stroke;
    }else{
      paint = Paint()..color = drawColor.value
      ..strokeWidth = 2.0;
    }
    line.value = DrawnLine(path : [point], paint : paint, width : paint.strokeWidth);
  }

  void onDrawing(DragUpdateDetails details){
    RenderBox box = Get.context!.findRenderObject()  as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    List<Offset> path = List.from(line.value!.path)..add(point);

    if(isEraseMode.isTrue){
      paint = Paint()..color = Colors.yellow[50]!
        ..blendMode = BlendMode.clear
        ..strokeWidth =100
      ..strokeCap = StrokeCap.round;
    }else{
      paint = Paint()..color = drawColor.value
        ..strokeWidth = 2.0;
    }

    line.value = DrawnLine(path : path, paint : paint, width :paint.strokeWidth);
  }

  void onDrawEnd(DragEndDetails details) {

    lines.add(line.value!);
    refresh();
  }

  void colorChange(Color color){
    drawColor.value = color;
  }

  void toggleEraseMode(){
    isEraseMode.toggle();
  }
}