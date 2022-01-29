import 'package:drawcard/business_logic/controller/home_page/favorite_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FavoriteView extends GetView<FavoritePageController>{
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue,
      child: Text('${controller.currentValue}'),);
  }
}
