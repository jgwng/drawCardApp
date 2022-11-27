import 'dart:io';

import 'package:drawcard/business_logic/controller/draw_page/draw_page_controller.dart';
import 'package:drawcard/business_logic/enums/draw_pad_type.dart';
import 'package:drawcard/painter/sketcher.dart';
import 'package:drawcard/ui/widget/expand_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DrawingPage extends GetView<DrawPageController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Platform.isIOS) {
          return Future.value(false);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: controller.onTapExitPage,
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 30,
                              ))),
                        InkWell(
                            onTap: controller.onTapSaveImage,
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.save,
                                color: Colors.white,
                                size: 30,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RepaintBoundary(
                      key: controller.paletteKey,
                      child: drawPad(),
                    ),
                  )
                ],
              ),
              bottomMenu(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomMenu() {
    return Obx(() {
      return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpandedSection(
              expand: controller.showMenu.value != DrawPadMenu.none,
              child: drawPadOption(),
            ),
            Container(
              height: 70,
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() {
                    return InkWell(
                      onTap: controller.onTapChangeColor,
                      child: colorButton(
                          color: controller.drawColor.value, isStandard: true),
                    );
                  }),
                  InkWell(
                    onTap: controller.onTapChangeStroke,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Obx(() {
                        return Text(
                            '${controller.strokeWidth.value.toStringAsFixed(1)}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16));
                      }),
                    ),
                  ),
                  InkWell(
                    onTap: controller.onTapImportBg,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.onTapForErase,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/eraser.png',
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.clearScreen,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget drawPadOption() {
    return Obx(() {
      switch (controller.showMenu.value) {
        case DrawPadMenu.palette:
          return colorPalette();
        case DrawPadMenu.stroke:
          return slider();
        case DrawPadMenu.none:
          return Container();
      }
    });
  }

  Widget colorPalette() {
    return Container(
      height: 60,
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          itemCount: controller.palette.length,
          itemBuilder: (ctx, i) {
            return colorButton(color: controller.palette[i]);
          },
          separatorBuilder: (ctx, i) {
            return SizedBox(width: 20);
          },
        ),
      ),
    );
  }

  Widget slider() {
    return Obx(() {
      return Container(
        height: 60,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: Colors.black),
        ),
        child: SliderTheme(
          data: SliderTheme.of(Get.context!).copyWith(
            activeTrackColor: Colors.black,
            inactiveTrackColor: Colors.grey,
            trackHeight: 3.0,
            thumbColor: Colors.deepPurple,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
          ),
          child: Slider(
              value: controller.strokeWidth.value,
              min: 1,
              max: 5,
              onChanged: (value) {
                controller.strokeWidth.value = value;
              }),
        ),
      );
    });
  }

  Widget drawPad() {
    return Obx(() {
      if (controller.lines.isEmpty) {
        print(controller.lines);
      }
      return Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(16).copyWith(bottom: 80),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
          child: GestureDetector(
              onPanStart: controller.onDrawStart,
              onPanUpdate: controller.onDrawing,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return CustomPaint(
                  painter: Sketcher(lines: controller.lines),
                );
              })));
    });
  }

  Widget colorButton({required Color color, bool isStandard = false}) {
    return GestureDetector(
      onTap: isStandard ? null : () => controller.colorChange(color),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Obx(() {
          return controller.drawColor.value == color
              ? Icon(Icons.brush, color: Colors.white)
              : SizedBox();
        }),
      ),
    );
  }
}
