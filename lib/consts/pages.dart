import 'package:drawcard/business_logic/binding/auth_page_binding.dart';
import 'package:drawcard/business_logic/binding/draw_page_binding.dart';
import 'package:drawcard/ui/auth/auth_page.dart';
import 'package:drawcard/ui/auth/login_page.dart';
import 'package:drawcard/ui/splash/splash_page.dart';
import '../ui/drawing/drawing_page.dart';
import 'package:get/get.dart';

class AppPages{
  static List<GetPage> pages = [
    GetPage(
      name : '/splash',
      page: () => SplashPage()
    ),
    GetPage(
      name : '/drawing',
      page: () => DrawingPage(),
      binding: DrawPageBinding()
    ),
    GetPage(
      name : '/auth',
      page: () => AuthPage(),
      binding: AuthPageBinding()
    ),
    GetPage(
        name : '/login',
        page: () => LoginPage()
    )
  ];
}