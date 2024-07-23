import 'package:family_tracker/providers/user_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController
    with StateMixin<Map<String, dynamic>> {
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

  String login(String name, String password) {
    try {
      UserProvider().postLoginUser(name, password).then((response) {
        if (response.statusCode == 200) {
          final data = response.body["data"] as Map<String, dynamic>;
          accessToken.value = data["access_token"];
          refreshToken.value = data["refresh_token"];

          change(data, status: RxStatus.success());
          return data["access_token"];
        }
      }, onError: (_) {
        change(null, status: RxStatus.error("Error fetching data from API"));
      });
    } catch (e) {
      return "error";
    }
    return "error";
  }

  bool validateUserLogin(userName, pass) {
    var val = login(userName, pass);

    print('access token: ${accessToken.value}');
    if (val != "") {
      return true;
    }
    return false;
  }
}
