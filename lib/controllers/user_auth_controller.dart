import 'dart:async';
import 'package:family_tracker/providers/user_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserAuthController extends GetxController {
  var isObscure = true.obs;
  var refreshToken = "".obs;
  var accessToken = "".obs;
  var userId = "".obs;
  var userName = "".obs;
  var isAuth = false.obs;

  var userNameTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();

    Timer.periodic(const Duration(seconds: 30), (timer) async {
      if (refreshToken.value != "") {
        // Map<String, dynamic> decodedToken =
        //     JwtDecoder.decode(accessToken.value);
        await UserProvider()
            .putSetIsOnline(int.parse(userId.value), refreshToken.value);
      }
    });
  }

  @override
  void onClose() {
    passwordTextController.dispose();
    userNameTextController.dispose();

    super.onClose();
  }

  void changeIsObscureVal() => isObscure.value = !isObscure.value;

  void changeIsAuthVal(val) => isAuth.value = val;

  void emptyToken() {
    refreshToken.value = "";
    accessToken.value = "";
  }

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
          var data = response.body["data"] as Map<String, dynamic>;
          accessToken.value = data["access_token"];
          refreshToken.value = data["refresh_token"];
          isAuth.value = true;

          Map<String, dynamic> decodedRefreshToken =
              JwtDecoder.decode(data["refresh_token"]);
          userName.value = decodedRefreshToken["username"];
          userId.value = decodedRefreshToken["user_id"];

          return data["refresh_token"];
        }
      }, onError: (_) {
        // change(null, status: RxStatus.error("Error fetching data from API"));
      });
    } catch (e) {
      return "error";
    }
    return "nothing";
  }

  Future<void> logout() async {
    try {
      await UserProvider().getLogoutUser(userId.value);
    } catch (e) {}
  }

  Future<bool> validateUserLogin(userName, pass) async {
    await login(userName, pass);

    if (refreshToken.value != "") {
      return true;
    }
    return false;
  }
}
