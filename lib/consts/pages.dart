import 'package:drawcard/business_logic/binding/auth_page_binding.dart';
import 'package:drawcard/business_logic/binding/draw_page_binding.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/ui/auth/auth_page.dart';
import 'package:drawcard/ui/auth/login_page.dart';
import 'package:drawcard/ui/coloring/coloring_sample_page.dart';
import 'package:drawcard/ui/home/home_page.dart';
import 'package:drawcard/ui/splash/splash_page.dart';
import '../ui/drawing/drawing_page.dart';
import 'package:get/get.dart';

class AppPages{
  static List<GetPage> pages = [
    GetPage(
      name : Routes.splash,
      page: () => SplashPage()
    ),
    GetPage(
      name : Routes.drawing,
      page: () => DrawingPage(),
      binding: DrawPageBinding()
    ),
    GetPage(
      name : Routes.auth,
      page: () => AuthPage(),
      binding: AuthPageBinding()
    ),
    GetPage(
        name : Routes.login,
        page: () => LoginPage()
    ),
    GetPage(
        name : Routes.home,
        page: () =>HomePage()
    ),
    GetPage(
        name : Routes.imageSelect,
        page: () =>ImageSelectPage()
    )
  ];
}