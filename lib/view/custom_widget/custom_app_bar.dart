import 'package:delivery_boy/controller/controller_cart.dart';
import 'package:get/get.dart';

import 'package:delivery_boy/values/export.dart';

class AppBarCustom extends StatelessWidget {
  final bool? isclicked;
  CartController cartController = Get.find();

  AppBarCustom({Key? key, this.isclicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Row(children: [
        Stack(children: [
          CustomSvgImage(
            imageName: 'top_yallaw',
            width: 110.w,
            height: 85.h,
          ),
          Positioned(
            top: 30.h,
            left: 7.w,
            child: InkWell(
              onTap: () => Get.back(),
              child: CustomSvgImage(
                imageName: 'arrow_back',
                width: 30.w,
                height: 25.h,
                color: Colors.black,
              ),
            ),
          ),
        ]),

        // CustomSvgImage24(
        //   imageName: 'top_yallaw',
        //   width: 107.w,
        //   height: 78.h,
        // ),
        // SizedBox(width: 20.h),
        FadeInRightBig(
          animate: true,
          duration: Duration(milliseconds: 500),
          child: CustomSvgImage(
            imageName: 'logo',
            width: 134.w,
            height: 43.h,
          ),
        ),
        Spacer(),
        SizedBox(
          height: 100.h,
          width: 37.w,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 30.h,
                child: InkWell(
                  onTap: () async {
                    if (SHelper.sHelper.getToken() != null) {
                      // await ServerCart.instance.getCart();
                    }
                    // Get.to(() => FadeInLeft(child: CartScreen()),
                    //     duration: Duration(milliseconds: 200));
                    // }
                    // Get.to(() => FadeInLeft(child: EmptyCartScreen()),
                    //     duration: Duration(milliseconds: 200));
                  },
                  child: CustomSvgImage(
                    imageName: 'cart',
                    width: 28.w,
                    height: 25.h,
                  ),
                ),
              ),
              SHelper.sHelper.getToken() == null
                  ? Positioned(
                      right: 17.w,
                      bottom: 38.h,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 10.r,
                        child: CustomText(
                          text: "0",
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Obx(() => Positioned(
                        right: 17.w,
                        bottom: 38.h,
                        child: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 10.r,
                          child: CustomText(
                            text: cartController
                                .cartData.value.dataCartModel!.countQty
                                .toString(),
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
            ],
          ),
        ),

        SizedBox(width: 10.h),
      ]),
    );
  }
}
