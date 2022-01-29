import 'package:get/get.dart';

class RecentPageController extends GetxController{

  RxBool currentValue = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    print('RecentPageController onInit');
    super.onInit();

  }


  @override
  void onReady(){
    super.onReady();
    currentValue.value = true;
    print('RecentPageController onReady');
  }

}