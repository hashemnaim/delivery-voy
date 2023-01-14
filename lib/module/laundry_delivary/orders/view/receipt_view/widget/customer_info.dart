import 'package:delivery_boy/translations/strings_enum.dart';
import 'package:get/get.dart';

import '../../../model/detailsProduct_model.dart';
import '../../../../../../utils/export.dart';
import '../../../../../Widget/lunchers_helper.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({Key? key, required this.data}) : super(key: key);

  final DataDetails data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CustomText(
                text: '${data.userName ?? ''}',
                color: AppColors.bluColor,
                fontSize: 16.sp),
            Spacer(),
            CustomText(
              text: '# ${data.code}',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ]),
          Row(
            children: [
              Expanded(
                child: CustomText(
                    text: data.address!.address != null
                        ? data.address!.cityName! +
                            "\t - " +
                            data.address!.areaName! +
                            "\n" +
                            "${AppStrings.Building.tr} " +
                            data.address!.building! +
                            "\t " +
                            " - ${AppStrings.floor.tr} " +
                            data.address!.floor! +
                            "\t " +
                            " - ${AppStrings.apartment.tr}  " +
                            data.address!.flat!
                        : AppStrings.noAddress.tr,
                    fontSize: 14.sp,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              InkWell(
                  onTap: () {
                    LuncherHelper.validationHelper
                        .makePhoneCall(data.userPhone!);
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                                text: data.userPhone!,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            Icon(Icons.call_outlined, color: AppColors.bluColor)
                          ])))
            ],
          ),
        ]),
      ),
    );
  }
}
