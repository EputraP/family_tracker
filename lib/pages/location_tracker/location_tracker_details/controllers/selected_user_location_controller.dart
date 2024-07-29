import 'package:get/get.dart';

class SelectedUserLocationController extends GetxController {
  var id = 0.obs;
  var name = "".obs;

  void updateUserId(int userId) => id.value = userId;
}
