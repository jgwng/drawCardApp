import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//앱 시작하기전 초기 세팅 해주는 함수
Future<void> initAppSetting() async{

  // 서버나 SharedPreferences 등 비동기로 데이터를 다룬 다음 runApp을 실행해야하는 경우
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance!.resamplingEnabled = false;

}