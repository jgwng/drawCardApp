enum UserImageType { drawing, coloring, pixelArt }

extension UserImageTypeExtension on UserImageType {
  String get type {
    return this.name;
  }
}

UserImageType? decodeUserImageTypeByString(String? type) {
  if (type == null) {
    return null;
  } else {
    switch (type) {
      case 'coloring':
        return UserImageType.coloring;
      case 'pixelArt':
        return UserImageType.pixelArt;
      default:
        return UserImageType.drawing;
    }
  }
}
