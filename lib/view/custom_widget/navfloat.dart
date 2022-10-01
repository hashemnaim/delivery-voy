// import 'package:delivery_boy/controller/controller_cart.dart';
// import 'package:delivery_boy/values/export.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class NavFloat extends StatefulWidget {
//   @override
//   _NavFloatState createState() => _NavFloatState();
// }

// class _NavFloatState extends State<NavFloat> with TickerProviderStateMixin {
//   TabController tabController;

//   int lastSelected = 0;
//   AnimationController _animationController;
//   Animation<double> animation;
//   CurvedAnimation curve;
//   CartController cartController = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     this.tabController = TabController(
//       length: 3,
//       vsync: this,
//     );
//     // Provider.of<HomeProvieder>(context, listen: false).getCartDB();
//     _animationController = AnimationController(
//       duration: Duration(milliseconds: 400),
//       vsync: this,
//     );
//     curve = CurvedAnimation(
//       parent: _animationController,
//       curve: Interval(
//         0.5,
//         1.0,
//         curve: Curves.fastOutSlowIn,
//       ),
//     );
//     animation = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(curve);

//     Future.delayed(
//       Duration(seconds: 1),
//       () => _animationController.forward(),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: animation,
//       child: FloatingActionButton(
//         elevation: 8,
//         backgroundColor: Colors.black,
//         child: Stack(
//           children: [
//             Center(
//               child: Container(
//                 // color:Colors.amber,
//                 height: 30.h,
//                 width: 30.w,
//                 child: SvgPicture.asset(
//                   "assets/24svg/cart.svg",
//                 ),
//               ),
//             ),
//             Padding(
//                 padding: const EdgeInsets.only(right: 10, top: 10),
//                 child: CircleAvatar(
//                   backgroundColor: AppColors.primary,
//                   radius: 10.r,
//                   child: Center(
//                     child: CustomText(
//                       text: SHelper.sHelper.getToken() != null
//                           ? cartController.cartData.value.dataCartModel.countQty
//                               .toString()
//                           : "0",
//                       fontSize: 12.sp,
//                       color: Colors.black,
//                     ),
//                   ),
//                 )),
//           ],
//         ),
//         onPressed: () {
//           _animationController.reset();
//           // ServerCart.instance.getCart();
//           _animationController.forward();
//           // Get.to(() => CartScreen());
//         },
//       ),
//     );
//   }
// }
