
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
          children: [
            appBar(),
            userDrawImage(),
            bottomMenu()
          ],
        ),
      ),
    );
  }
  Widget appBar(){
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: InkWell(
          onTap: () => Get.back(result:controller.drawnLines.value),
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

  Widget userDrawImage(){
    return  Expanded(
        child: Obx((){
          return Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0)),
              child:  Image.file(
                File('${GlobalController.to.filePath}/${controller.drawnLines.value.thumbnailName}.png'),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ));
        }));
  }

  Widget bottomMenu(){
    return  Container(
      height: 70,
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomMenuIcon(Icons.edit,controller.onTapEditCard),
          Obx((){
            return bottomMenuIcon(
                (controller.drawnLines.value.isLock ?? false) == true ?
                Icons.lock_rounded : Icons.lock_open_rounded,controller.onTapLockCard);
          }),
          bottomMenuIcon(Icons.save,controller.onTapSaveCard),
          bottomMenuIcon(Icons.delete,controller.onTapDeleteCard),
        ],
      ),
    );
  }

  Widget bottomMenuIcon(IconData icon,VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.black,
          size: 25,
        ),
      ),
    );
  }
}

