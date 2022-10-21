import 'package:drawcard/consts/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode pwNode = FocusNode();

  void login() async {
    if (emailController.text.isEmpty) {}

    if (pwController.text.isEmpty) {}
  }

  void onTapForTest() async {
    Get.offAndToNamed(Routes.home);
  }
}
