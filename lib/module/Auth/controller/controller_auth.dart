import 'package:get/get.dart';

import '../../../utils/export.dart';
import '../server/server_auth.dart';

class AuthController extends GetxController {
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  int? code = 0;
  setNumberValidator(String value) {
    if (value.length < 9) {
      return "رقم الهاتف خطا";
    }
  }

  setPasswordValidator(String value) {
    if (value.isEmpty) {
      return "كلمة المرور خطا";
    }
  }

  login(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await ServerAuth.instance
          .login(mobile: mobile.text, password: password.text);
    }
  }
}
