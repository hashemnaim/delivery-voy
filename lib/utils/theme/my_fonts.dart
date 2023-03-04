import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../translations/localization_service.dart';

class MyFonts {
  // return the right font depending on app language
  static TextStyle? get getAppFontType =>
      LocalizationService.supportedLanguagesFontsFamilies["ar"];

  // headlines text font
  static TextStyle? get headlineTextStyle => getAppFontType;

  // body text font
  static TextStyle? get bodyTextStyle => getAppFontType;

  // button text font
  static TextStyle? get buttonTextStyle => getAppFontType;

  // app bar text font
  static TextStyle? get appBarTextStyle => getAppFontType;

  // chips text font
  static TextStyle? get chipTextStyle => getAppFontType;

  // appbar font size
  static double get appBarTittleSize => 15.sp;

  // body font size
  static double get body1TextSize => 16.sp;
  static double get body2TextSize => 14.sp;

  // headlines font size
  static double get headline1TextSize => 30.sp;
  static double get headline2TextSize => 25.sp;
  static double get headline3TextSize => 20.sp;
  static double get headline4TextSize => 16.sp;
  static double get headline5TextSize => 12.sp;
  static double get headline6TextSize => 10.sp;

  //button font size
  static double get buttonTextSize => 18.sp;

  static double get navTextSize => 13.sp;

  //caption font size
  static double get captionTextSize => 12.sp;
  //navBar font size
  static double get navBarTextSize => 13.sp;

  //chip font size
  static double get chipTextSize => 10.sp;
}
