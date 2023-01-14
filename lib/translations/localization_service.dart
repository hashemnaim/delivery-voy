import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/shared_preferences_helpar.dart';
import 'ar_AR/ar_translation.dart';
import 'en_US/en_translation.dart';

class LocalizationService extends Translations {
  // default language
  static Locale defaultLanguage = supportedLanguages[
      SHelper.sHelper.getLanguge() ??
          Get.deviceLocale!.languageCode.toString()]!;

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'en-us	'),
    'ar': const Locale('ar', 'ar-ae'),
  };

  // supported languages fonts family (must be in assets & pubspec yaml) or you can use google fonts
  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    'en': const TextStyle(fontFamily: 'Cairo'),
    'ar': const TextStyle(fontFamily: 'Cairo'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'ar_AR': arAR,
      };

  /// check if the language is supported
  static isLanguageSupported(String languageCode) =>
      supportedLanguages.keys.contains(languageCode);

  /// update app language by code language for example (en,ar..etc)

  /// check if the language is english
  // static bool isItEnglish() =>
  //     SHelper.sHelper.getLanguge().languageCode.toLowerCase().contains('en');

  /// get current locale
  static Locale getCurrentLocal() => Locale(SHelper.sHelper.getLanguge()!);
}
