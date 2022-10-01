// import 'dart:async';
// import 'package:delivery_boy/controller/controller_auth.dart';
// import 'package:delivery_boy/values/export.dart';
// import 'package:flutter/gestures.dart';

// import 'package:get/get.dart';
// // import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:delivery_boy/server/server_auth.dart';
// import 'package:delivery_boy/view/custom_widget/custom_button.dart';

// class VerificationScreen extends StatefulWidget {
//   @override
//   _VerificationScreenState createState() => _VerificationScreenState();
// }

// class _VerificationScreenState extends State<VerificationScreen> {
//   String pinConde = '';

//   AppController appController = Get.find();
//   AuthController authController = Get.find();

//   saveForm() async {
//     if (this.pinConde == authController.code.toString()) {
//       await ServerAuth.instance.sendCode(pinConde, 0);
//     } else {
//       Get.snackbar(
//         "pinConde Faild",
//         "",
//         duration: Duration(seconds: 3),
//       );
//     }
//   }

//   TextEditingController textEditingController = TextEditingController();

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
//     timer.cancel();

//     super.dispose();
//   }

//   var onTapRecognizer;
//   Timer timer;
//   int start;
//   bool rsend = false;
//   startTimer() {
//     start = 100;

//     final oneSec = Duration(seconds: 1);
//     timer = new Timer.periodic(
//       oneSec,
//       (Timer timer) async {
//         if (start < 1) {
//           timer.cancel();
//           rsend = true;

//           setState(() {});
//         } else {
//           start = start - 1;
//           rsend = false;
//           setState(() {});
//         }
//       },
//     );
//   }

//   // ..text = "123456";
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   GlobalKey<FormState> gformKey = GlobalKey<FormState>();
//   StreamController<ErrorAnimationType> errorController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: ExactAssetImage("assets/images/background.png"),
//                 fit: BoxFit.fill)),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               child: CustomSvgImage(
//                 imageName: 'top_yallaw',
//                 width: 200.w,
//                 height: 140.h,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               right: 0,
//               child: CustomSvgImage(
//                 imageName: 'bottom_yallow',
//                 width: 200.w,
//                 height: 140.h,
//               ),
//             ),
//             Positioned(
//               top: 50.h,
//               left: 20.w,
//               child: InkWell(
//                 onTap: () => Get.back(),
//                 child: CustomSvgImage(
//                   imageName: 'arrow_back',
//                   width: 40.w,
//                   height: 30.h,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               right: 0,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CustomSvgImage(
//                   imageName: 'logo_login',
//                   width: 45.w,
//                   height: 45.h,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 200.h,
//               left: 0,
//               right: 0,
//               child: Form(
//                 key: gformKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CustomText(
//                       text: 'Aktivere mobilnummer',
//                       fontSize: 30.sp,
//                       color: AppColors.primary,
//                       fontWeight: FontWeight.w700,
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(
//                       height: 31.h,
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     CustomText(
//                       text: ' 0${start ~/ 60}:${start % 60} ',
//                       textAlign: TextAlign.center,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.primary,
//                     ),
//                     SizedBox(
//                       height: 25.h,
//                     ),
//                     Container(
//                       // width: 100,
//                       child: Container(
//                         // padding: EdgeInsets.symmetric(horizontal: 10.w),
//                         child: PinCodeTextField(
//                           appContext: context,
//                           length: 6,
//                           obscureText: false,
//                           animationType: AnimationType.fade,
//                           enableActiveFill: true,
//                           keyboardType: TextInputType.number,
//                           validator: (v) {
//                             if (v.length < 3) {
//                               return "I'm from validator";
//                             } else {
//                               return null;
//                             }
//                           },
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           pinTheme: PinTheme(
//                               shape: PinCodeFieldShape.box,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                               fieldHeight: 75.h,
//                               fieldWidth: 50.w,
//                               activeColor: AppColors.primary,
//                               activeFillColor: AppColors.primary,
//                               inactiveColor: AppColors.primary,
//                               inactiveFillColor: Colors.white,
//                               selectedColor: AppColors.primary,
//                               selectedFillColor: AppColors.primary),
//                           controller: textEditingController,
//                           animationDuration: Duration(milliseconds: 300),
//                           pastedTextStyle: TextStyle(
//                             color: Colors.green.shade600,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           backgroundColor: Colors.transparent,
//                           onCompleted: (v) {
//                             savePin(v);
//                           },
//                           onChanged: (value) {
//                             savePin(value);
//                           },
//                           beforeTextPaste: (text) {
//                             print("Allowing to paste $text");

//                             return true;
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 60.w),
//                       child: CustomButton(
//                           width: 200.w,
//                           height: 40.h,
//                           colorText: AppColors.blackDark,
//                           color: AppColors.primary,
//                           text: 'Validate mobile',
//                           onTap: () {
//                             saveForm();
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
