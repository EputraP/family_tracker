import 'dart:async';
import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/providers/user_location_provider.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  final RxBool isAccessingLocation = RxBool(false);
  final RxString errorDescription = RxString("");

  final Rx<LocationData?> userLocation = Rx<LocationData?>(null);
  final userAuthController = Get.find<UserAuthController>();
  final location = Location();

  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 15), (timer) async {
      location.onLocationChanged.listen((LocationData currentLocation) {
        updateUserLocation(currentLocation);
      });

      await UserLocationProvider().putUpdateUserLocation(
          int.parse(userAuthController.userId.value),
          (userLocation.value?.latitude).toString(),
          (userLocation.value?.longitude).toString(),
          userAuthController.refreshToken.value);
    });
    super.onInit();
  }

  void updateIsAccessingLocation(bool b) {
    isAccessingLocation.value = b;
  }

  void updateUserLocation(LocationData data) {
    userLocation.value = data;
  }
}
