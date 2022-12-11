import 'package:drawcard/business_logic/controller/detail_page/draw_detail_controller.dart';
import 'package:get/get.dart';

class DrawDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DrawDetailController());
  }
}