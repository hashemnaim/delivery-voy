import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

import 'invoice_settings.controller.dart';

class Capture {
  static InvoiceSettingsController inoviceControl =
      Get.find<InvoiceSettingsController>();

  static Future<void> invoiceCapture(GlobalKey key) async {
    inoviceControl.invoiceAsImage.value = await capture(key);
    // Get.back();
  }

  static Future<List<int>> capture(GlobalKey key) async {
    RenderRepaintBoundary? boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    return pngBytes.toList();
  }
}
