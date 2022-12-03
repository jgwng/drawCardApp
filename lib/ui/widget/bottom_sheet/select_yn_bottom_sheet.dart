import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/ui/widget/bottom_sheet/bottom_sheet_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool?> showYNSelectorBottomSheet(
    {required String title, String? content, String? leftBtnText,String? rightBtnText}) async {
  final result = await Get.bottomSheet(YNSelectorBottomSheet(
    title: title,
    content: content ?? '',
    leftBtnText: leftBtnText ?? '취소',
    rightBtnText: rightBtnText ?? '확인',
  ));
  if (result != null) return result;
  return null;
}

class YNSelectorBottomSheet extends StatelessWidget with BottomSheetMixin {
  const YNSelectorBottomSheet(
      {Key? key,
        required this.title,
        required this.content,
        required this.leftBtnText,required this.rightBtnText})
      : super(key: key);
  final String title;
  final String content;
  final String leftBtnText;
  final String rightBtnText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
          color: Color.fromRGBO(28, 28, 28, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 40,),
          Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),),
          SizedBox(height: 20,),
          Text(content,style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),),
          Spacer(),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                    onTap: () => Get.back(result: false),
                    child: Container(
                        height: 56,
                        color: Colors.black,
                        alignment: Alignment.center,
                        child: Text(leftBtnText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white
                            ))
                    ),
                  )),
              Expanded(
                child: InkWell(
                  onTap: () => Get.back(result: false),
                  child:  Container(
                    color: AppThemes.pointColor,
                    height: 56,
                    alignment: Alignment.center,
                    child: Text(rightBtnText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black
                      ),),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: Get.mediaQuery.padding.bottom,
          )
        ],
      ),
    );
  }
}
