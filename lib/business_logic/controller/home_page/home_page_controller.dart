import 'dart:io';

import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class HomePageController extends GetxController {

  RxBool isTitleDisplay = false.obs;
  ScrollController scrollController = ScrollController();
  RxList<List<DrawnLine>> drawCards= <List<DrawnLine>>[].obs;
  String? path;

  @override
  void onInit(){
    super.onInit();
    scrollController.addListener(scrollListener);
  }

  @override
  void onReady() async{
    Directory directory = await getApplicationDocumentsDirectory();
    path = directory.path;
  }
  void scrollListener(){
    if((200-scrollController.offset)>kToolbarHeight){
      isTitleDisplay.value = false;
    }else{
      isTitleDisplay.value = true;
    }
  }
}
