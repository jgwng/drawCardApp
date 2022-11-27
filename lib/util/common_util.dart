import 'dart:io';


import 'package:drawcard/business_logic/enums/import_image_type.dart';
import 'package:drawcard/ui/widget/bottom_sheet/type_selector_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CommonUtil {
  static List<K>? jsonToList<K>(Map<String, dynamic> json,
      K Function(Map<String, dynamic> model) fromJson, String key) {
    if (json.isEmpty || !json.containsKey(key)) return [];

    return List<K>.from(json[key].map((model) => fromJson(model)));
  }

  static Future<String?> getImageForApp(
      {required String title, bool hasDefault = false}) async {

    ImageSource source = ImageSource.gallery;
    Permission permission =
    (Platform.isAndroid) ? Permission.storage : Permission.photos;

    Map<String, ImportImageType> values = {
      for (var v in ImportImageType.values) v.title: v
    };
    var result = await showTypeSelectorBottomSheet<ImportImageType>(
        title: title,
        typeList: values
    );

    if (result == ImportImageType.camera) {
      source = ImageSource.camera;
      permission = Permission.camera;
    }

    final status = await permission.request();
    if (status.isPermanentlyDenied) return null;

    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return null;
    return image.path;
  }


}
