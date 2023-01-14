import 'package:delivery_boy/utils/export.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 150.h,
            top: 150.h,
            right: -90.w,
            left: -90.w,
            child: Image.asset(
              "assets/lottie/mr-clean_1.gif",
              width: 700.w,
              height: 350.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
