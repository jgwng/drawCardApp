import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentPageController extends GetxController {
  RxList<bool> favoriteList = <bool>[false, false, false].obs;
  PageController pageController = PageController(viewportFraction: 0.9);

  @override
  void onInit() {
    // TODO: implement onInit
    print('RecentPageController onInit');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('RecentPageController onReady');
  }

  void toggleFavorite(int index) {
    bool isFavorite = favoriteList[index];
    isFavorite = !isFavorite;
    favoriteList[index] = isFavorite;
  }
}
