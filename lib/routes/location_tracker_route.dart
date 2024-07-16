import 'package:family_tracker/pages/location_tracker/location_tracker_overview/location_tracker_overview.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationTrackerRoute extends StatelessWidget {
  const LocationTrackerRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(LocationTrackerNavigation.id),
      initialRoute: LocationTrackerNavigation.locationOverview,
      onGenerateRoute: (settings) {
        // if (settings.name == LocationTrackerNavigation.locationDetail) {
        //   return GetPageRoute(
        //     routeName: LocationTrackerNavigation.locationDetail,
        //     page: () => LocationTrackerDetails(),
        //   );
        // } else {
        //   return GetPageRoute(
        //     routeName: LocationTrackerNavigation.locationOverview,
        //     page: () => LocationTrackerOverview(),
        //   );
        // }
        return GetPageRoute(
          routeName: LocationTrackerNavigation.locationOverview,
          page: () => const LocationTrackerOverview(),
        );
      },
    );
  }
}
