import 'package:flutter/material.dart';

mixin TabBarMixin{

  Widget menuTab(String title,double height){
    return Container(
      height: height,
      alignment: Alignment.center,
      child: Text(
        title,
      ),
    );
  }
}