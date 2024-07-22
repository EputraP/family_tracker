import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:family_tracker/controllers/location_controller.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/controllers/draggable_bottom_sheet_controller.dart';
import 'package:family_tracker/services/location_service.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapBindingOverview implements Bindings {
  @override
  void dependencies() {
    final mapController =
        Get.put(FlutterMapWidgetController("Overview"), tag: "Overview");

    final LocationController locationController =
        Get.put(LocationController(), tag: "Overview");
    LocationService.instance.getUserLocation(controller: locationController);
  }
}

class MapBindingDetail implements Bindings {
  @override
  void dependencies() {
    Get.put(FlutterMapWidgetController("Detail"), tag: "Detail");
    Get.put(DraggableBottomSheetController());
    Get.put(LocationController(), tag: "Detail");
  }
}
