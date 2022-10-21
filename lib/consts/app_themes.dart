import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color mainColor = Color(0xFF8D6E63);
  static const Color pointColor = Color(0xFFF57C00);
  static const Color inActiveColor = Color.fromRGBO(174, 174, 174, 1.0);
  static const Color defaultTextColor = Color.fromRGBO(47, 46, 51, 1.0);

  static const TextTheme textTheme = TextTheme(
      headline1: TextStyle(
          fontFamily: "SpoqaHanSansNeo",
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 20),
      headline2: TextStyle(
          fontFamily: "SpoqaHanSansNeo",
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 22),
      subtitle1: TextStyle(
          fontFamily: "SpoqaHanSansNeo",
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 18),
      subtitle2: TextStyle(
          fontFamily: "SpoqaHanSansNeo",
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14),
      bodyText1: TextStyle(
          fontFamily: "SpoqaHanSansNeo",
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16),
      bodyText2: TextStyle(
          fontFamily: "SpoqaHanSansNeo",
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 12));
}

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffce5641), //10%
      100: const Color(0xffb74c3a), //20%
      200: const Color(0xffa04332), //30%
      300: const Color(0xff89392b), //40%
      400: const Color(0xff733024), //50%
      500: const Color(0xff5c261d), //60%
      600: const Color(0xff451c16), //70%
      700: const Color(0xff2e130e), //80%
      800: const Color(0xff170907), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
