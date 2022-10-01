import 'package:delivery_boy/model/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
}
