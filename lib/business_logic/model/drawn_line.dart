import 'package:drawcard/util/common_util.dart';
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

  Map<String, dynamic> toJson() =>
      {
        'paint': '${paint?.red},${paint?.green},${paint?.blue}',
        'width': width,
        'isErase': isErase,
        'startX': startX,
        'startY':startY,
        'endXList' : endXList,
        'endYList' : endYList
      };

  factory DrawnLine.fromJson(Map<String,dynamic> json){
    return DrawnLine(
      paint: CommonUtil.lineColor(json['paint']),
      width: json['width'] ?? 2.0,
      isErase: json['isErase'],
      startX: json['startX'],
      startY: json['startY'],
      endXList: json['endXList'],
      endYList: json['endYList'],
    );
  }



}
