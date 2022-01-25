import 'package:drawcard/consts/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 400,
            child: PageView.builder(
                itemCount: 5,
                physics: ClampingScrollPhysics(),
                controller: PageController(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx,i){
                  return Container(
                    width: 300,
                    height: 300,
                    color: (i%2 == 0) ? Colors.red : Colors.blue,
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar : BottomAppBar(
         shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.menu, color: Colors.black,), onPressed: () {},),
              IconButton(icon: Icon(Icons.settings, color: Colors.black,), onPressed: () {},),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(bottom: 30),
        child: FittedBox(
          child:  FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: (){
              Get.dialog(menuSelector(),barrierDismissible : false,
                  barrierColor:null,
                  useSafeArea: true
              );
            },
            child: Icon(Icons.add_rounded,size: 40,),
          ),
        ),
      ),
    );
  }

  Widget menuSelector(){
    return Material(
      type: MaterialType.transparency,
      child:Center(
        child: Container(

          color: Colors.transparent,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.transparent,
                height: 60,
                child: Text('메뉴를 선택하세요',style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child:  Row(
                  children: [
                    menuItem('스케치'),
                    SizedBox(width: 40,),
                    menuItem('컬러링')
                  ],
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: ()=>Get.back(),
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text('닫기',style: TextStyle(
                    color: Colors.white,fontSize: 20
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(String title){
    String? route;
    String? imageAddress;
    if(title == '스케치'){
      route = Routes.drawing;
      imageAddress = 'drawing.png';
    }else{
      route = Routes.imageSelect;
      imageAddress = 'coloring.png';
    }

    return  Expanded(
        child : GestureDetector(
          onTap: () => Get.offAndToNamed(route!),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/$imageAddress',
                width: 100,
                height: 100,),
                SizedBox(height : 30,),
                Text(title,style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                ),),
              ],
            ),
          ),
          
        )
    );
  }
}