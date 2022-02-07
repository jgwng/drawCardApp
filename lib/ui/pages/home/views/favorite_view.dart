import 'package:drawcard/business_logic/controller/home_page/favorite_page_controller.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/ui/pages/home/widget/draw_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteView extends GetView<FavoritePageController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: Obx((){
          if(controller.items.isEmpty){
            return emptyView;
          }
          return GridView.count(
              crossAxisCount:2,
              childAspectRatio: 5/10,
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 5.0,
              shrinkWrap: true,
              children: List.generate(controller.items.length, (index){
                return favoriteListItem(index);
              })
          );
        }),
      ),
    );
  }

  Widget favoriteListItem(int index){
    return PreviewDrawCard(
      isFavorite: true,
      isBookMark: true,
      imageAddress:  'assets/images/bear_2.png',
      onToggleFavorite: () => controller.items.removeAt(index)
    );
  }

  Widget get emptyView{
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 80),
      child : Text('북마크한 그림이 없습니다',
      style: AppThemes.textTheme.bodyText1,
      textAlign: TextAlign.center,)
    );
  }


}
