import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode mobileNode = FocusNode();
  FocusNode nicknameNode = FocusNode();
  FocusNode pwNode = FocusNode();

  final emailKey = GlobalKey<FormState>();
  final mobileKey = GlobalKey<FormState>();
  final nicknameKey = GlobalKey<FormState>();
  final pwKey = GlobalKey<FormState>();

  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // 숫자 1개 포함 && 8자리 이상
  RegExp pwRegex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  @override
  void onInit() {
    super.onInit();
  }

  String? nicknameValidator(String? text) {
    if (text == null || text.isEmpty) {
      return '닉네임을 입력하세요!';
    } else if (text.length < 2) {
      return '최소 2자 이상 작성해 주세요!';
    }

    return null;
  }

  String? emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return '이메일을 입력하세요!';
    } else if (!emailRegex.hasMatch(text)) {
      return '이메일 양식을 확인해주세요';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요!';
    } else {
      if (!pwRegex.hasMatch(value)) {
        return '영문자&숫자 1개 이상 포함 & 8자리 이상이여야 합니다.';
      } else {
        return null;
      }
    }
  }

  Future<void> emailCheck() async {}

  void onTapRegUser() async {}
}
