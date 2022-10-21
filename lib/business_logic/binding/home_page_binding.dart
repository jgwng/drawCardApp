import 'package:drawcard/business_logic/controller/home_page/favorite_page_controller.dart';
import 'package:drawcard/business_logic/controller/home_page/home_page_controller.dart';
import 'package:drawcard/business_logic/controller/home_page/recent_page_controller.dart';
import 'package:drawcard/business_logic/controller/home_page/total_page_controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    Get.lazyPut(() => RecentPageController());
    Get.lazyPut(() => TotalPageController());
    Get.lazyPut(() => FavoritePageController());
  }
}
