import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/ui/widget/drawing_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DrawingAppBar(
        title: '설정',
        actionButton: InkWell(
          onTap: () => Get.back(),
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 15),
            child: Text(
              '저장',
              style: AppThemes.textTheme.bodyText1,
            ),
          ),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "*캐릭터를 눌러서 이미지를 변경해 보아요!",
                    style: AppThemes.textTheme.subtitle2!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                ],
              ),
              SizedBox(
                height: 20,
                child: Container(
                  color: Colors.grey[200],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '닉네임',
                          style: AppThemes.textTheme.bodyText1,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: TextFormField(),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text('이메일', style: AppThemes.textTheme.bodyText1),
                        SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Text(
                            'gunwng123@gmail.com',
                            textAlign: TextAlign.right,
                            style: AppThemes.textTheme.bodyText1,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Container(
                  color: Colors.grey[200],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text('로그아웃', style: AppThemes.textTheme.bodyText1),
                    ),
                    Container(
                      height: 12,
                      width: 1,
                      color: Colors.black,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child:
                          Text('회원 탈퇴', style: AppThemes.textTheme.bodyText1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
