import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/export.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(7),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _userInfoWidget(
                      context: context, text: SHelper.sHelper.getValue("name")),
                  SizedBox(height: 15),
                  _userInfoWidget(
                      context: context,
                      text: SHelper.sHelper.getValue("phone")),
                  SizedBox(height: 15),
                  // _userInfoWidget(
                  //     context: context,
                  //     text: SHelper.sHelper.getValue("address")),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      await SHelper.sHelper.clearSp();
                      Get.offNamed(Routes.SIGNIN);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          CustomPngImage(
                            "log_out",
                            width: 40.w,
                            height: 40.h,
                          ),
                          SizedBox(width: 19),
                          CustomText(
                            text: AppStrings.signout.tr,
                            fontSize: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _userInfoWidget({String? text, required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
          border: Border.all(color: AppColors.blackLight.withOpacity(0.4))),
      child: CustomText(
        text: text ?? '',
      ),
    );
  }
}
