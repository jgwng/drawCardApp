import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawPageController extends GetxController {
  RxList<DrawnLine> lines = RxList<DrawnLine>();
  Rx<Color> drawColor = Colors.red.obs;
  RxBool isEraseMode = false.obs;
  Paint paint = Paint();
  RxDouble strokeWidth = 2.5.obs;

  Rx<DrawPadMenu> showMenu = DrawPadMenu.none.obs;

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
    if (showMenu.value != DrawPadMenu.none) {
      showMenu.value = DrawPadMenu.none;
      return;
    }

    final startX = details.globalPosition.dx - 12;
    final startY =
        details.globalPosition.dy - Get.mediaQuery.padding.top - 12 - 40;

    final stroke = DrawnLine(
        paint: drawColor.value,
        width: strokeWidth.value,
        isErase: isEraseMode.value);
    stroke.path.moveTo(startX, startY);
    lines.add(stroke);
  }

  void onDrawing(DragUpdateDetails details) {
    final endX = details.globalPosition.dx - 12;
    final endY =
        details.globalPosition.dy - Get.mediaQuery.padding.top - 12 - 40;
    lines.last.path.lineTo(endX, endY);
    lines.refresh();
  }

  void colorChange(Color color) {
    drawColor.value = color;
    showMenu.value = DrawPadMenu.none;
  }

  void toggleEraseMode() {
    isEraseMode.toggle();
  }

  void onTapForErase() async {
    isEraseMode.toggle();
  }

  void onTapChangeColor() {
    if (showMenu.value == DrawPadMenu.palette) {
      showMenu.value = DrawPadMenu.none;
    } else {
      showMenu.value = DrawPadMenu.palette;
    }
  }

  void onTapChangeStroke() {
    if (showMenu.value == DrawPadMenu.stroke) {
      showMenu.value = DrawPadMenu.none;
    } else {
      showMenu.value = DrawPadMenu.stroke;
    }
  }

  void onTapExitPage() {
    if (lines.isNotEmpty) {
      Get.back();
    } else {
      Get.back();
    }
  }
}

enum DrawPadMenu { palette, stroke, none }
