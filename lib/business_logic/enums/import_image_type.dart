enum ImportImageType { gallery, camera }

extension ImportImageTypeExtension on ImportImageType {
  String get title {
    switch (this) {
      case ImportImageType.gallery:
        return '이미지 선택';
      case ImportImageType.camera:
        return '사진 촬영';
    }
  }
}
