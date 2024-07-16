import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
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
}
