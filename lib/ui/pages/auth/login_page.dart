import 'package:drawcard/business_logic/controller/auth_page/login_controller.dart';
import 'package:drawcard/ui/widget/draw_pad_button.dart';
import 'package:drawcard/ui/widget/draw_pad_tft.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      '연습장',
                      style: TextStyle(
                          fontSize: 28,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '나만의 그림을 그리기 위해 로그인 해주세요.',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                DrawPadTFT(
                    controller: controller.emailController,
                    node: controller.emailNode),
                const SizedBox(height: 40),
                DrawPadTFT(
                    controller: controller.pwController,
                    isPW: true,
                    node: controller.pwNode),
                const SizedBox(height: 40),
                loginButton(title: '로그인'),
                const SizedBox(
                  height: 10,
                ),
                loginButton(title: '회원가입'),
                const SizedBox(
                  height: 10,
                ),
                loginButton(title: '테스트',isTest: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton({required String title,bool isTest = false}) {
    return DrawPadButton(
      onTap: (isTest) ? controller.onTapForTest : controller.login,
      isReady: true,
      btnText: title,
      bottomMargin: 0,
    );
  }

  Widget bottomButton({required String title, required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
