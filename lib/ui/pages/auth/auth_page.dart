import 'package:drawcard/business_logic/controller/auth_page/auth_page_controller.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/ui/mixin/tabbar_mixin.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends GetView<AuthPageController> with TabBarMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('연습장'),
                ),
                SizedBox(
                  width: 200,
                  child: TabBar(
                    tabs: [
                      menuTab('로그인', 80),
                      menuTab('회원가입', 80),
                    ],
                    unselectedLabelStyle: AppThemes.textTheme.bodyText1!
                        .copyWith(color: Colors.grey[400]),
                    labelStyle: AppThemes.textTheme.bodyText1,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[400],
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [LoginPage(), SignUpPage()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
