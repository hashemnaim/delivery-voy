// import 'package:delivery_boy/module/orders/model/detailsProduct_model.dart';
// import 'package:delivery_boy/module/print/capture.dart';
// import 'package:delivery_boy/module/print/toPrint.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import '../orders/model/product_order_model.dart';

// class InvoiceSettingsController extends GetxController {
//   // InvoiceSettingsModel invoiceSettings = InvoiceSettingsModel();

//   // Uint8List testImage = x.value as Uint8List; // Uint8List(5);
//   RxList<int> invoiceAsImage = Uint8List(0).toList().obs;
//   //GlobalKey key = GlobalKey();
//   double fontSize = 22;
//   Future<void> invoiceBuilder(DataDetails orderDetails) async {
//     GlobalKey key = GlobalKey();
//     Get.to(
//       () => Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               flex: 1,
//               child: ToPrint(
//                 builder: (builderKey) {
//                   key = builderKey;
//                   return SizedBox(
//                     // width: 340,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // SizedBox(
//                         //     width: 80,
//                         //     height: 80,
//                         //     child: CustomPngImage("im2")),
//                         Center(
//                           child: Text(
//                             'Mr clean',
//                             style: const TextStyle(
//                                 fontSize: 25, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         //order number and date
//                         Text(
//                           'رقم الفاتورة #${orderDetails.code}',
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           ' التاريخ: ${orderDetails.deliveryDate}',
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.bold),
//                         ),

//                         //order ...

//                         Text(
//                           'اسم المستخدم: ' + orderDetails.userName!,
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'طرق الدفع : ' + "كاش",
//                           style: TextStyle(
//                               fontSize: 25,
//                               height: 2,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         //company name

//                         // //HR
//                         const Divider(),
//                         //Description Qty Amount
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: Text(
//                                 'الصنف',
//                                 style: TextStyle(
//                                     fontSize: 25, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Expanded(
//                               child: Text('الكمية ',
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'السعر',
//                                 style: TextStyle(
//                                     fontSize: 25, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'الاجمالي',
//                                 style: TextStyle(
//                                     fontSize: 25, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Divider(
//                           color: Colors.black,
//                         ),
//                         //bill
//                         if (orderDetails.details![0].productOrder!.isNotEmpty)
//                           for (ProductOrder product
//                               in orderDetails.details![0].productOrder!)
//                             Row(
//                               children: [
//                                 //Description
//                                 Expanded(
//                                   flex: 2,
//                                   child: Container(
//                                     width: 100,
//                                     child: Text(
//                                       '${product.name}',
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),

//                                 //Qty
//                                 Expanded(
//                                   child: Text(
//                                     product.qty!.toString(),
//                                     style: TextStyle(
//                                         fontSize: fontSize,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),

//                                 Expanded(
//                                   child: Text(
//                                     product.total_product!.toString(),
//                                     style: TextStyle(
//                                         fontSize: fontSize,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),

//                                 //Amount
//                                 Expanded(
//                                   child: Text(
//                                     product.total_product!.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         fontSize: fontSize,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                         //HR
//                         const Divider(
//                           color: Colors.black,
//                         ),

//                         //Subtotal
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Flexible(
//                                 child: Text(
//                               "مجموع المنتجات",
//                               style: TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.bold),
//                             )),
//                             Flexible(
//                                 child: Text(
//                               '${orderDetails.subTotal} ريال',
//                               style: const TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.bold),
//                             )),
//                           ],
//                         ),
//                         //Discount
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Flexible(
//                                 child: Text(
//                               'رسوم التوصيل',
//                               style: TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.bold),
//                             )),
//                             Flexible(
//                                 child: Text(
//                               '${orderDetails.deliveryPrice.toString()} ريال',
//                               style: const TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.bold),
//                             )),
//                           ],
//                         ),
//                         //Added Discount

//                         //Total After Discount
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Flexible(
//                                 child: Text(
//                               "المبلغ الاجمالي",
//                               style: TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.bold),
//                             )),
//                             Flexible(
//                                 child: Text(
//                               (orderDetails.total! +
//                                           orderDetails.deliveryPrice!)
//                                       .toString() +
//                                   " ريال",
//                               style: const TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.bold),
//                             )),
//                           ],
//                         ),

//                         //HR
//                         const Divider(
//                           color: Colors.black,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     await Future.delayed(const Duration(milliseconds: 500));
//     await Capture.invoiceCapture(key);
//   }
// }
