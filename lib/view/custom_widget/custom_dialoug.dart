import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomDialougs {
  CustomDialougs._();
  // AppController controller = Get.find();
  static CustomDialougs utils = CustomDialougs._();
  Function du = () => Get.back();

  showDialoug({required String titleKey, required String messageKey, Function? fun}) {
    // controller.pr.hide();
    Get.defaultDialog(
        confirm: CupertinoButton(
            child: Text('Ok'),
            onPressed: fun != null ? () => fun() : () => du()),
        middleText: messageKey,
        title: titleKey);
  }

  showSackbar({required String titleKey, required String messageKey}) {
    Get.snackbar(
      titleKey,
      messageKey,
      duration: Duration(seconds: 3),
    );
  }
}
