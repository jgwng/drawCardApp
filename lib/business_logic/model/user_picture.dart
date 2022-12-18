import 'package:drawcard/business_logic/model/drawn_line.dart';
import 'package:drawcard/util/common_util.dart';

class UserPicture {
  bool? isLock;
  List<DrawnLine>? drawnLines;
  String? createDateTime;
  String? thumbnailName;
  String? bgImageUrl;

  UserPicture(
      {this.drawnLines,
      this.isLock,
      this.bgImageUrl,
      this.createDateTime,
      this.thumbnailName});

  factory UserPicture.fromJson(Map<String, dynamic> json) {
    return UserPicture(
        isLock: json['isLock'] ?? false,
        createDateTime: json['createDateTime'],
        thumbnailName: json['thumbnailName'] ?? '',
        bgImageUrl: json['bgImageUrl'] ?? '',
        drawnLines:
            CommonUtil.jsonToList(json, DrawnLine.fromJson, 'drawnLines'));
  }
}
