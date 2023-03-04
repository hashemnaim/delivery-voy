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
            right: 0.w,
            left: 0.w,
            child: Image.asset(
              "assets/lottie/logo.gif",
              width: 250.w,
              height: 250.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
