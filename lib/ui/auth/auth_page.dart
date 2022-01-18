import 'package:drawcard/business_logic/controller/auth_page/auth_page_controller.dart';
import 'package:drawcard/ui/auth/login_page.dart';
import 'package:drawcard/ui/auth/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends GetView<AuthPageController>{

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
                      authTab('로그인'),
                      authTab('회원가입'),
                    ],
                    indicator: BoxDecoration(
                      gradient: LinearGradient(  //배경 그라데이션 적용
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.blueAccent,
                          Colors.pinkAccent,
                        ],
                      ),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    controller: controller.tabController,
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  LoginPage(),
                  SignUpPage()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget authTab(String title){
    return Container(
      height: 80,
      alignment: Alignment.center,
      child: Text(
        title,
      ),
    );
  }
}