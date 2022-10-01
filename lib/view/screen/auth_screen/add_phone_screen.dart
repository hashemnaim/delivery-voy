// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/server/server_auth.dart';
// import 'package:delivery_boy/view/custom_widget/customTextField.dart';
// import 'package:delivery_boy/view/custom_widget/custom_button.dart';
// import 'package:delivery_boy/view/custom_widget/custom_text.dart';

// class AddPhoneScreen extends StatelessWidget {
//   GlobalKey<FormState> formKey = GlobalKey();

//   validateCode(String value) {
//     if (value.isEmpty) {
//       return 'Invalid ';
//     }
//   }

//   String mobile;

//   saveCode(String value) {
//     this.mobile = value;
//   }

//   saveForm() async {
//     if (formKey.currentState.validate()) {
//       // if (ConnectivityService.connectivityStatus !=
//       //     ConnectivityStatus.Offline) {
//       await ServerAuth.instance.verifyMobile(mobileNumber: mobile, type: 0);
//       // } else {
//       //   CustomDialougs.utils
//       //       .showDialoug(messageKey: 'network_error', titleKey: 'alert');
//       // }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//                 child: CustomSvgImage24(
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
//                 key: formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CustomText(
//                       text: 'Aktivere mobilnummer',
//                       fontSize: 36.sp,
//                       color: AppColors.primary,
//                       letterSpacing: -0.42,
//                       fontWeight: FontWeight.w700,
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(
//                       height: 62.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(right: 36.w, left: 36.w),
//                       child: CustomTextFormField(
//                         hintText: 'Mobilnummer',
//                         textInputType: TextInputType.phone,
//                         onSaved: saveCode,
//                         validator: validateCode,
//                         repeat: true,
//                         prefixIcon: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(
//                               Icons.phone_android,
//                               color: AppColors.blackLight,
//                             )
//                             //  CustomSvgImage24(
//                             //   imageName: 'user',
//                             //   height: 3.h,
//                             //   width: 3.w,
//                             //   color: AppColors.blackLight,
//                             // ),
//                             ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 31.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 60.w),
//                       child: CustomButton(
//                           width: 170.w,
//                           height: 40.h,
//                           colorText: AppColors.blackDark,
//                           color: AppColors.primary,
//                           text: 'Validate mobile',
//                           onTap: () {
//                             // Get.to(() => VerifyMobileNumber());
//                             // Get.to(() => VerificationScreen());

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
