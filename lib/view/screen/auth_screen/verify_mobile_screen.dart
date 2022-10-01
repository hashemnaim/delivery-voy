// import 'dart:async';

// import 'package:delivery_boy/controller/controller_auth.dart';
// import 'package:delivery_boy/values/export.dart';
// import 'package:flutter/gestures.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:delivery_boy/view/custom_widget/custom_button.dart';

// class VerifyMobileNumber extends StatefulWidget {
//   final bool isforget;

//   const VerifyMobileNumber({Key key, this.isforget = false}) : super(key: key);
//   @override
//   _VerifyMobileNumberState createState() => _VerifyMobileNumberState();
// }

// class _VerifyMobileNumberState extends State<VerifyMobileNumber> {
//   String pinConde = '';
//   AuthController authController = Get.find();

//   AppController appController = Get.find();

//   nextButtonFunction() {
//     if (this.pinConde == authController.code.toString()) {
//       // if (ConnectivityService.connectivityStatus !=ConnectivityStatus.Offline) {
//       //   if (widget.isforget==true) {
//       //     Get.to(()=>ForgetPassword());
// // changePassword(mobile: AppController.mobileNumber ,)

//     } else {
//       //  verifyMobile(
//       //   code: pinConde,
//       //   mobileNumber: AppController.mobileNumber,
//       //   password: AppController.password);
//     }

//     // } else {
//     //   CustomDialougs.utils.showDialoug(
//     //       messageKey:
//     //           translator.translate('There is a problem with the Internet'),
//     //       titleKey: '');
//     // }
//     // } else {
//     //   CustomDialougs.utils.showDialoug(
//     //       messageKey: translator.translate('Stroke the code'), titleKey: '');
//     // }
//   }

//   resendCode() {
//     // forgetPassword(mobileNumber: AppController.mobileNumber, inVerify: false);
//     startTimer();
//   }

//   savePin(String value) {
//     this.pinConde = value;
//     print(pinConde);
//   }

//   @override
//   void initState() {
//     onTapRecognizer = TapGestureRecognizer()
//       ..onTap = () {
//         Navigator.pop(context);
//       };
//     errorController = StreamController<ErrorAnimationType>();
//     startTimer();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     errorController.close();
//     // timer.cancel();

//     super.dispose();
//   }

//   var onTapRecognizer;
//   Timer timer;
//   int start;
//   bool rsend = false;
//   startTimer() {
//     start = 100;

//     // final oneSec = Duration(seconds: 1);
//     // timer = new Timer.periodic(
//     //   oneSec,
//     //   (Timer timer) async {
//     //     if (start < 1) {
//     //       timer.cancel();
//     //       rsend = true;

//     //       setState(() {});
//     //     } else {
//     //       start = start - 1;
//     //       rsend = false;
//     //       setState(() {});
//     //     }
//     //   },
//     // );
//   }

//   TextEditingController textEditingController = TextEditingController();
//   // ..text = "123456";
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   final formKey = GlobalKey<FormState>();
//   StreamController<ErrorAnimationType> errorController;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(
//                 height: 10.h,
//               ),
//               Text(
//                 'verify_mobile_number',
//                 // style: Styles.titleTextStyle,
//               ),
//               Text('send_confirm'),
//               SizedBox(
//                 height: 25.h,
//               ),
// ////////////////////////////////////////////////////////////////////////////////
//               Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   child: Form(
//                     key: formKey,
//                     child: PinCodeTextField(
//                       appContext: context,
//                       length: 4,
//                       obscureText: false,
//                       animationType: AnimationType.fade,
//                       enableActiveFill: true,
//                       keyboardType: TextInputType.number,
//                       validator: (v) {
//                         if (v.length < 3) {
//                           return "I'm from validator";
//                         } else {
//                           return null;
//                         }
//                       },
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       pinTheme: PinTheme(
//                           shape: PinCodeFieldShape.box,
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                           fieldHeight: 75.h,
//                           fieldWidth: 65.w,
//                           activeColor: AppColors.primary,
//                           activeFillColor: AppColors.primary,
//                           inactiveColor: AppColors.primary,
//                           inactiveFillColor: Colors.white,
//                           selectedColor: AppColors.primary,
//                           selectedFillColor: AppColors.primary),
//                       controller: textEditingController,
//                       animationDuration: Duration(milliseconds: 300),
//                       pastedTextStyle: TextStyle(
//                         color: Colors.green.shade600,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       backgroundColor: Colors.transparent,
//                       onCompleted: (v) {
//                         savePin(v);
//                       },
//                       onChanged: (value) {
//                         savePin(value);
//                       },
//                       beforeTextPaste: (text) {
//                         print("Allowing to paste $text");

//                         return true;
//                       },
//                     ),
//                   ),
//                 ),
//               ),
// ////////////////////////////////////////////////////////////////////////////////

//               SizedBox(
//                 height: 10.h,
//               ),
//               // Text(
//               //   translator.translate('wait') +
//               //       ' ${start ~/ 60}:${start % 60} ' +
//               //       translator.translate('seconds'),
//               //   textAlign: TextAlign.center,
//               //   style: TextStyle(color: Colors.grey),
//               // ),
//               // SizedBox(
//               //   height: 25.h,
//               // ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text('faild_send_code'),
//                   GestureDetector(
//                     onTap: () => rsend ? resendCode() : null,
//                     child: CustomText(
//                       text: 'resend',
//                       color: rsend ? AppColors.primary : AppColors.gray,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 55.h,
//               ),
//               CustomButton(
//                 text: 'next',
//                 onTap: nextButtonFunction,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
