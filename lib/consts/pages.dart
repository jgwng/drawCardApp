import 'package:drawcard/business_logic/binding/draw_page_binding.dart';
import 'package:drawcard/ui/drawing_page.dart';
import 'package:get/get.dart';

class AppPages{
  static List<GetPage> pages = [
    GetPage(
      name : '/drawing_page',
      page: () => DrawingPage(),
      binding: DrawPageBinding()
    )
  ];
}