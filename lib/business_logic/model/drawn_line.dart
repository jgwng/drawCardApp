import 'package:flutter/material.dart';

class DrawnLine {
  final List<Offset> path;
  final Color color;
  final double width;

  DrawnLine({
     this.path : const [Offset(0,0)],this.color:Colors.black,this.width : 2.0
  });
}
