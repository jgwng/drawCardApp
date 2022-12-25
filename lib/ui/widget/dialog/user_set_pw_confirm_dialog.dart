import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showUserPwConfirmDialog() async {
  await showDialog(
      context: Get.overlayContext!,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(28, 28, 28, 1.0),
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: AppThemes.pointColor)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  '비밀번호를 설정하세요',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '잠금 설정한 그림은 설정한 비밀번호\n입력을 해야 확인할수 있습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, color: Colors.white.withOpacity(0.35)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () => Get.back(result: false),
                      child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                              )),
                          child: Text(
                            '취소',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    )),
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.back(result: false),
                        child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppThemes.pointColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(6),
                              )),
                          child: Text(
                            '확인',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
