import 'dart:developer';
import 'package:get/get.dart';
import '../../../../server/base_client.dart';
import '../../../../utils/constants.dart';
import '../model/list_product_model.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  ListProductModel listProductModel = ListProductModel();
  ListProductModel subCategory = ListProductModel();
  List<List<Product>> productListData = [];
  List<Product> productListAdd = [];
  Product detailsProductModel = Product();
  String indexTap = "";
  int idService = -1;
  Rx<int> te = 2.obs;

  // ServerOrder.instance.getOrderDetails(id);
  List<String> meter = [];
  updateProduct(int index, int qty) {
    if (qty >= 0) {
      productListAdd[index].qty = qty;
    }
    update(['details']);
  }

  removeProduct(int index) {
    productListAdd.removeAt(index);
    update(['details']);
  }

  AddProduct(Product product) {
    productListAdd.add(product);
    update(['details']);
  }

  Future<List<List<Product>>> getProductWithSubCategory(int? idCategory) async {
    productListAdd.clear();

    if (productListData.isEmpty) {
      await getSubCategory(idCategory!);
      await BaseClient.baseClient.post(Constants.categoryUrl,
          data: {"cat_id": idCategory}, onSuccess: (response) async {
        listProductModel = ListProductModel.fromJson(response.data);
        for (var element in subCategory.data!) {
          listProductModel.data = listProductModel.allData!
              .where((e) => e.category == element.name!)
              .toList();

          productListData.add(listProductModel.data!);
        }
      });
      return productListData;
    } else {
      return productListData;
    }
  }

  Future<ListProductModel> getProduct(int? idCategory) async {
    await BaseClient.baseClient.post(Constants.categoryUrl, data: {
      "cat_id": idCategory,
    }, onSuccess: (response) async {
      listProductModel = ListProductModel.fromJson(response.data);
    });
    return listProductModel;
  }

  Future<ListProductModel> getSubCategory(int idCategory) async {
    if (indexTap == "") {
      log(subCategory.msg.toString());
      await BaseClient.baseClient.post(Constants.subCategoryUrl, data: {
        "cat_id": idCategory,
      }, onSuccess: (response) async {
        subCategory = ListProductModel.fromJson(response.data);
        indexTap = subCategory.data![0].name!;
      });
      return subCategory;
    } else {
      return subCategory;
    }
  }
}
