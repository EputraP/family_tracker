import 'dart:async';
import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/providers/user_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapWidgetController extends GetxController {
  var markerSize = 10.0.obs;
  var currentZoom = 6.0.obs;
  var tag = "";
  var currentCenter = const LatLng(-7.392946540801525, 109.94206283417289).obs;
  var mapData = Rx<List<Marker>>([]);
  var mapController = MapController();
  var usersData = [].obs;
  var count = 0.obs;
  var stop = false.obs;
  var currentLocation =
      const LatLng(-7.392946540801525, 109.94206283417289).obs;
  final userAuthController = Get.find<UserAuthController>();

  FlutterMapWidgetController(this.tag);

  void updateMarkerSize(double zoom) =>
      markerSize.value = 10.0 * (zoom / currentZoom.value);

  void updateMapData(List<Marker> data) => mapData.value = data;

  @override
  void onInit() async {
    super.onInit();

    await UserLocationProvider()
        .getUserLocationData(userAuthController.refreshToken.value)
        .then((response) {
      var data = response.body["data"];
      if (data.length > 0) {
        usersData.value = data;
      }
    });
    updateMapData(tag == "Overview"
        ? [
            Marker(
              point: LatLng(-6.955470354750406, 107.70999737725637),
              width: markerSize.value,
              height: markerSize.value,
              alignment: Alignment.center,
              child: Icon(
                Icons.circle_sharp,
                size: markerSize.value,
                color: Colors.blue,
              ),
            ),
            Marker(
              point: const LatLng(-7.796192410193114, 110.37038175433241),
              width: markerSize.value,
              height: markerSize.value,
              alignment: Alignment.center,
              child: Icon(
                Icons.circle_sharp,
                size: markerSize.value,
                color: Colors.red,
              ),
            )
          ]
        : [
            Marker(
              point: const LatLng(-7.796192410193114, 110.37038175433241),
              width: markerSize.value,
              height: markerSize.value,
              alignment: Alignment.center,
              child: Icon(
                Icons.circle_sharp,
                size: markerSize.value,
                color: Colors.red,
              ),
            )
          ]);
    stop.value = false;

    Timer.periodic(
      const Duration(seconds: 10),
      (timer) async {
        await UserLocationProvider()
            .getUserLocationData(userAuthController.refreshToken.value)
            .then((response) {
          var data = response.body["data"];
          if (data.length > 0) {
            usersData.value = data;
          }
        });

        if (stop.value) timer.cancel();
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    stop.value = true;
  }
}
