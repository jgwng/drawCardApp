import 'package:flutter/material.dart';

class DrawnLine {
  final List<Offset?> path;
  final Paint? paint;
  final double width;

  DrawnLine({
     this.path : const [Offset(0,0)],this.paint,this.width : 2.0
  });
}
