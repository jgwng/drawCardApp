import 'package:drawcard/business_logic/model/user_picture.dart';
import 'package:drawcard/consts/routes.dart';
import 'package:drawcard/ui/widget/bottom_sheet/select_yn_bottom_sheet.dart';
import 'package:drawcard/ui/widget/bottom_sheet/user_pw_setting_bottom_sheet.dart';
import 'package:get/get.dart';

class DrawDetailController extends GetxController {
  Rx<UserPicture> drawnLines = UserPicture().obs;
  String? filePath;
  @override
  void onInit() {
    super.onInit();
    drawnLines.value = Get.arguments?['userCard'] ?? UserPicture();
  }

  void onTapEditCard() async {
    var userCard = await Get.toNamed(Routes.drawing,
        arguments: {'userCard': drawnLines.value});
    if (userCard != null) {
      drawnLines.value = userCard;
      drawnLines.refresh();
    }
  }

  void onTapSaveCard() {}

  void onTapLockCard() async{
    bool isUser = true;
    if((drawnLines.value.isLock ?? false) == false){
      isUser = await showUserPWConfirmBottomSheet() ?? false;
    }

    if(isUser == true){
      drawnLines.value.isLock = !(drawnLines.value.isLock ?? false);
      drawnLines.refresh();
    }


  }

  void onTapDeleteCard() async {
    bool? result = await showYNSelectorBottomSheet(
        title: '그림을 삭제할까요?',
        content: '지금 그림을 삭제하시면,\n해당 그림은 복원하실수 없어요.',
        leftBtnText: '취소',
        rightBtnText: '삭제');
    if (result == true) {
      Get.back(result: {'delete': true});
    }
  }
}
