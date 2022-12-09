import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {

  RxBool isTitleDisplay = false.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit(){
    super.onInit();
    scrollController.addListener(scrollListener);
  }
  void scrollListener(){
    if((200-scrollController.offset)>kToolbarHeight){
      isTitleDisplay.value = false;
    }else{
      isTitleDisplay.value = true;
    }
  }
}
