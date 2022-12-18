import 'package:flutter/material.dart';

class DrawnLine {
  Color? paint;
  double width;
  bool isErase;
  double? startX;
  double? startY;
  List<double>? endXList;
  List<double>? endYList;

  DrawnLine(
      {this.paint,
      this.width: 2.0,
      this.isErase = false,
      this.startY,
      this.startX,
      this.endXList,
      this.endYList});

  Path get drawPath{
    Path path = Path();
    path.moveTo(startX ?? 0, startY ?? 0);
    for(int i = 0;i <(endXList?.length ?? 0); i++){
      path.lineTo(endXList?[i] ?? 0, endYList?[i] ?? 0);
    }
    return path;
  }


}
