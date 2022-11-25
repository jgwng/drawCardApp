enum ImportImageType{
  gallery,
  camera
}
extension ImportImageTypeExtension on ImportImageType{
  String get title{
    switch(this){
      case ImportImageType.gallery:
        return '사진 촬영';
      case ImportImageType.camera:
        return '이미지 선택';
    }
  }
}