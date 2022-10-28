// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ToPrint extends StatelessWidget {
  final Function(GlobalKey key) builder;
  const ToPrint({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(ToPrintController(context: context)); kitchenInvoiceAsImage
    final globalKey = GlobalKey();
    return SingleChildScrollView(
      child: RepaintBoundary(
        key: globalKey,
        child: builder(globalKey),
      ),
    );
  }
}
