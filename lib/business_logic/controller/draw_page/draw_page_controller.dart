import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawPageController extends GetxController{
  RxList<DrawnLine?> lines = <DrawnLine?>[].obs;
  Rx<DrawnLine?> line = DrawnLine().obs;
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



  void clearScreen(){
    line.value =  DrawnLine();
    lines.clear();
  }

  void onDrawStart(DragStartDetails details){
    RenderBox box = Get.context!.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    paint = Paint()..color = (isEraseMode.isTrue) ? Colors.white : drawColor.value
      ..isAntiAlias = true
      ..strokeWidth = 2.0;
    line.value = DrawnLine(path : [point], paint : paint, width : paint.strokeWidth);
  }

  void onDrawing(DragUpdateDetails details){
    RenderBox box = Get.context!.findRenderObject()  as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    List<Offset> path = List.from(line.value!.path)..add(point);
    paint = Paint()..color = (isEraseMode.isTrue) ? Colors.white : drawColor.value
      ..isAntiAlias = true
      ..strokeWidth = 2.0;
    line.value = DrawnLine(path :path, paint : paint, width :paint.strokeWidth);
  }

  void onDrawEnd(DragEndDetails details) {
    lines.add(line.value!);
  }

  void colorChange(Color color){
    drawColor.value = color;
  }

  void toggleEraseMode(){
    isEraseMode.toggle();
  }
}