// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class NoInternetScreen extends StatefulWidget {
//   @override
//   State<NoInternetScreen> createState() => _NoInternetScreenState();
// }

// class _NoInternetScreenState extends State<NoInternetScreen> {
//   final ConnectivityResult connectionStatus = ConnectivityResult.none;

//   bool hasInternt = true;

//   @override
//   initState() {
//     super.initState();
//     InternetConnectionChecker().onStatusChange.listen(
//       (event) {
//         bool hasInternt = event == InternetConnectionStatus.connected;
//         setState(() {
//           this.hasInternt = hasInternt;
//         });
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Align(
//                 alignment: Alignment.center,
//                 child: Icon(
//                   Icons.wifi_off,
//                   size: 150,
//                   color: Colors.grey,
//                 )),
//             Text("No Intetnet",
//                 style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                       fontSize: 20.sp,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                     )),
//             Center(
//               child: OutlinedButton(
//                 onPressed: () {
//                   hasInternt != true ? Get.back() : setState(() {});
//                 },
//                 child: Text(
//                   "Try Again",
//                   style: TextStyle(color: Colors.green),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
