import 'package:family_tracker/services/location_service.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  final RxBool isAccessingLocation = RxBool(false);
  final RxString errorDescription = RxString("");

  final Rx<LocationData?> userLocation = Rx<LocationData?>(null);

  void updateIsAccessingLocation(bool b) {
    isAccessingLocation.value = b;
  }

  void updateUserLocation(LocationData data) {
    userLocation.value = data;
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();

  // }
}
