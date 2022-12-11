import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/ui/widget/bottom_sheet/bottom_sheet_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> showTypeSelectorBottomSheet<T>(
    {required String title, required Map<String, T> typeList}) async {
  final result = await Get.bottomSheet(TypeSelectorBottomSheet(
    title: title,
    typeList: typeList,
  ));
  if (result != null) return result;
  return null;
}

class TypeSelectorBottomSheet<T> extends StatelessWidget with BottomSheetMixin {
  const TypeSelectorBottomSheet(
      {Key? key, required this.title, required this.typeList})
      : super(key: key);
  final String title;
  final Map<String, T> typeList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + typeList.length * 60 + Get.mediaQuery.padding.bottom,
      decoration: const BoxDecoration(
          color: AppThemes.mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header(title: title),
          ...typeList.keys
              .map((e) =>
                  bottomMenuButton(typeList[e], e, e == typeList.keys.last))
              .toList(),
          SizedBox(
            height: Get.mediaQuery.padding.bottom,
          )
        ],
      ),
    );
  }
}
