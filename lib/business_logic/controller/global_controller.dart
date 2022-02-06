import 'dart:ui';

import 'package:get/get.dart';

class GlobalController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(window.physicalSize);
  }
}