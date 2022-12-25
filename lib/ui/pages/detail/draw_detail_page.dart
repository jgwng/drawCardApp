import 'dart:io';

import 'package:drawcard/business_logic/controller/detail_page/draw_detail_controller.dart';
import 'package:drawcard/business_logic/controller/global_controller.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawDetailPage extends GetView<DrawDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.mainColor,
      body: SafeArea(
        child: Column(
          children: [appBar(), userDrawImage(), bottomMenu()],
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: InkWell(
          onTap: () => Get.back(result: controller.drawnLines.value),
          child: Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 30,
              ))),
    );
  }

  Widget userDrawImage() {
    return Expanded(child: Obx(() {
      return Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
          child: Image.file(
            File(
                '${GlobalController.to.filePath}/${controller.drawnLines.value.thumbnailName}.png'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ));
    }));
  }

  Widget bottomMenu() {
    return Container(
      height: 70,
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomMenuIcon(icon: Icons.edit, onTap: controller.onTapEditCard),
          Obx(() {
            return bottomMenuIcon(
                icon: (controller.drawnLines.value.isLock ?? false) == true
                    ? Icons.lock_rounded
                    : Icons.lock_open_rounded,
                onTap: controller.onTapLockCard,
                isLockIcon: true);
          }),
          bottomMenuIcon(icon: Icons.save, onTap: controller.onTapSaveCard),
          bottomMenuIcon(icon: Icons.delete, onTap: controller.onTapDeleteCard),
        ],
      ),
    );
  }

  Widget bottomMenuIcon(
      {required IconData icon,
      required VoidCallback onTap,
      bool isLockIcon = false}) {
    return Obx(() {
      bool isImageLock = controller.drawnLines.value.isLock ?? false;
      bool isLock = isImageLock && isLockIcon;
      return InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border:
                  Border.all(color: isLock ? Colors.transparent : Colors.black),
              color: isLock ? AppThemes.pointColor : Colors.white,
              shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: isLock ? Colors.white : Colors.black,
            size: 25,
          ),
        ),
      );
    });
  }
}
