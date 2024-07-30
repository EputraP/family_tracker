import 'package:family_tracker/components/flutter_map_widget.dart';
import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/views/dragable_bottom_sheet.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/views/floating_button_positioned.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationTrackerDetails extends StatelessWidget {
  LocationTrackerDetails({super.key});
  final mapCDetail = Get.find<FlutterMapWidgetController>(tag: "Detail");
  final dynamic userId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    mapCDetail.updateUserId(int.parse(userId["userId"]));
    var data = mapCDetail.userSelectedData;
    print("data detail: ${data}");
    return Scaffold(
      backgroundColor: ColorsCollection.locationTrackerColor,
      body: Stack(
        children: [
          FlutterMapWidget(mapC: mapCDetail),
          FloatingButtonPositioned(
            userId: data["user_id"],
            isSos: data["is_sos"],
          ),
          DraggableBottomSheet(data: data)
        ],
      ),
    );
  }
}
