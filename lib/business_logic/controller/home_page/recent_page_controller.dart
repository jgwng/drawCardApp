import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentPageController extends GetxController{

  RxBool currentValue = false.obs;
  PageController pageController = PageController(
    viewportFraction: 0.9
  );

  @override
  void onInit() {
    // TODO: implement onInit
    print('RecentPageController onInit');
    super.onInit();

  }


  @override
  void onReady(){
    super.onReady();
    currentValue.value = true;
    print('RecentPageController onReady');
  }

}