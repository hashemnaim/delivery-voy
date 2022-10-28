import 'package:delivery_boy/server/server_auth.dart';
import 'package:delivery_boy/services/connectvity_service.dart';
import 'package:delivery_boy/values/export.dart';
import 'package:delivery_boy/view/custom_widget/customTextField.dart';
import 'package:delivery_boy/view/custom_widget/custom_button.dart';
import 'package:delivery_boy/view/custom_widget/custom_dialoug.dart';
import 'package:get/get.dart';

import 'forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

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

  saveForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (ConnectivityService.connectivityStatus !=
          ConnectivityStatus.Offline) {
        await ServerAuth.instance
            .login(mobile: number.text, password: password.text);
      } else {
        CustomDialougs.utils
            .showDialoug(messageKey: 'network_error', titleKey: 'alert');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        ExactAssetImage("assets/images/loginBackground.png")),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          FadeInRight(
                              duration: Duration(milliseconds: 2000),
                              child: Container(
                                  height: 150,
                                  width: 250,
                                  child: Image.asset(
                                    "assets/images/van.gif",
                                    fit: BoxFit.fill,
                                  ))),
                          // Container(
                          //     // height: MediaQuery.of(context).size.height * 0.1,
                          //     alignment: Alignment.center,
                          //     child: Text(
                          //       "تسجيل الدخول",
                          //       style: TextStyle(
                          //         color: Color(0xff658199),
                          //         fontFamily: 'Cairo',
                          //         fontSize: 20.0,
                          //       ),
                          //     )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextFormField(
                              hintText: 'رقم الموبايل',
                              textEditingController: number,
                              textInputType: TextInputType.phone,
                              validator: setNumberValidator,
                              // fillColor: AppColors.gray.withOpacity(0.9),
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.person))),

                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFormField(
                            hintText: 'كلمة المرور',
                            password: true,
                            textEditingController: password,
                            validator: setPasswordValidator,
                            prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.lock)),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomButton(
                            height: 50,
                            width: 180,
                            onTap: () => saveForm(),
                            text: "تسجيل الدخول",
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
                              text: "هل نسيت كلمة المرور؟",
                              color: Color(0xff658199),
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     providerModalHand.changeModelhan(false);

                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => RegisterScreen()));
                          //   },
                          //   child: Container(
                          //     height:
                          //         MediaQuery.of(context).size.height * 0.035,
                          //     //  width: 190,
                          //     child: Center(
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Text(
                          //             "  أنشاء حساب  ",
                          //             style: TextStyle(
                          //               color: Color(0xff658199),
                          //               fontFamily: 'Cairo',
                          //               fontSize: 16.0,
                          //             ),
                          //           ),
                          //           Text(
                          //             " لا يوجد لديك حساب ؟",
                          //             style: TextStyle(
                          //               color: Colors.grey,
                          //               fontFamily: 'Cairo',
                          //               fontSize: 16.0,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          // Expanded(
          //   // flex: 1,
          //   child: Transform.rotate(
          //     origin: Offset(0, 0),
          //     angle: 3.142,
          //     child: Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //             fit: BoxFit.cover,
          //             image:
          //                 ExactAssetImage("assets/images/loginBackground.png")),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
