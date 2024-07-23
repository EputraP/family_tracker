import 'package:family_tracker/providers/user_provider.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  var refreshToken = "123".obs;
  var accessToken = "123".obs;

  void snackBarError(String msg) {
    Get.snackbar(
      "ERROR",
      msg,
      duration: const Duration(seconds: 2),
    );
  }

  Future login(String name, String password) async {
    await UserProvider().postLoginUser(name, password).then((val) {
      refreshToken.value = val["data"]["refresh_token"];
      accessToken.value = val["data"]["access_token"];
    });
  }
}
