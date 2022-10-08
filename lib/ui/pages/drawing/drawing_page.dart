import 'package:drawcard/business_logic/controller/draw_page/draw_page_controller.dart';
import 'package:drawcard/painter/sketcher.dart';
import 'package:drawcard/ui/widget/expand_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DrawingPage extends GetView<DrawPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: drawPad(),
                )
              ],
            ),
            Obx(() {
              return Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ExpandedSection(
                      expand: controller.isEraseMode.value,
                      child: GestureDetector(
                        onTap: () => controller.toggleEraseMode(),
                        child: Container(
                          height: 60,
                          width: Get.width,
                          margin: EdgeInsets.symmetric(horizontal: 12)
                              .copyWith(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: Colors.red),
                          ),
                          child: Center(
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              scrollDirection: Axis.horizontal,
                              physics: ClampingScrollPhysics(),
                              itemCount: controller.palette.length,
                              itemBuilder: (ctx, i) {
                                return colorButton(
                                    color: controller.palette[i]);
                              },
                              separatorBuilder: (ctx, i) {
                                return SizedBox(width: 20);
                              },
                            ),
                          ),
                        ),
                      ),
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
                              onTap: () => controller.toggleEraseMode(),
                              child: colorButton(
                                  color: controller.drawColor.value,
                                  isStandard: true),
                            );
                          }),
                          InkWell(
                            onTap: () => controller.clearScreen(),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white, shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 25 ,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                  color: Colors.white, shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 25 ,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.clearScreen(),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white, shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/eraser.png',
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.clearScreen(),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white, shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 25 ,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget colorPalette(){
    return GestureDetector(
      onTap: () => controller.toggleEraseMode(),
      child: Container(
        height: 60,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 12)
            .copyWith(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: Colors.red),
        ),
        child: Center(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            itemCount: controller.palette.length,
            itemBuilder: (ctx, i) {
              return colorButton(
                  color: controller.palette[i]);
            },
            separatorBuilder: (ctx, i) {
              return SizedBox(width: 20);
            },
          ),
        ),
      ),
    );
  }

  Widget slider(){
    return Obx((){
      return  Container(
        height: 60,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 12)
            .copyWith(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: Colors.red),
        ),
        child: SliderTheme(
          data: SliderTheme.of(Get.context!).copyWith(
            activeTrackColor: Colors.red,
            inactiveTrackColor: Colors.blue,
            trackHeight: 3.0,
            thumbColor: Colors.yellow,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
          ),
          child: Slider(
              value: controller.radius.value,
              min: 2,
              max: 10,
              onChanged: (value) {
                controller.radius.value = value;
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
          margin: EdgeInsets.all(12.0).copyWith(bottom: 80),
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
