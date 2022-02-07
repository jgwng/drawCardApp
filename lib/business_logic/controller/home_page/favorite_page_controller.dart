import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePageController extends GetxController{

  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  RxBool currentValue = false.obs;
  RxList<int> items = <int>[1,2,3].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('FavoritePageController onInit');
  }


  @override
  void onReady(){
    super.onReady();
    currentValue.value = true;
    print('FavoritePageController onReady');
  }

}