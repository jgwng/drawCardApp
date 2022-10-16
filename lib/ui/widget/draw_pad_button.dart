import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawPadButton extends StatelessWidget {
  const DrawPadButton(
      {Key? key,
      required this.onTap,
      this.btnText,
      this.isReady,
      this.width,
      this.bottomMargin = 20})
      : super(key: key);

  final VoidCallback onTap;
  final bool? isReady;
  final String? btnText;
  final double? bottomMargin;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomMargin ?? 20),
        child: Container(
          height: 60,
          width: width ?? Get.width,
          decoration: BoxDecoration(
              color: (isReady ?? false)
                  ? Colors.green
                  : Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: Text(btnText ?? '',
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }
}
