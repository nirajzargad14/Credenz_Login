import 'package:flutter/material.dart';

class SizeConfig {

  static late MediaQueryData _mediaQueryData;
  static double screenWidth=375;
  static double screenHeight=812;
  static late Orientation orientation;

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }

  static getProportionateScreenHeight(double inputHeight) {
    return (inputHeight / 812.0) * SizeConfig.screenHeight;
  }

  static getProportionateScreenWidth(double inputWidth) {
    return (inputWidth / 375.0) * SizeConfig.screenWidth;
  }
}
