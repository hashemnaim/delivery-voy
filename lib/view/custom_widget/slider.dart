// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeSlider extends StatefulWidget {
//   @override
//   _HomeSliderState createState() => _HomeSliderState();
// }

// class _HomeSliderState extends State<HomeSlider> {
//   // AppController _appController = Get.find();

//   int current = 0;
//   List<String> sliders = [
//     "assets/images/slider.png",
//     "assets/images/slider.png",
//     "assets/images/slider.png",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     List list2 = sliders;

//     return CarouselSlider(
//       options: CarouselOptions(
//         autoPlay: true,
//         initialPage: 0,
//         autoPlayInterval: Duration(seconds: 5),
//         height: ScreenUtil().setHeight(118),
//         aspectRatio: 10,
//         viewportFraction: 0.92,
//         onPageChanged: (index, reason) {
//           setState(() {
//             current = index;
//           });
//         },
//       ),
//       items: list2.map((image) {
//         print(image);
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: 4.w),
//           child: ClipRRect(
//             child: Container(
//                 color: Colors.white,
//                 child: Image.asset(
//                   image,
//                   height: 180.h,
//                   width: 400.w,
//                   fit: BoxFit.fill,
//                 )
//                 // CachedNetworkImageShare(
//                 //     image, 180.h, 400.w, 1),
//                 ),
//             borderRadius: BorderRadius.circular(8.r),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
