import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawingAppBar extends StatelessWidget implements PreferredSizeWidget{

  const DrawingAppBar({this.actionButton,this.onPressed,required this.title});
  final Widget? actionButton;
  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: -4,
      leading: InkWell(
        onTap:  onPressed ?? () => Get.back(),
        child: Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      title: Text(title,style: AppThemes.textTheme.headline1,),
      actions: [actionButton ?? Container()],
    );
  }

  Size get preferredSize => Size.fromHeight(60);
}