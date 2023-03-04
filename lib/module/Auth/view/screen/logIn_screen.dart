import 'package:delivery_boy/module/Auth/controller/controller_auth.dart';
import '../../../../helper/keyboard.dart';
import '../../../../translations/strings_enum.dart';
import '../../../../utils/export.dart';
import 'package:delivery_boy/module/Widget/customTextField.dart';
import 'package:delivery_boy/module/Widget/custom_button.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    FadeInRight(
                        duration: Duration(milliseconds: 200),
                        child: CustomPngImage(
                          "logo",
                          fit: BoxFit.cover,
                          height: 350.h,
                          width: 350,
                        )),
                    // Positioned(
                    //     top: 60,
                    //     right: 25,
                    //     child: Center(
                    //       child: CustomSvgImage(
                    //         imageName: "logo_ar",
                    //         height: 350.h,
                    //         width: 350.h,
                    //       ),
                    //     )),
                  ],
                ),
                CustomText(
                  text: "مزود الخدمة",
                  color: Color(0xff658199),
                  fontSize: 22,
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
                SizedBox(height: 80.h),
                CustomButton(
                  height: 60,
                  width: 250,
                  onTap: () {
                    KeyboardUtil.hideKeyboard(context);

                    controller.login(formKey);
                  },
                  text: AppStrings.signin.tr,
                  colorText: AppColors.white,
                ),
                SizedBox(height: 20.h),
                // GestureDetector(
                //   onTap: () {
                //     Get.to(() => ForgetScreen());
                //   },
                //   child: CustomText(
                //     text: AppStrings.forgetpassword.tr,
                //     color: Color(0xff658199),
                //     fontSize: 18.0,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
