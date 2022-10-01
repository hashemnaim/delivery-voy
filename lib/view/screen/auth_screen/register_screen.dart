import 'package:delivery_boy/values/export.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/server/server_auth.dart';

import 'package:delivery_boy/view/custom_widget/customTextField.dart';
import 'package:delivery_boy/view/custom_widget/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  final focus = FocusNode();
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmationPassword;
  AppController appController = Get.find();
  saveName(String value) {
    this.name = value;
  }

  saveEmail(String value) {
    this.email = value;
  }

  savePassword(String value) {
    this.password = value;
  }

  savephoneNumber(String value) {
    this.phoneNumber = value;
  }

  saveConfirmationPassword(String value) {
    this.confirmationPassword = value;
  }

  validateNull(String value) {
    if (value.isEmpty) {
      return 'Invalid ';
    }
  }

  validateMobildFunction(String value) {
    if (value.isEmpty) {
      return 'Invalid ';
    } else if (value.length < 7) {
      return 'error';
    }
  }

  validatEmailFunction(String value) {
    if (value.isEmail == false) {
      return 'Invalid Email';
    } else if (value.isEmpty) {
      return 'Invalid Email';
    }
  }

  validatePasswordFunction(String value) {
    if (value.isEmpty) {
      return 'Invalid password ';
    } else if (value.length < 8) {
      return 'Invalid password';
    }
  }

  validatePasswordco(String value) {
    if (value.isEmpty) {
      return 'error';
    } else if (value.length < 8 && password != confirmationPassword) {
      return 'password_error';
    }
  }

  saveForm() async {
    if (formKey.currentState!.validate()) {
      // if (ConnectivityService.connectivityStatus !=
      //     ConnectivityStatus.Offline) {
      // AppController.pr.show();

      await ServerAuth.instance.register(
        email: email,
        password: password,
        confirmationPassword: confirmationPassword,
        name: name,
        // fcmToken: AppController.fcmToken,
      );
      //     AppController.pr.hide();
      // } else {
      //   CustomDialougs.utils
      //       .showDialoug(messageKey: 'network_error', titleKey: 'alert');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: CustomSvgImage(
                imageName: 'top_yallaw',
                width: 200.w,
                height: 140.h,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomSvgImage(
                imageName: 'bottom_yallow',
                width: 200.w,
                height: 140.h,
              ),
            ),
            Positioned(
              top: 50.h,
              left: 20.w,
              child: InkWell(
                onTap: () => Get.back(),
                child: CustomSvgImage(
                  imageName: 'arrow_back',
                  width: 40.w,
                  height: 30.h,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSvgImage(
                  imageName: 'logo_login',
                  width: 45.w,
                  height: 45.h,
                ),
              ),
            ),
            Positioned.fill(
              top: 180.h,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      textAlign: TextAlign.center,
                      text: 'Registrere',
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.only(right: 30.w, left: 24.w),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              hintText: 'Skriv din e-post',
                              textInputType: TextInputType.text,
                              // iconData: Icons.alternate_email,
                              validator: validateNull,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomSvgImage(
                                  imageName: 'user',
                                  height: 3.h,
                                  width: 3.w,
                                  color: AppColors.blackLight,
                                ),
                              ),
                              onSaved: saveName,
                            ),
                            SizedBox(height: 16.h),
                            CustomTextFormField(
                                textInputType: TextInputType.emailAddress,
                                validator: validatEmailFunction,
                                hintText: 'E-post',
                                onSaved: saveEmail,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.mail,
                                    color: AppColors.blackLight,
                                  ),
                                )),
                            SizedBox(height: 16.h),
                            CustomTextFormField(
                              hintText: 'Passord',
                              password: true,
                              validator: validatePasswordFunction,
                              onSaved: savePassword,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomSvgImage(
                                  imageName: 'padlock',
                                  height: 20.h,
                                  color: AppColors.blackLight,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextFormField(
                              hintText: 'Bekreft Passord',
                              password: true,
                              textInputType: TextInputType.visiblePassword,
                              validator: validatePasswordFunction,
                              onSaved: saveConfirmationPassword,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomSvgImage(
                                  imageName: 'padlock',
                                  height: 20.h,
                                  color: AppColors.blackLight,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 60.w),
                                child: CustomButton(
                                    width: 170.w,
                                    height: 40.h,
                                    colorText: AppColors.blackDark,
                                    color: AppColors.primary,
                                    text: 'Melde deg på',
                                    onTap: () => saveForm())
                                // Get.to(() => AddPhoneScreen()

                                ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15.w,
                                ),
                                CustomText(
                                  text: 'Har allerede en konto?',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                CustomButton(
                                    width: 130.w,
                                    height: 40.h,
                                    colorText: AppColors.blackDark,
                                    color: AppColors.primary,
                                    text: 'Logg inn',
                                    onTap: () => Get.back()),
                              ],
                            ),
                            SizedBox(
                              height: 23.h,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
