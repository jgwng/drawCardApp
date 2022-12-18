import 'package:drawcard/business_logic/model/user_picture.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool isTitleDisplay = false.obs;
  ScrollController scrollController = ScrollController();
  RxList<UserPicture> drawCards = <UserPicture>[].obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if ((200 - scrollController.offset) > kToolbarHeight) {
      isTitleDisplay.value = false;
    } else {
      isTitleDisplay.value = true;
    }
  }

  void onTapDrawNewCard() async{
    var newCard = await Get.toNamed(Routes.drawing);
    if (newCard != null) {
      drawCards.add(newCard);
    }
  }

  void onTapDetailDrawCard(int index) async{
    var userCard = await Get.toNamed(Routes.detail,arguments: {'userCard' : drawCards[index-1]});
  }
}
