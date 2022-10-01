// import 'package:delivery_boy/server/server_order.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/dimensions.dart';
// import 'package:delivery_boy/view/custom_widget/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../main_screen.dart';

// class OrderPlaceScreen extends StatelessWidget {
//   final String? orderID;

//   OrderPlaceScreen({this.orderID});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(height: 40),
//               CircleAvatar(
//                   radius: 40,
//                   backgroundColor: AppColors.primary,
//                   child: Icon(
//                     Icons.done,
//                     color: Colors.white,
//                     size: 40,
//                   )),
//               SizedBox(height: 20),
//               Text(
//                 'Bestillingen er levert',
//                 style: Theme.of(context).textTheme.headline6!.copyWith(),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     ' #$orderID',
//                     style: Theme.of(context).textTheme.headline3,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: CustomButton(
//                   height: 50,
//                   width: Get.width,
//                   color: AppColors.blackDark,
//                   text: 'Tilbake',
//                   onTap: () async {
//                     // await ServerOrder.instance
//                     //     .updateOrder(int.parse(orderID!), 4, 6);
//                     Get.to(() => MainScreen());
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
