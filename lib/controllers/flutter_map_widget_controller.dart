import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapWidgetController extends GetxController {
  var markerSize = 10.0.obs;
  var currentZoom = 6.0.obs;
  var currentCenter = const LatLng(-6.955470354750406, 107.70999737725637).obs;

  var mapController = MapController();

  @override
  void onInit() {
    super.onInit();
    print("map val: map init");
  }

  @override
  void onClose() {
    super.onClose();
    print("map val: map Close");
  }

  void updateMarkerSize(double zoom) =>
      markerSize.value = 10.0 * (zoom / currentZoom.value);
}
