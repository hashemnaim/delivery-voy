import 'package:delivery_boy/values/export.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AppController appController = Get.find();
  api() async {
    appController.getApi();
  }

  @override
  void initState() {
    super.initState();
    var delay = Duration(seconds: 1);
    Future.delayed(delay, () async {
      appController.getApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            BounceInDown(
                duration: Duration(milliseconds: 2000),
                child: CustomPngImage(
                  "im1",
                  width: 170,
                  height: 155,
                )),
            SizedBox(
              height: 8.h,
            ),
            FadeInLeft(
                duration: Duration(milliseconds: 2000),
                child: CustomPngImage(
                  "im2",
                  height: 50,
                  width: 220,
                )),
            SizedBox(
              height: 8.h,
            ),
            FadeInRight(
                duration: Duration(milliseconds: 2000),
                child: CustomPngImage(
                  "im3",
                  height: 80,
                  width: 220,
                )),
            IsLoad()
          ],
        )),
      ),
    );
  }
}
