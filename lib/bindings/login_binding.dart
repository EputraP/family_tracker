import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/pages/login_page/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserAuthController());
    Get.put(LoginController());
  }
}
