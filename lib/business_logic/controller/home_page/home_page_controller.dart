import 'package:drawcard/ui/pages/home/views/favorite_view.dart';
import 'package:drawcard/ui/pages/home/views/recent_view.dart';
import 'package:drawcard/ui/pages/home/views/total_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with GetTickerProviderStateMixin{

  late TabController tabController;
  late List<Widget> pages;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 3,vsync: this);
    pages =[
      RecentView(),
      FavoriteView(),
      TotalView(),
    ];
  }



}