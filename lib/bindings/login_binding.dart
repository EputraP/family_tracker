import 'package:family_tracker/controllers/location_controller.dart';
import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/services/location_service.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserAuthController());
    final LocationController locationController =
        Get.put(LocationController(), tag: "Overview");
    LocationService.instance.getUserLocation(controller: locationController);
  }
}
