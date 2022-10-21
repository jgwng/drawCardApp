import 'package:drawcard/business_logic/controller/home_page/home_page_controller.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/ui/mixin/tabbar_mixin.dart';
import 'package:drawcard/ui/pages/home/widget/draw_preview_card.dart';
import 'dialog/menu_select_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, TabBarMixin {
  double fabSize = 60;
  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '드로잉북',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 24,
                        color: Colors.white,
                      ),
                      onPressed: () => Get.toNamed(Routes.setting))
                ],
              ),
            ),
            Expanded(
              child: PreviewDrawCard(),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: fabSize,
        height: fabSize,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              // Get.toNamed(Routes.pixelArt);
              Get.dialog(MenuSelectDialog(),
                  barrierDismissible: false,
                  barrierColor: null,
                  useSafeArea: true);
            },
            child: Icon(
              Icons.add_rounded,
              size: 40,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
