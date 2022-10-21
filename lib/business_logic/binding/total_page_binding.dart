import 'package:drawcard/business_logic/controller/home_page/total_page_controller.dart';
import 'package:get/get.dart';

class TotalPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TotalPageController());
  }
}
