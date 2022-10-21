import 'package:drawcard/business_logic/binding/auth_page_binding.dart';
import 'package:drawcard/business_logic/binding/draw_page_binding.dart';
import 'package:drawcard/business_logic/binding/favorite_page_binding.dart';
import 'package:drawcard/business_logic/binding/home_page_binding.dart';
import 'package:drawcard/business_logic/binding/login_binding.dart';
import 'package:drawcard/business_logic/binding/recent_page_binding.dart';
import 'package:drawcard/business_logic/binding/sign_up_binding.dart';
import 'package:drawcard/business_logic/binding/total_page_binding.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/ui/pages/auth/sign_up_page.dart';
import 'package:drawcard/ui/pages/drawing/drawing_page.dart';
import 'package:drawcard/ui/pages/home/home_page.dart';
import 'package:drawcard/ui/pages/pixel/pixel_art.dart';
import 'package:drawcard/ui/pages/splash/splash_page.dart';
import '../ui/pages/auth/login_page.dart';
import '../ui/pages/coloring/coloring_sample_page.dart';
import '../ui/pages/setting/setting_page.dart';
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
      name : Routes.signUp,
      page: () => SignUpPage(),
      binding: SignUpBinding()
    ),
    GetPage(
        name : Routes.login,
        binding: LoginBindings(),
        page: () => LoginPage()
    ),
    GetPage(
        name : Routes.home,
        binding: HomePageBinding(),
        page: () =>HomePage()
    ),
    GetPage(
        name : Routes.imageSelect,
        page: () =>ImageSelectPage()
    ),
    GetPage(
        name : Routes.setting,
        page: () =>SettingPage()
    ),
    GetPage(
        name : Routes.pixelArt,
        page: () => PixelArt()
    ),
  ];
}