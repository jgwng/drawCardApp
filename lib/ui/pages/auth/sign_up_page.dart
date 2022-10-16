import 'package:drawcard/business_logic/controller/auth_page/sign_up_controller.dart';
import 'package:drawcard/ui/widget/draw_pad_button.dart';
import 'package:drawcard/ui/widget/draw_pad_tft.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: WillPopScope(
        onWillPop: () {
          Get.focusScope?.unfocus();
          Get.back();
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomScrollView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SizedBox(),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.only(top: 20),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '간편하게 가입하고\n기다리고 있는 클럽원들\n만나러 가세요!',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60, bottom: 40),
                            child: Form(
                              key: controller.emailKey,
                              child: DrawPadTFT(
                                controller: controller.emailController,
                                node: controller.emailNode,
                                validator: controller.emailValidator,
                                onFieldSubmitted: (String? email) async {
                                  await controller.emailCheck();
                                },
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Form(
                              key: controller.pwKey,
                              child: DrawPadTFT(
                                controller: controller.pwController,
                                node: controller.pwNode,
                                validator: controller.validatePassword,
                                isPW: true,
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: DrawPadTFT(
                              controller: controller.mobileController,
                              node: controller.mobileNode,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Form(
                            key: controller.nicknameKey,
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 40),
                                child: DrawPadTFT(
                                  controller: controller.nicknameController,
                                  node: controller.nicknameNode,
                                  validator: controller.nicknameValidator,
                                )),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: Text('* 핸드폰번호는 선택사항입니다.',
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  DrawPadButton(
                    btnText: '회원 가입',
                    onTap: controller.onTapRegUser,
                    isReady: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
