import 'package:family_tracker/main_wrapper.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/location_tracker_details.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_overview/location_trackter_overview.dart';
import 'package:family_tracker/pages/login_page/login_page.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), //MainWrapper(),
      getPages: [
        GetPage(
            name: LocationTrackerNavigation.locationOverview,
            page: () => LocationTrackerOverview()),
        GetPage(
            name: LocationTrackerNavigation.locationDetail,
            page: () => LocationTrackerDetails()),
      ],
    );
  }
}
