import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../module/profile/user_model.dart';

class SHelper {
  SHelper._();
  static SHelper sHelper = SHelper._();

  SharedPreferences? sharedPreferences;

  Future<SharedPreferences?> initSharedPrefrences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences;
    } else {
      return sharedPreferences;
    }
  }

  Future<UserData> addUser(UserData user) async {
    sharedPreferences = await initSharedPrefrences();
    log(user.name!);
    sharedPreferences!.setString("name", user.name!);
    sharedPreferences!.setString("phone", user.phone!);
    sharedPreferences!.setString("id", user.id.toString());
    return user;
  }

  addNew(String key, String value) async {
    sharedPreferences = await initSharedPrefrences();
    sharedPreferences!.setString(key, value);
  }

  String? getValue(String key) {
    initSharedPrefrences();
    String? x = sharedPreferences!.getString(key);
    return x;
  }

  String? getToken() {
    initSharedPrefrences();
    String? x = sharedPreferences!.getString('token');
    return x;
  }

  setToken(String value) {
    initSharedPrefrences();
    sharedPreferences!.setString('token', value);
  }

  removeToken() {
    initSharedPrefrences();
    sharedPreferences!.remove(
      'token',
    );
  }

  String? getFcmToken() {
    initSharedPrefrences();
    String? x = sharedPreferences!.getString('fcmToken');
    return x;
  }

  setFcmToken(String value) {
    initSharedPrefrences();
    sharedPreferences!.setString('fcmToken', value);
  }

  Future<void> setLanguge(String token) {
    return sharedPreferences!.setString("Lang", token);
  }

  String? getLanguge() {
    return sharedPreferences!.getString("Lang");
  }

  clearSp() async {
    sharedPreferences = await initSharedPrefrences();
    sharedPreferences!.clear();
  }
}
