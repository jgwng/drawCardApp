import 'dart:io';

import 'package:drawcard/business_logic/controller/global_controller.dart';
import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:drawcard/ui/widget/bottom_sheet/select_yn_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DrawDetailController extends GetxController{

  List<DrawnLine> drawnLines = [];
  RxBool isLock = false.obs;
  String? filePath;
  @override
  void onInit(){
    super.onInit();
    drawnLines = Get.arguments['drawLines'] ?? [];
  }

  @override
  void onReady() async {
    filePath = GlobalController.to.filePath;
    print(filePath);
  }

  void onTapEditCard(){

  }

  void onTapSaveCard(){

  }

  void onTapLockCard(){
    isLock.toggle();
  }

  void onTapDeleteCard() async{
    bool? result = await showYNSelectorBottomSheet(
        title: '그림을 삭제할까요?',
        content: '지금 그림을 삭제하시면,\n해당 그림은 복원하실수 없어요.',
        leftBtnText: '취소',
        rightBtnText: '삭제'
    );
    if(result == true){
      Get.back(result: {'delete' : true});
    }
  }



}