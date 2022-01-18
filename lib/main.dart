import 'package:drawcard/consts/pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.pages,
      initialRoute: '/auth',
    );
  }
}

