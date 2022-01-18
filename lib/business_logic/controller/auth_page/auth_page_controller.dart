import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPageController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;

  static AuthPageController get to => Get.find<AuthPageController>();




  @override
  void onInit(){
    super.onInit();
    tabController = TabController(
      vsync: this,
      length: 2
    );
  }



}