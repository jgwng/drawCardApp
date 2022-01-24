import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSelectPage extends StatefulWidget{
  @override
  _ImageSelectPageState createState() => _ImageSelectPageState();
}

class _ImageSelectPageState extends State<ImageSelectPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(height: 20,),
          //카테고리별 분류를 위한 메뉴바
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(bottom: 20),
            child: ListView.separated(
              separatorBuilder: (ctx,i){
                return SizedBox(width: 20);
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx,i) {
                return categoryMenu('전체');
              },
              itemCount: 5,
              shrinkWrap: true,
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20,),
          //선택할수 있는 예시 이미지 리스트
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20
              ),
              child: GridView.builder(
                itemCount: 10,
                physics: ScrollPhysics(),
                itemBuilder: (ctx,i){
                  return sampleItem('거북이');
                },
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget categoryMenu(String title){
    return Container(
      width: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: Colors.black)
      ),
      child: Text(title),
    );
  }

  PreferredSizeWidget get appBar{
    return AppBar(
      leading:Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
          )),
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      title: Text('컬러링',style: AppThemes.textTheme.headline2,),
    );
  }

  Widget sampleItem(String title){
    return Column(
      children: [
       Image.asset('assets/images/drawing.png',
       width: 100,
       height: 100,),
        SizedBox(height: 10,),
        Text(title,style: AppThemes.textTheme.subtitle1,)
      ],
    );
  }
}