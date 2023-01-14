import 'dart:io';
import 'package:delivery_boy/module/Widget/custom_dialoug.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';
import '../../utils/constants.dart';
import '../../utils/export.dart';

class ServerProfile {
  ServerProfile._();
  static ServerProfile instance = ServerProfile._();
  Dio? dio;
  AppController appController = getx.Get.find();

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
      Response response = await dio!.post(Constants.updateProfileUrl,
          data: {
            "password_current": password,
            "password": newPassword,
            "password_confirmation": coPassword
          },
          options: Options(
              headers: {'Authorization': 'Bearer ${appController.token}'}));
      if (response.data['error'] != null) {
        // setToast("Invalid current pass", Colors.red);
      } else {
        // appController.setIndexProfile(4);
        // getx.Get.offAll(() => ProfileMainScreen());

        CustomDialougs.utils
            .showDialoug(messageKey: 'Passordet ble endret', titleKey: '');
      }
      // setToast("Passordet ble endret", Colors.green);
      // }
      return response.data;
    } catch (e) {
      CustomDialougs.utils.showDialoug(
          messageKey: 'Det nåværende passordet er en feil', titleKey: '');
    }
  }

/////////////////////////////////////////////////////////////////////
  // signOut() async {
  //   appController.clearAllVariable();
  // }

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
      var response = await dio!.post(Constants.profileUrl,
          data: formData,
          options: Options(
              headers: {'Authorization': 'Bearer ${appController.token}'}));

      Map<String, dynamic>? mmnlist1 =
          (response.data as Map?) as Map<String, dynamic>?;

      Function function = () {
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

////////////////////////////////////////////////////////////////////////////////

}
