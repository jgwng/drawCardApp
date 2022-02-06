import 'package:drawcard/business_logic/controller/home_page/recent_page_controller.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/ui/pages/home/dialog/image_delete_dialog.dart';
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
        itemBuilder: (ctx, i) => drawCard,
      ),
    );
  }

  Widget get drawCard {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: Colors.grey, width: 2)),
            child: Image.asset(
              'assets/images/bear_2.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: InkWell(
                onTap: () {
                  Get.dialog(ImageSelectDialog());
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: InkWell(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }


}
