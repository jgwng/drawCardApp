import 'package:drawcard/business_logic/controller/auth_page/auth_page_controller.dart';
import 'package:drawcard/ui/auth/widget/auth_tft.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //닉네임
              AuthTFT(labelText : '닉네임', controller: TextEditingController(),),
              SizedBox(height: 50,),
              // 비밀번호
              AuthTFT(labelText : '이메일', controller: TextEditingController(),),
              SizedBox(height: 50,),
              // 비밀번호
              AuthTFT(labelText : '비밀번호', controller: TextEditingController(),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(height: 1,thickness: 1,color: Colors.grey[300],),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 60,
                  width: Get.width,
                  alignment: Alignment.center,
                  color: Colors.grey[200],
                  child: Text('회원가입',style: TextStyle(
                      fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                  ),),
                ),
              ),
              SizedBox(height:30),
              RichText(
                text: TextSpan(text:'이미 회원가입을 하셨나요?',
                    style: TextStyle(color: Colors.black,fontSize: 10),
                    children:[
                      TextSpan(text: '로그인하기', recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          AuthPageController.to.tabController.index = 0;
                        }),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

}