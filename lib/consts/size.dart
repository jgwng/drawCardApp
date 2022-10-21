import 'dart:ui';

class UISize {
  static UISize _instance = UISize._internal();
  factory UISize() => _instance;

  UISize._internal() {
    appSizeCheck();
  }

  Size size = Size(0, 0);
  double _baseHeight = 812;
  double _baseWidth = 375;
  double? availableHeight;
  double? paddingTop;
  double? paddingBottom;
  double? deviceWidth;
  double? deviceHeight;

  void appSizeCheck() {
    size = window.physicalSize;
    deviceWidth = size.width;
    deviceHeight = size.height;

    var padding = window.padding;
    var paddingTop = padding.top;
    var paddingBottom = padding.bottom;
    availableHeight = size.height - paddingTop - paddingBottom;
  }

  double width(double widgetWidth) {
    return (widgetWidth / deviceWidth!) * _baseWidth;
  }

  double height(double widgetHeight) {
    return (widgetHeight / deviceHeight!) * _baseHeight;
  }
}

extension UISizeDoubleExtension on num {
  double get w {
    return UISize().width(this.toDouble());
  }

  double get h {
    return UISize().height(this.toDouble());
  }
}
