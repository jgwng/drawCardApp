import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin BottomSheetMixin {
  Widget header({required String title, VoidCallback? onTapCloseSheet}) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const SizedBox(
            width: 60,
            height: 60,
          ),
          Expanded(
              child: Container(
                height: 60,
                alignment: Alignment.center,
                child: Text(title, style: const TextStyle(fontSize: 20,color: Colors.white)),
              )),
          SizedBox(
            width: 60,
            height: 60,
            child: InkWell(
              onTap: onTapCloseSheet ?? Get.back,
              child: const Icon(Icons.close, size: 24,
              color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomMenuButton<T>(T value, String text,bool isLast) {
    return InkWell(
      onTap: () => Get.back(result: value),
      child: Container(
        height: 60,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppThemes.mainColor,
          border: Border(
            bottom: BorderSide(
              color: (isLast) ? Colors.transparent : Colors.grey.withOpacity(0.5),

            )
          )
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
          color: Colors.white),
        ),
      ),
    );
  }
}
