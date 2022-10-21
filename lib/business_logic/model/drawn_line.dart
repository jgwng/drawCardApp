import 'package:flutter/material.dart';

class DrawnLine {
  final path = Path();
  final Color? paint;
  final double width;
  final bool isErase;

  DrawnLine({this.paint, this.width: 2.0, this.isErase = false});
}
