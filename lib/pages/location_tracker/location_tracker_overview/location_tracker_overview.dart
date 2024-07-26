import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:family_tracker/controllers/location_controller.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_overview/user_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/flutter_map_widget.dart';

class LocationTrackerOverview extends StatelessWidget {
  LocationTrackerOverview({super.key});
  final FlutterMapWidgetController mapCOverview =
      Get.find<FlutterMapWidgetController>(tag: "Overview");
  final LocationController locationController = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.locationTrackerColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const UserList(),
            const SizedBox(
              height: 20,
            ),
            Text("Accessing Location"),
            Obx(() {
              return locationController.isAccessingLocation.value
                  ? const Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Accessing Location")
                      ],
                    )
                  : locationController.errorDescription.value.isNotEmpty ||
                          locationController.userLocation.value == null
                      ? Column(
                          children: [
                            Text(locationController.errorDescription.value),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Latitude: ${locationController.userLocation.value?.latitude} ",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              "Longitude :  ${locationController.userLocation.value?.longitude} ",
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        );
            }),
            Expanded(
              child: FlutterMapWidget(
                mapC: mapCOverview,
              ),
            )
          ],
        ),
      ),
    );
  }
}
