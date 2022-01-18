import 'package:drawcard/business_logic/controller/auth_page/auth_page_controller.dart';
import 'package:get/get.dart';

class AuthPageBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(AuthPageController());
  }
}