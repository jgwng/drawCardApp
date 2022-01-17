import '../controller/draw_page/draw_page_controller.dart';
import 'package:get/get.dart';

class DrawPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DrawPageController());
  }

}