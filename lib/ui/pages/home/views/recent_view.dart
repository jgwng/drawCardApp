import 'package:drawcard/business_logic/controller/home_page/recent_page_controller.dart';
import 'package:drawcard/ui/pages/home/widget/draw_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentView extends GetView<RecentPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody,
    );
  }

  Widget get buildBody {
    return Container(
      alignment: Alignment.center,
      child: PageView.builder(
        controller: controller.pageController,
        itemCount: 3,
        itemBuilder: (ctx, i) => drawCard(i),
      ),
    );
  }

  Widget drawCard(int index) {
    return Obx((){
      return PreviewDrawCard(
        imageAddress:  'assets/images/bear_2.png',
        onToggleFavorite: () => controller.toggleFavorite(index),
        isFavorite: controller.favoriteList[index],
      );
    });
  }
}
