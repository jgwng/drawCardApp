import 'package:drawcard/consts/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool?> showUserPWConfirmBottomSheet() async {
  final result = await Get.bottomSheet(UserPWConfirmBottomSheet());
  if (result != null) return result;
  return null;
}

class UserPWConfirmBottomSheet extends StatefulWidget{
  @override
  _UserPWConfirmBottomSheetState createState() => _UserPWConfirmBottomSheetState();
}

class _UserPWConfirmBottomSheetState extends State<UserPWConfirmBottomSheet>{
 List<int> numberList = [1,2,3,4,5,6,7,8,9];
 List<int?>? pwList;
 int currentIndex = 0;
 @override
 void initState(){
   super.initState();
   numberList.shuffle();
   pwList = List.filled(6, null);
 }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(28, 28, 28, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16,right: 16, top: 32,bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '잠금 비밀번호 확인',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...pwList!.map((e) => Icon(
                    Icons.circle,
                    size: 28,
                    color: e == null ? Colors.grey : AppThemes.pointColor,
                  )).toList()
                ],
              ),
            ),
          ),

          Wrap(
              direction: Axis.horizontal, // 정렬 방향
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              children: List.generate(numberList.length, (i)=>keyboardKey(i))
            // WsmBoxWidget()
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: onTapRemovePW,
                child: Container(
                    height: 56,
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: Icon(Icons.backspace_outlined,color: Colors.white,)),
              )),
              Expanded(
                child: InkWell(
                  onTap: () => Get.back(result: true),
                  child: Container(
                    color: AppThemes.pointColor,
                    height: 56,
                    alignment: Alignment.center,
                    child: Text(
                      '확인',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: Get.mediaQuery.padding.bottom,
          )
        ],
      ),
    );
  }



  Widget keyboardKey(int i){
   int keyNumber = numberList[i];
   return InkWell(
      onTap: () => onTapKeyboardKey(keyNumber),
      child: Container(
        width: Get.width/3,
        height: 60,
        alignment: Alignment.center,

        child: Text('$keyNumber',style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }

  void onTapKeyboardKey(int number){
      setState(() {
       if(pwList!.contains(null)){
         pwList![currentIndex] = number;
         if(currentIndex < 5){
           currentIndex += 1;
         }
         print(pwList);
         print(currentIndex);
       }
      });
  }

  void onTapRemovePW(){
    setState(() {
      pwList![currentIndex] = null;
      if(currentIndex >0){
        currentIndex -= 1;
      }
    });
  }
}
