import 'package:drawcard/business_logic/model/user_picture.dart';
import 'package:drawcard/ui/widget/bottom_sheet/select_yn_bottom_sheet.dart';
import 'package:get/get.dart';

class DrawDetailController extends GetxController{

  UserPicture drawnLines = UserPicture();
  RxBool isLock = false.obs;
  String? filePath;
  @override
  void onInit(){
    super.onInit();
    drawnLines = Get.arguments?['userCard'] ?? UserPicture();
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