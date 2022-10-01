import 'package:get/get.dart';
import '../../values/export.dart';

class DialogLoading {
  AppController appController = Get.find();
  DialogLoading._();
  static DialogLoading pr = DialogLoading._();
  void show() {
    appController.pr.show(
        message: 'Loading'.tr + '...',
        indicatorColor: AppColors.primary,
        textStyle: TextStyle(color: Colors.black));
  }

  void hide() {
    appController.pr.hide();
  }
}
