import '../../../../../utils/export.dart';
import '../../../controller/product_controller.dart';
import '../../../model/product_model.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  final ProductController productController;
  ItemProduct({required this.productController, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
            boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey[300]!)]),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
              child: Column(
            children: [
              CustomText(
                text: "X " + product.qty.toString() + " " + product.name!,
                color: Colors.white,
              ),
              CustomText(
                text: product.category!,
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
