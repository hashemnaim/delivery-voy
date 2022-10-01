import 'package:delivery_boy/controller/controller_categorie.dart';
import 'package:delivery_boy/model/catogorie_modal.dart';
import 'package:delivery_boy/view/custom_widget/custom_dialoug.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:delivery_boy/values/export.dart';

class ServerCategorie {
  ServerCategorie._();
  static ServerCategorie instance = ServerCategorie._();
  AppController appController = getx.Get.find();
  CategorieController categrieController = getx.Get.find();

  Dio? dio;
  initApi() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

///////////////////////////////////////////////////////////////////
  getAllCategories() async {
    initApi();

    try {
      Response response = await dio!.post(url + 'categories');

      if (response.statusCode == 200) {
        categrieController.allCategories.value =
            CategorieModel.fromJson(response.data);
      }
    } catch (e) {
      return CustomDialougs.utils
          .showDialoug(messageKey: 'categories', titleKey: 'error');
    }
  }

///////////////////////////////////////////////////////////////////
  // getProduct(int id) async {
  //   initApi();

  //   try {
  //     Response response = await dio.post(url + 'categories/$id');

  //     if (response.statusCode == 200) {
  //       categrieController.allProdact.value =
  //           ProductModel.fromJson(response.data);
  //     }
  //   } catch (e) {
  //     return CustomDialougs.utils
  //         .showDialoug(messageKey: 'category/$id', titleKey: 'error');
  //   }
  // }

// //////////////////////////////////////////////////////////////////////////////////
}
