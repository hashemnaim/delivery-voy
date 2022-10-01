import 'package:delivery_boy/values/export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBarItem {
  String? icon;
  String? titel;
  bool hasNotification;

  CustomAppBarItem({this.icon, this.hasNotification = false, this.titel});
}

class CustomBottomAppBar extends StatefulWidget {
  final ValueChanged<int?>? onTabSelected;
  final List<CustomAppBarItem>? items;

  CustomBottomAppBar({this.onTabSelected, this.items});

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int? selectedIndex = 0;
  AppController appController = Get.find();

  void _updateIndex(index) {
    widget.onTabSelected!(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabIcon(
          index: index, item: widget.items![index], onPressed: _updateIndex);
    });
    items.insert(items.length >> 1, _buildMiddleSeparator());

    return BottomAppBar(
      color: AppColors.blackDark,
      // color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: AppColors.blackDark
          ),
          height: 40.h,
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
      ),
      shape: CircularNotchedRectangle(),
    );
  }

  Widget _buildMiddleSeparator() {
    return Expanded(
      child: SizedBox(
        height: 30.0.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 24.0.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon(
      {int? index, required CustomAppBarItem item, ValueChanged<int?>? onPressed}) {
    double sizeH = MediaQuery.of(context).size.height;
    return Expanded(
      child: SizedBox(
        height: sizeH * 0.1,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
              onTap: () => onPressed!(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  SvgPicture.asset(
                    item.icon!,
                    height: 17,
                    color: appController.indexNav == 4
                        ? Colors.white
                        : appController.indexNav != index
                            ? Colors.white
                            : AppColors.primary,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  CustomText(
                    text: item.titel,
                    // style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                    color: appController.indexNav == 4
                        ? Colors.white
                        : appController.indexNav != index
                            ? Colors.white
                            : AppColors.primary,
                  ),
                  // ),
                ],
              )),
        ),
      ),
    );
  }
}
