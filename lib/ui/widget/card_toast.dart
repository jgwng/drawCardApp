import 'dart:async';
import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardToast {
  static void show({required String msg, int seconds = 2}) async {
    OverlayEntry _overlay = OverlayEntry(builder: (_) => Toast(msg: msg));
    Overlay.of(Get.overlayContext!)!.insert(_overlay);
    await Future.delayed(Duration(seconds: seconds));
    _overlay.remove();
  }
}

class Toast extends StatelessWidget {
  const Toast({Key? key, required this.msg}) : super(key: key);
  final String? msg;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.width,
      child: Container(
        decoration: BoxDecoration(
          color: AppThemes.pointColor,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 16,
              color: AppThemes.mainColor,
            ),
            child: Text(
              msg ?? '',
              softWrap: true,
            )),
      ),
    );
  }
}
