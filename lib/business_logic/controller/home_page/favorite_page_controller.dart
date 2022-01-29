import 'package:get/get.dart';

class FavoritePageController extends GetxController{

  RxBool currentValue = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('FavoritePageController onInit');
  }


  @override
  void onReady(){
    super.onReady();
    currentValue.value = true;
    print('FavoritePageController onReady');
  }

}