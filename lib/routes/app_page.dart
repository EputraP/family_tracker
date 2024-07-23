import 'package:family_tracker/bindings/map_binding.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/views/location_tracker_details.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_overview/location_tracker_overview.dart';
import 'package:family_tracker/pages/login_page/views/login_page.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:get/get.dart';

class AppPage {
  static final appPage = [
    GetPage(
      name: LocationTrackerNavigation.locationOverview,
      page: () => LocationTrackerOverview(),
    ),
    GetPage(
        name: LocationTrackerNavigation.locationDetail,
        page: () => LocationTrackerDetails(),
        binding: MapBindingDetail()),
  ];
}
