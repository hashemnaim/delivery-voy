import 'package:delivery_boy/model/catogorie_modal.dart';
import 'package:get/get.dart';

class CategorieController extends GetxController {
  Rx<CategorieModel> allCategories = CategorieModel().obs;
  int selected = -1;
  int selected2 = -1;
  int indexHomeScreen = 0;
  int selectedkello = 0;
  int selectedTallerken = 0;

  getSelect() {
    selected = -1;
    selected2 = -1;
  }

  setSelect(int index) {
    Future.delayed(Duration(milliseconds: selected == index ? 200 : 0), () {
      selected = selected == index ? -1 : index;
      selected2 = selected2 != index ? -1 : index;

      update();
    });
    // Future.delayed(Duration(milliseconds: selected != index ? 200 : 0), () {
    //   selected2 = selected2 == index ? -1 : index;
    //   update();
    // });
    // if (allProdact.value.allProductData.productData[index].dough.length != 0) {
    //   selectedTallerken = 0;
    //   selectedkello = 0;
    //   update();
    // }
  }

  setSelectd(int value) {
    this.indexHomeScreen = value;
    update();
  }

  bool isclicked = false;
  setisclicked(bool value) {
    this.isclicked = value;
    update();
  }

  double totalPrice = 0.0;
  double price = 0.0;
  // plusTotal(int index, {int tallerken = 0}) {
  //   totalPrice = detailsProdact.value.dataDetailsProduct.dough.length == 0
  //       ? 0.0
  //       : double.parse(detailsProdact
  //               .value.dataDetailsProduct.dough[tallerken].data[index].price ??
  //           "0");
  //   update();
  // }

  plusPrice(double pricei) {
    price = price + pricei;
    update();
  }

  removePrice(double pricei) {
    price = price - pricei;
    update();
  }
}
