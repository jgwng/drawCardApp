import 'dart:io';

import 'package:drawcard/business_logic/controller/home_page/home_page_controller.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/painter/preview_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double fabSize = 60;
  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.mainColor,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: <Widget>[
          //Sliver 1
          Obx(() {
            return SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              elevation: 0,
              backgroundColor: Colors.black,
              centerTitle: false,
              collapsedHeight: kToolbarHeight,
              title: Visibility(
                  visible: controller.isTitleDisplay.isTrue, child: appBar()),
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(top: 130, left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '나만의 그림을',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '재미있게 그려보아요!',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
          //Sliver 2
          Obx(() {
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return drawCardItem(index);
                },
                childCount: controller.drawCards.length + 1,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.only(right: 24),
      child: Text(
        'MYDRAW',
        style: TextStyle(
            color: AppThemes.pointColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget drawCardItem(int index) {
    if (index == 0) {
      return InkWell(
        onTap: () async {
          var newCard = await Get.toNamed(Routes.drawing);
          if (newCard != null) {
            controller.drawCards.add(newCard['lines']);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '새 그림을\n그려볼까요?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.detail, arguments: {
          'drawLines': controller.drawCards[index - 1],
          'imagePath': '${controller.path}/filename.png'
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Image.file(
          File('${controller.path}/filename.png'),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
