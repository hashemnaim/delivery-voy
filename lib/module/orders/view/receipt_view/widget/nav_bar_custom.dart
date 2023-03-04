import 'package:delivery_boy/module/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../translations/strings_enum.dart';
import '../../../../../utils/color.dart';
import '../../../../controller_app.dart';

// ignore: must_be_immutable
class NavBottomBarCustom extends GetView<AppController> {
  NavBottomBarCustom({this.isHome = true});
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        id: "navBottomBar",
        builder: (controller) {
          return BottomAppBar(
            child: Container(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navBarItem(
                    text: AppStrings.receive.tr,
                    icon: Icons.local_laundry_service,
                    index: 0,
                  ),
                  navBarItem(
                    text: AppStrings.delivery.tr,
                    icon: Icons.delivery_dining_outlined,
                    index: 1,
                  ),
                  navBarItem(
                    text: AppStrings.history.tr,
                    icon: Icons.history_rounded,
                    index: 2,
                  ),
                  navBarItem(
                    text: AppStrings.myProfile.tr,
                    icon: Icons.person,
                    index: 3,
                  ),
                ],
              ),
            ),
            shape: CircularNotchedRectangle(),
          );
        });
  }

  Widget navBarItem(
      {required String text, IconData? icon, int? index, double size = 28}) {
    return Container(
      width: 70.w,
      child: InkWell(
        onTap: () => {
          controller.changeIndexBar(index, isHome),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.h,
            ),
            if (icon == "")
              SizedBox.shrink()
            else
              Icon(icon,
                  color: index == controller.selectedPageIndex
                      ? AppColors.primary
                      : Colors.grey),
            CustomText(
              text: text,
              color: index == controller.selectedPageIndex
                  ? AppColors.primary
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
