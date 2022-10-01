import 'dart:io';
import 'package:delivery_boy/controller/controller_profile.dart';
import 'package:delivery_boy/model/user_model.dart';
import 'package:delivery_boy/values/export.dart';
import 'package:delivery_boy/view/custom_widget/custom_dialoug.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';

class ServerProfile {
  ServerProfile._();
  static ServerProfile instance = ServerProfile._();
  Dio? dio;
  AppController appController = getx.Get.find();
  ProfileController profileController = getx.Get.find();

  initApi() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  updatePasswordProfile(
      String password, String newPassword, String coPassword) async {
    initApi();

    try {
      appController.pr.show(message: '');

      Response response = await dio!.post(url + 'update_profile',
          data: {
            "password_current": password,
            "password": newPassword,
            "password_confirmation": coPassword
          },
          options: Options(
              headers: {'Authorization': 'Bearer ${appController.token}'}));
      if (response.data['error'] != null) {
        appController.pr.hide();

        // setToast("Invalid current pass", Colors.red);
      } else {
        appController.pr.hide();

        getProfile();

        // appController.setIndexProfile(4);
        // getx.Get.offAll(() => ProfileMainScreen());

        CustomDialougs.utils
            .showDialoug(messageKey: 'Passordet ble endret', titleKey: '');
      }
      // setToast("Passordet ble endret", Colors.green);
      // }
      return response.data;
    } catch (e) {
      appController.pr.hide();

      CustomDialougs.utils.showDialoug(
          messageKey: 'Det nåværende passordet er en feil', titleKey: '');
    }
  }

////////////////////////////////////////////////////////////////////
  updateNameProfile(
    String name,
  ) async {
    initApi();
    appController.pr.show(message: '');

    try {
      var response = await dio!.post(url + 'update_profile',
          data: {
            "name": name,
          },
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${appController.token}'
          }));

      // setToast("Navnet ble endret", Colors.green);
      getProfile();
      appController.pr.hide();

      return response.data;
    } catch (e) {
      CustomDialougs.utils.showDialoug(messageKey: 'error', titleKey: 'error');
    }
  }

/////////////////////////////////////////////////////////////////////
  // signOut() async {
  //   appController.clearAllVariable();
  // }

///////////////////////////////////////////////////////////////////
  getProfile() async {
    initApi();

    try {
      Response response = await dio!.post(url + 'getUser',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${SHelper.sHelper.getToken()}'
          }));

      profileController.userModel.value = UserModel.fromJson(response.data);
    } catch (e) {
      return CustomDialougs.utils
          .showDialoug(messageKey: 'error', titleKey: 'error');
    }
  }

///////////////////////////////////////////////////////////////////
  Future<Map<String, dynamic>?> getShowVersion() async {
    var dio = Dio();

    try {
      var response = await dio.get(
        url + 'setting/show',
      );

      Map<String, dynamic>? map = response.data;

      return map;
    } catch (e) {
      return CustomDialougs.utils
          .showDialoug(messageKey: 'error', titleKey: 'error');
    }
  }

  ///////////////////////////////////////////////////////////////////
  setAddress(int id) async {
    initApi();
    appController.pr.show(message: '');
    try {
      var response = await dio!.post(url + 'setAddress',
          data: {"id": id},
          options: Options(
              headers: {'Authorization': 'Bearer ${appController.token}'}));
      appController.pr.hide();
      return response.data;
    } catch (e) {
      appController.pr.hide();

      return CustomDialougs.utils
          .showDialoug(messageKey: 'new-entrees', titleKey: 'error');
    }
  }

///////////////////////////////////////////////////////////////////
  setProfile(
      {String? name,
      String? email,
      String? mobile,
      String? countryid,
      File? image}) async {
    initApi();
    FormData formData = image != null
        ? FormData.fromMap({
            "name": name,
            "email": email,
            "mobile": mobile,
            "country_id": countryid,
            "image": await MultipartFile.fromFile(image.path,
                filename: image.path.substring(image.path.lastIndexOf('/') + 1))
          })
        : FormData.fromMap({
            "name": name,
            "email": email,
            "mobile": mobile,
            "country_id": countryid
          });

    try {
      var response = await dio!.post(url + '/user/set_profile',
          data: formData,
          options: Options(
              headers: {'Authorization': 'Bearer ${appController.token}'}));

      Map<String, dynamic>? mmnlist1 = (response.data as Map?) as Map<String, dynamic>?;

      Function function = () {
        getProfile();
        // getx.Get.off(UserProfile());
      };
      CustomDialougs.utils
          .showDialoug(messageKey: 'error', titleKey: 'success', fun: function);
      // // getProfile();
      // Get.back();

      return mmnlist1;
    } catch (e) {
      CustomDialougs.utils.showDialoug(messageKey: 'error', titleKey: 'error');
    }
  }

  addressList() async {
    initApi();
    try {
      await dio!.get(
        url + 'addressList',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${appController.token}'
        }),
      );
    } catch (e) {
      appController.pr.hide();
    }
  } ///////////////////////////////////////////////////////////////////////////////

  addAddress(
    String gate,
    String husnr,
    String postnummer,
    String poststed,
  ) async {
    initApi();
    appController.pr.show(message: '');
    try {
      await dio!.post(
        url + 'addAddress',
        data: {
          "gate": gate,
          "husnr": husnr,
          "postnummer": postnummer,
          "poststed": poststed,
        },
        options: Options(
            headers: {'Authorization': 'Bearer ${appController.token}'}),
      );
      // getProfile();

      appController.pr.hide();
    } catch (e) {
      appController.pr.hide();
    }
  }

////////////////////////////////////////////////////////////////////////////////
  deleteAddress(int id) async {
    initApi();
    appController.pr.show(message: '');
    try {
      await dio!.post(
        url + 'deleteAddress',
        data: {"id": id},
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${appController.token}'
        }),
      );

      appController.pr.hide();
    } catch (e) {
      appController.pr.hide();
    }
  }
////////////////////////////////////////////////////////////////////////////////

}
