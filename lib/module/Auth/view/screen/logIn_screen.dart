import 'package:delivery_boy/module/Auth/controller/controller_auth.dart';
import '../../../../helper/keyboard.dart';
import '../../../../translations/strings_enum.dart';
import '../../../../utils/export.dart';
import 'package:delivery_boy/module/Widget/customTextField.dart';
import 'package:delivery_boy/module/Widget/custom_button.dart';
import 'package:get/get.dart';

import 'forget_password_screen.dart';

class LoginScreen extends GetView<AuthController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  FadeInRight(
                      duration: Duration(milliseconds: 2000),
                      child: Image.asset(
                        "assets/images/van.gif",
                        height: 250.h,
                        fit: BoxFit.fitWidth,
                      )),
                  Container(
                    child: CustomPngImage(
                      "icon",
                      height: 150.h,
                      width: 250.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                      hintText: AppStrings.mobile.tr,
                      textEditingController: controller.mobile,
                      textInputType: TextInputType.phone,
                      validator: controller.setNumberValidator,
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.person))),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                      hintText: AppStrings.password.tr,
                      password: true,
                      textEditingController: controller.password,
                      validator: controller.setPasswordValidator,
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.lock))),
                  SizedBox(height: 20.h),
                  CustomButton(
                    height: 50,
                    width: 180,
                    onTap: () {
                      KeyboardUtil.hideKeyboard(context);

                      controller.login(formKey);
                    },
                    text: AppStrings.signin.tr,
                    colorText: AppColors.white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ForgetScreen());
                    },
                    child: CustomText(
                      text: AppStrings.forgetpassword.tr,
                      color: Color(0xff658199),
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
