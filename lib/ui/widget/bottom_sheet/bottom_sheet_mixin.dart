import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin BottomSheetMixin {
  Widget header({required String title, VoidCallback? onTapCloseSheet}) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey[300],
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
                child: Text(title, style: const TextStyle(fontSize: 20)),
              )),
          SizedBox(
            width: 60,
            height: 60,
            child: InkWell(
              onTap: onTapCloseSheet ?? Get.back,
              child: const Icon(Icons.close, size: 24),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomMenuButton<T>(T value, String text) {
    return InkWell(
      onTap: () => Get.back(result: value),
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
