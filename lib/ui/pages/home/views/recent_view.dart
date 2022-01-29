import 'package:drawcard/business_logic/controller/home_page/recent_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentView extends GetView<RecentPageController>{
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: Text('${controller.currentValue.toString()}'),
      );
    });
  }

}