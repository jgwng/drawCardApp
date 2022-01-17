import 'package:drawcard/ui/auth/widget/auth_tft.dart';
import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }

}