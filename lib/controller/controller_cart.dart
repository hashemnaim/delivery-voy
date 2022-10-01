import 'package:delivery_boy/model/cart_modal.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  Rx<CartModel> cartData = CartModel().obs;
  RxInt deilvery = 1.obs;
  RxInt payment = 1.obs;
  RxInt onlinPayment = 0.obs;
}
