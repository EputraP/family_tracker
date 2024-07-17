import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;

  var userNameTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void onClose() {
    passwordTextController.dispose();
    userNameTextController.dispose();

    super.onClose();
  }

  void changeIsObscureVal() => isObscure.value = !isObscure.value;

  bool validateUserLogin(userName, pass) {
    if (userName == "Putra" && pass == "password123456") {
      return true;
    }
    return false;
  }
}
