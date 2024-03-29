import 'dart:io';
import 'dart:typed_data';
import 'package:drawcard/business_logic/controller/global_controller.dart';
import 'package:drawcard/business_logic/model/user_picture.dart';
import 'package:drawcard/business_logic/enums/draw_pad_type.dart';
import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:drawcard/business_logic/enums/save_type.dart';
import 'package:drawcard/consts/app_themes.dart';
import 'package:drawcard/ui/widget/bottom_sheet/select_yn_bottom_sheet.dart';
import 'package:drawcard/ui/widget/bottom_sheet/type_selector_bottom_sheet.dart';
import 'package:drawcard/util/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

class DrawPageController extends GetxController {
  RxList<DrawnLine> lines = <DrawnLine>[].obs;
  Rx<Color> drawColor = Colors.red.obs;
  RxBool isEraseMode = false.obs;
  Paint paint = Paint();
  RxDouble strokeWidth = 2.5.obs;
  RxString bgImageUrl = ''.obs;
  Rx<DrawPadMenu> showMenu = DrawPadMenu.none.obs;
  GlobalKey paletteKey = GlobalKey();
  List<double> offsetList = [];

  UserPicture userPictureInfo = UserPicture();
  bool isModify = false;

  static DrawPageController? get to {
    if (Get.isRegistered<DrawPageController>()) {
      return Get.find<DrawPageController>();
    } else {
      return null;
    }
  }

  List<Color> palette = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.brown,
    Colors.blue,
    Palette.kToDark,
    Colors.grey
  ];

  @override
  void onInit() {
    super.onInit();
    Map? args = Get.arguments;
    if (args != null) {
      userPictureInfo = args['userCard'] ?? UserPicture();
      lines.value = userPictureInfo.drawnLines ?? <DrawnLine>[];
      isModify = true;
    }
  }

  void clearScreen() {
    lines.clear();
  }

  void onDrawStart(DragStartDetails details) {
    if (showMenu.value != DrawPadMenu.none) {
      showMenu.value = DrawPadMenu.none;
      return;
    }

    final startX = details.globalPosition.dx - 16;
    final startY = details.globalPosition.dy - Get.mediaQuery.padding.top - 56;

    final stroke = DrawnLine(
        paint: drawColor.value,
        width: strokeWidth.value,
        isErase: isEraseMode.value,
        startX: startX,
        startY: startY,
        endXList: [],
        endYList: []);
    lines.add(stroke);
  }

  void onDrawing(DragUpdateDetails details) {
    final endX = details.globalPosition.dx - 16;
    final endY = details.globalPosition.dy - Get.mediaQuery.padding.top - 56;
    lines.last.endXList?.add(endX);
    lines.last.endYList?.add(endY);
    lines.refresh();
  }

  void colorChange(Color color) {
    drawColor.value = color;
    showMenu.value = DrawPadMenu.none;
  }

  void toggleEraseMode() {
    isEraseMode.toggle();
  }

  void onTapForErase() async {
    isEraseMode.toggle();
  }

  void onTapChangeColor() {
    if (showMenu.value == DrawPadMenu.palette) {
      showMenu.value = DrawPadMenu.none;
    } else {
      showMenu.value = DrawPadMenu.palette;
    }
  }

  void onTapChangeStroke() {
    if (showMenu.value == DrawPadMenu.stroke) {
      showMenu.value = DrawPadMenu.none;
    } else {
      showMenu.value = DrawPadMenu.stroke;
    }
  }

  void onTapSaveImage() async {
    Map<String, SaveType> values = {for (var v in SaveType.values) v.title: v};
    var result = await showTypeSelectorBottomSheet<SaveType>(
        title: '이미지 저장하기', typeList: values);
    if (result == null) return;

    if (result == SaveType.gallery) {
      await onTapSavePaletteImage();
    }
    if (result == SaveType.server) {
      print('SaveType.server');
      return;
    }
  }

  void onTapImportBg() async {
    String? path = await CommonUtil.getImageForApp(
        title: '배경 이미지 첨부하기', hasDefault: false);
    if (path != null) {
      bgImageUrl.value = path;
      print(bgImageUrl.value);
    }
  }

  Future<void> onTapSavePaletteImage() async {
    try {
      RenderRepaintBoundary? boundary = paletteKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData?.buffer.asUint8List();

      final ts = DateTime.now().millisecondsSinceEpoch.toString();
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(pngBytes!),
          quality: 90,
          name: ts);
      print(result);
      print('capture is Done');
    } catch (e) {
      print(e.toString());
    }
  }

  void onTapExitPage() async {
    final directoryPath = GlobalController.to.filePath;

    if (isModify) {
      final imageFile =
          File('$directoryPath/${userPictureInfo.thumbnailName}.png');

      await imageFile.delete();
      int saveTime = DateTime.now().millisecondsSinceEpoch;
      await saveThumbnailImageUserPicture(saveTime);
      final pictureInfo = UserPicture(
          drawnLines: lines,
          isLock: false,
          createDateTime: DateTime.now().toIso8601String(),
          thumbnailName: '$saveTime',
          bgImageUrl: bgImageUrl.value);
      Get.back(result: pictureInfo);
    } else {
      if (lines.isNotEmpty) {
        bool? result = await showYNSelectorBottomSheet(
            title: '그림 그리기를 종료할까요?',
            content: '임시 저장하지 않으시면,\n지금까지 그린 그림은 저장되지 않아요.',
            leftBtnText: '종료',
            rightBtnText: '임시 저장');
        if (result == true) {
          // using your method of getting an image
          int saveTime = DateTime.now().millisecondsSinceEpoch;
          await saveThumbnailImageUserPicture(saveTime);
          final pictureInfo = UserPicture(
              drawnLines: lines,
              isLock: false,
              createDateTime: DateTime.now().toIso8601String(),
              thumbnailName: '$saveTime',
              bgImageUrl: bgImageUrl.value);

          Get.back(result: pictureInfo);
        } else {
          Get.back();
        }
      } else {
        Get.back();
      }
    }
  }

  Future<void> saveThumbnailImageUserPicture(int saveTime) async {
    RenderRepaintBoundary? boundary =
        paletteKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directoryPath = GlobalController.to.filePath;
    final ByteData? newImage =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final imageFile = File('$directoryPath/$saveTime.png');
    if (newImage != null) {
      await imageFile.writeAsBytes(newImage.buffer.asInt8List());
    }
  }
}
