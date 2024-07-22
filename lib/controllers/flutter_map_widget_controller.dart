import 'dart:async';
import 'package:family_tracker/controllers/location_controller.dart';
import 'package:family_tracker/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class FlutterMapWidgetController extends GetxController {
  var markerSize = 10.0.obs;
  var currentZoom = 6.0.obs;
  var tag = "";
  var currentCenter = const LatLng(-7.392946540801525, 109.94206283417289).obs;
  var mapData = Rx<List<Marker>>([]);
  var mapController = MapController();
  var count = 0.obs;
  var stop = false.obs;
  var currentLocation =
      const LatLng(-7.392946540801525, 109.94206283417289).obs;

  FlutterMapWidgetController(this.tag);

  // void changeScreenVal(val) => tag.value = val;

  void updateMarkerSize(double zoom) =>
      markerSize.value = 10.0 * (zoom / currentZoom.value);

  void updateMapData(List<Marker> data) => mapData.value = data;

  @override
  void onInit() {
    super.onInit();
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
    // final LocationController locationController = Get.put(LocationController());
    // Get.find<LocationController>(tag: "Overview");
    Timer.periodic(const Duration(seconds: 5), (timer) {
      // count++;
      print("me val: ${count.value}");
      // LocationService.instance.getUserLocation(controller: locationController);
      if (stop.value) timer.cancel();
    });
  }

  @override
  void onClose() {
    super.onClose();
    stop.value = true;
  }
}
