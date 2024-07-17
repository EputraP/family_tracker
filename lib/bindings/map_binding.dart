import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:get/get.dart';

class MapBindingOverview implements Bindings {
  @override
  void dependencies() {
    Get.put(FlutterMapWidgetController(), tag: "Overview");
  }
}

class MapBindingDetail implements Bindings {
  @override
  void dependencies() {
    Get.put(FlutterMapWidgetController(), tag: "Detail");
  }
}
