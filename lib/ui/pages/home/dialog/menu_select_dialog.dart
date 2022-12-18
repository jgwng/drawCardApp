import 'package:drawcard/consts/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuSelectDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.transparent,
                height: 60,
                child: Text(
                  '메뉴를 선택하세요',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    menuItem('스케치'),
                    SizedBox(
                      width: 40,
                    ),
                    menuItem('컬러링')
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Get.back(),
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    '닫기',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(String title) {
    String? route;
    String? imageAddress;
    if (title == '스케치') {
      route = Routes.drawing;
      imageAddress = 'drawing.png';
    } else {
      route = Routes.coloring;
      imageAddress = 'coloring.png';
    }
    return Expanded(
        child: GestureDetector(
      onTap: () => Get.offAndToNamed(route!),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$imageAddress',
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    ));
  }
}
