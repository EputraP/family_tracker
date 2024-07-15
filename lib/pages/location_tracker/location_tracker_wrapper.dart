import 'package:family_tracker/pages/location_tracker/location_tracker_details/location_tracker_details.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_overview/location_trackter_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// the navigation inside the dialog
class LocationTrackerNavigation {
  LocationTrackerNavigation._();
  static const id = 0;
  static const locationOverview = '/location-overview';
  static const locationDetail = '/location-detail';
}

// our wrapper, where our main navigation will navigate to
class LocationTrackerWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(LocationTrackerNavigation.id),
      onGenerateRoute: (settings) {
        // navigate to a route by name with settings.name
        if (settings.name == LocationTrackerNavigation.locationDetail) {
          return GetPageRoute(
            routeName: LocationTrackerNavigation.locationDetail,
            page: () => LocationTrackerDetails(),
          );
        } else {
          return GetPageRoute(
            routeName: LocationTrackerNavigation.locationOverview,
            page: () => LocationTrackerOverview(),
          );
        }
      },
    );
  }
}
