import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSelectDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                '정말 그림을 삭제하시겠습니까?',
                style: AppThemes.textTheme.headline1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15,bottom: 30),
              child: Text(
                '삭제된 그림은 복원할 수 없습니다.',
                style: AppThemes.textTheme.subtitle2!.copyWith(
                    color: Colors.grey
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: [
                dialogButton('예',true),
                dialogButton('아니오',false)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget dialogButton(String text,bool isDelete){
    return Expanded(
      child: InkWell(
        onTap: () =>Get.back(result: isDelete),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: (isDelete) ? Colors.transparent : Colors.black,
                      width: 1
                  )
              )),
          alignment: Alignment.center,
          child: Text(text,style: AppThemes.textTheme.bodyText1,),
        ),
      ),
    );
  }
}