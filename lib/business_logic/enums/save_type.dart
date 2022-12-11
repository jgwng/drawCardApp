enum SaveType { gallery, server }

extension SaveTypeExtension on SaveType {
  String get title {
    switch (this) {
      case SaveType.gallery:
        return '갤러리에 저장';
      case SaveType.server:
        return '임시 저장';
    }
  }
}
