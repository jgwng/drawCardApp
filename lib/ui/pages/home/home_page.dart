import 'package:drawcard/business_logic/controller/home_page/home_page_controller.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/ui/pages/home/widget/draw_preview_card.dart';
import 'dialog/menu_select_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin{
  double fabSize = 60;
  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.mainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MYDRAW',
                    style: TextStyle(
                        color: AppThemes.pointColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  // InkWell(
                  //   onTap: () => Get.toNamed(Routes.setting),
                  //   child: SizedBox(
                  //     width: 40,
                  //     height: 40,
                  //     child: Icon(
                  //       Icons.settings,
                  //       size: 24,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // )
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
            onPressed: () async{
              await Get.toNamed(Routes.drawing);
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
