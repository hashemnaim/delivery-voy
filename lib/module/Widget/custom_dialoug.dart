import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/export.dart';

class CustomDialougs {
  CustomDialougs._();
  // AppController controller = Get.find();
  static CustomDialougs utils = CustomDialougs._();
  Function du = () => Get.back();
  void showCustomLoading() {
    BotToast.showCustomLoading(
      allowClick: true,
      toastBuilder: (cancelFunc) => Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Lottie.asset('assets/lottie/editor_ifbtlmwg.json',
            height: 200, width: 200),
      ),
    );
  }

  showDialoug(
      {required String titleKey, required String messageKey, Function? fun}) {
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
