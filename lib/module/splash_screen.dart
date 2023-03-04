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
            right: 5.w,
            left: 5.w,
            child: Image.asset(
              "assets/images/logo.gif",
              width: 400.w,
              height: 200.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
