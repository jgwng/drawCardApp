import 'package:drawcard/business_logic/controller/home_page/recent_page_controller.dart';
import 'package:get/get.dart';

class RecentPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RecentPageController());
  }

}