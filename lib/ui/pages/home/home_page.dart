import 'package:drawcard/business_logic/controller/home_page/home_page_controller.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/ui/mixin/tabbar_mixin.dart';
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
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey[300],
                        child: Container(
                          width: 30,
                          height: 30,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('aaaaaaa님',style: AppThemes.textTheme.bodyText1,),
                          SizedBox(height: 8,),
                          Text('새로운 그림을 그려보세요!',style: AppThemes.textTheme.subtitle2!.copyWith(color:Colors.grey),),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black,),
                      onPressed: () => Get.toNamed(Routes.setting))

                ],
              ),
            ),
            SizedBox(height: 20,),
            Divider(
              color: Colors.grey[400],
              height: 1,
              thickness: 1,
            ),
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