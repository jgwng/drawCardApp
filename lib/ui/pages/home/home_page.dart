import 'package:drawcard/business_logic/controller/home_page/home_page_controller.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/ui/mixin/tabbar_mixin.dart';
import 'package:drawcard/ui/pages/home/views/favorite_view.dart';
import 'package:drawcard/ui/pages/home/views/recent_view.dart';
import 'package:drawcard/ui/pages/home/views/total_view.dart';
import 'dialog/menu_select_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin,TabBarMixin{

  double fabSize = 60;
  final controller = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250,
                  alignment : Alignment.centerLeft,
                  child: TabBar(
                    indicatorColor: Colors.black,
                    controller: controller.tabController,
                    tabs: [
                      menuTab('최근',50),
                      menuTab('북마크',50),
                      menuTab('전체',50),
                    ],
                    unselectedLabelStyle: AppThemes.textTheme.bodyText1!.copyWith(
                      color: Colors.grey[400]
                    ),
                    labelStyle: AppThemes.textTheme.bodyText1,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[400],
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,),
                      onPressed: () => Get.toNamed(Routes.setting))
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: controller.pages,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: fabSize,
        height: fabSize,
        child: FittedBox(
          child:  FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: (){
              Get.dialog(MenuSelectDialog(),barrierDismissible : false,
                  barrierColor:null,
                  useSafeArea: true
              );
            },
            child: Icon(Icons.add_rounded,size: 40),
          ),
        ),
      ),
    );
  }

}