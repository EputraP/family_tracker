import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_overview/user_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/flutter_map_widget.dart';

class LocationTrackerOverview extends StatelessWidget {
  LocationTrackerOverview({super.key});
  final FlutterMapWidgetController mapCOverview =
      Get.find<FlutterMapWidgetController>(tag: "Overview");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsCollection.locationTrackerColor,
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserList(
                  data: mapCOverview.usersData,
                  isLoading: mapCOverview.isMapDataLoading.value,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FlutterMapWidget(
                    mapC: mapCOverview,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
