import 'package:delivery_boy/server/base/api_response.dart';
import 'package:delivery_boy/module/Auth/view/screen/logIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    if (apiResponse.error is! String &&
        (apiResponse.error.errors[0].message == 'Unauthenticated.' ||
            apiResponse.error.errors[0].message == 'Invalid token!')) {
      // Provider.of<SplashProvider>(context, listen: false).removeSharedData();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
    } else {
      String? _errorMessage;
      if (apiResponse.error is String) {
        _errorMessage = apiResponse.error.toString();
      } else {
        _errorMessage = apiResponse.error.errors[0].message;
      }
      // ignore: deprecated_member_use
      Get.showSnackbar(GetBar(
        messageText:
            Text(_errorMessage!, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    }
  }
}
