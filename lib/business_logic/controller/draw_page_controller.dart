import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawPageController extends GetxController{
  RxList<DrawnLine> lines = <DrawnLine>[].obs;
  Rx<DrawnLine?> line = DrawnLine().obs;

  void clearScreen(){
    line.value =  DrawnLine();
    lines.clear();
  }

  void onDrawStart(DragStartDetails details){
    RenderBox box = Get.context!.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);
    line.value = DrawnLine(path : [point], color : Colors.red, width : 2.0);
  }

  void onDrawing(DragUpdateDetails details){
    RenderBox box = Get.context!.findRenderObject()  as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    List<Offset> path = List.from(line.value!.path)..add(point);
    line.value = DrawnLine(path : path, color : Colors.red, width : 2.0);
  }

  void onDrawEnd(DragEndDetails details) {

    lines.add(line.value!);
    refresh();
  }


}