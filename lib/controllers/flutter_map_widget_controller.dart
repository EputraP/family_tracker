import 'dart:async';
import 'dart:convert';
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
        List<Marker> dataMapArray = [];

        usersData.value = data;

        for (var i = 0; i < data.length; i++) {
          Map valueMap = json.decode(data[i]["icon_color"]);
          dataMapArray.add(
            Marker(
              point: LatLng(
                data[i]["lat"],
                data[i]["long"],
              ),
              width: markerSize.value,
              height: markerSize.value,
              alignment: Alignment.center,
              child: Icon(
                Icons.circle_sharp,
                size: markerSize.value,
                color: Color.fromARGB(
                  255,
                  valueMap["red"],
                  valueMap["green"],
                  valueMap["blue"],
                ),
              ),
            ),
          );
        }
        updateMapData(dataMapArray);
      }
    });

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
