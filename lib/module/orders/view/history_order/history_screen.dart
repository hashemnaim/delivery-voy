import 'package:delivery_boy/utils/export.dart';

import 'finshed_order_screen.dart';
import 'hold_order_screen.dart';

class HistoryOrderScreen extends StatelessWidget {
  List<String> StatusOrder = ["منتهي", "معلق"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 8.w),
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 14.sp),
                automaticIndicatorColorAdjustment: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
                padding: const EdgeInsets.all(4.0),
                tabs: StatusOrder.map((e) => Tab(text: e)).toList(),
                physics: BouncingScrollPhysics(),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 14.sp, color: AppColors.gray),
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.r),
                )),
            Expanded(
              child: TabBarView(
                children: <Widget>[FinshedHistoryScreen(), HoldHistoryScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
