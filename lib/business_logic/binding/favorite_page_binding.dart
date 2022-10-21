import 'package:drawcard/business_logic/controller/home_page/favorite_page_controller.dart';
import 'package:get/get.dart';

class FavoritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoritePageController());
  }
}
