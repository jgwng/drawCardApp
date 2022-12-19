import 'dart:io';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class GlobalController extends GetxController {
  String? filePath;

  static GlobalController get to {
    return Get.find<GlobalController>();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(window.physicalSize);
  }

  @override
  void onReady() async {
    Directory directory = await getApplicationDocumentsDirectory();
    filePath = directory.path;
  }
}
