import 'package:family_tracker/pages/health_tracker/health_tracker.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthTrackerRoute extends StatelessWidget {
  const HealthTrackerRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(HealthTrackerNavigation.id),
      initialRoute: HealthTrackerNavigation.healthOverview,
      onGenerateRoute: (settings) {
        if (settings.name == HealthTrackerNavigation.healthOverview) {
          return GetPageRoute(
            routeName: HealthTrackerNavigation.healthOverview,
            page: () => const HealthTracker(),
          );
        }
      },
    );
  }
}
