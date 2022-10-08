import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawPageController extends GetxController {
  RxList<DrawnLine> lines = RxList<DrawnLine>();
  Rx<Color> drawColor = Colors.red.obs;
  RxBool isEraseMode = false.obs;
  Paint paint = Paint();
  RxDouble radius = 2.0.obs;
  static DrawPageController? get to {
    if (Get.isRegistered<DrawPageController>()) {
      return Get.find<DrawPageController>();
    } else {
      return null;
    }
  }

  List<Color> palette = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.brown,
    Colors.blue,
    Palette.kToDark,
    Colors.grey
  ];

  @override
  void onInit() {
    super.onInit();
    lines.add(DrawnLine());
    lines.removeLast();
  }

  void clearScreen() {
    lines.clear();
  }

  void onDrawStart(DragStartDetails details) {
    final startX = details.globalPosition.dx-12;
    final startY = details.globalPosition.dy-Get.mediaQuery.padding.top-12-40;

    final stroke = DrawnLine(
        paint: drawColor.value, width: 4.0, isErase: isEraseMode.value);
    print(stroke);
    stroke.path.moveTo(startX, startY);
    lines.add(stroke);
  }

  void onDrawing(DragUpdateDetails details) {
    final endX = details.globalPosition.dx-12;
    final endY = details.globalPosition.dy-Get.mediaQuery.padding.top-12-40;
    lines.last.path.lineTo(endX, endY);
    lines.refresh();
  }

  void colorChange(Color color) {
    drawColor.value = color;
    isEraseMode.value = false;
  }

  void toggleEraseMode() {
    print('erase');
    isEraseMode.toggle();
  }
}
