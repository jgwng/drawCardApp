import 'package:drawcard/consts/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewDrawCard extends StatelessWidget {
  const PreviewDrawCard(
      {this.imageAddress = '', this.isFavorite = false, this.onToggleFavorite});

  final String? imageAddress;
  final bool? isFavorite;
  final VoidCallback? onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: Colors.grey, width: 2)),
            child: (imageAddress?.isEmpty ?? true)
                ? SizedBox()
                : Image.asset(
                    imageAddress!,
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: InkWell(
                onTap: () => Get.toNamed(Routes.drawing,
                    arguments: {'imageAddress': imageAddress}),
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
          )
        ],
      ),
    );
  }
}
