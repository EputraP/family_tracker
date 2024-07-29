import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/controllers/draggable_bottom_sheet_controller.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/controllers/selected_user_location_controller.dart';
import 'package:get/get.dart';

class MapBindingOverview implements Bindings {
  @override
  void dependencies() {
    Get.put(FlutterMapWidgetController("Overview"), tag: "Overview");
  }
}

class MapBindingDetail implements Bindings {
  @override
  void dependencies() {
    Get.put(FlutterMapWidgetController("Detail"), tag: "Detail");
    Get.put(DraggableBottomSheetController());
    Get.put(SelectedUserLocationController());
  }
}
