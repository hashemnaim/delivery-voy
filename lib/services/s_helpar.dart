import 'package:shared_preferences/shared_preferences.dart';

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

  addNew(String key, String value) {
    initSharedPrefrences();
    sharedPreferences!.setString(key, value);
  }

  getValue(String key) {
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

  String? getFcmToken() {
    initSharedPrefrences();

    String? x = sharedPreferences!.getString('fcmToken');
    return x;
  }

  setFcmToken(String value) {
    initSharedPrefrences();

    sharedPreferences!.setString('fcmToken', value);
  }

  clearSp() async {
    initSharedPrefrences();
    sharedPreferences!.clear();
  }
}
