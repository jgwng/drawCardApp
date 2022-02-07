import 'package:drawcard/consts/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewDrawCard extends StatelessWidget{
  const PreviewDrawCard({this.imageAddress,this.isFavorite,this.onToggleFavorite,this.isBookMark : false});
  final String? imageAddress;
  final bool? isFavorite;
  final VoidCallback? onToggleFavorite;
  final bool isBookMark;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: Colors.grey, width: 2)),
            child: Image.asset(
              imageAddress!,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: InkWell(
                onTap: onToggleFavorite,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFFD2D7DF),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Icon(
                    isFavorite! ? Icons.bookmark : Icons.bookmark_border,
                    color: isFavorite! ? Color(0xFFFF5964) : Colors.black,
                  ),
                )),
          ),
          (!isBookMark) ?
          Positioned(
            right: 10,
            top: 10,
            child: InkWell(
                onTap: () => Get.toNamed(Routes.drawing,
                arguments: {'imageAddress' : imageAddress}),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFFD2D7DF),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Icon(
                    Icons.edit,
                    color: Color(0xFF1C1D21),
                  ),
                )),
          ) : Container()
        ],
      ),
    );
  }
}