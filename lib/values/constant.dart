import 'package:flutter/services.dart';

DateTime? currentBackPressTime;
Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
    currentBackPressTime = now;
    return Future.value(false);
  }
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  return Future.value(true);
}

// setToast(String msg, Color color) {
//   return Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.TOP,
//       timeInSecForIosWeb: 2,
//       backgroundColor: color,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

// showCustomSnackBar(String message, {bool isError = true}) {
//   Get.showSnackbar(GetBar(
//     backgroundColor: isError ? Colors.red : Colors.green,
//     title: message,
//   ));
// }
