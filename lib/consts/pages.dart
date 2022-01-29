import 'package:drawcard/business_logic/binding/auth_page_binding.dart';
import 'package:drawcard/business_logic/binding/draw_page_binding.dart';
import 'package:drawcard/business_logic/binding/favorite_page_binding.dart';
import 'package:drawcard/business_logic/binding/home_page_binding.dart';
import 'package:drawcard/business_logic/binding/recent_page_binding.dart';
import 'package:drawcard/business_logic/binding/total_page_binding.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/ui/pages/drawing/drawing_page.dart';
import 'package:drawcard/ui/pages/home/home_page.dart';
import 'package:drawcard/ui/pages/home/views/favorite_view.dart';
import 'package:drawcard/ui/pages/home/views/recent_view.dart';
import 'package:drawcard/ui/pages/home/views/total_view.dart';
import 'package:drawcard/ui/pages/splash/splash_page.dart';
import '../ui/pages/auth/auth_page.dart';
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
        name : Routes.total,
        binding: TotalPageBinding(),
        page: () =>TotalView()
    ),
    GetPage(
        name : Routes.recent,
        binding: RecentPageBinding(),
        page: () =>RecentView()
    ),
    GetPage(
        name : Routes.favorite,
        binding: FavoritePageBinding(),
        page: () =>FavoriteView()
    )
  ];
}