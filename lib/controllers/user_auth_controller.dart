import 'dart:convert';

import 'package:family_tracker/providers/user_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserAuthController extends GetxController {
  var isObscure = true.obs;
  var refreshToken = "".obs;
  var accessToken = "".obs;

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

  void snackBarError(String msg) {
    Get.snackbar(
      "ERROR",
      msg,
      duration: const Duration(seconds: 2),
    );
  }

  Future<String> login(String name, String password) async {
    try {
      await UserProvider().postLoginUser(name, password).then((response) {
        if (response.statusCode == 200) {
          print('access token API: executed');
          var data = response.body["data"] as Map<String, dynamic>;
          accessToken.value = data["access_token"];
          refreshToken.value = data["refresh_token"];

          // change(data, status: RxStatus.success());
          print('access token API: ${data["access_token"]}');
          return data["access_token"];
        }
      }, onError: (_) {
        // change(null, status: RxStatus.error("Error fetching data from API"));
      });
    } catch (e) {
      return "error";
    }
    return "nothing";
  }

  Future<bool> validateUserLogin(userName, pass) async {
    print('access token: executed');
    var val = await login(userName, pass);
    print('access token val: ${jsonEncode(val)}');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken.value);
    print('access token: executed after');
    print('access token: ${jsonEncode(decodedToken)}');
    if (val != "") {
      return true;
    }
    return false;
  }
}
