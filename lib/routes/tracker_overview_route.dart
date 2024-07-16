import 'package:family_tracker/pages/family_tree_tracker/family_tree_tracker.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackerOverviewRoute extends StatelessWidget {
  const TrackerOverviewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(TrackerOverviewNavigation.id),
      initialRoute: TrackerOverviewNavigation.trackerOverview,
      onGenerateRoute: (settings) {
        if (settings.name == TrackerOverviewNavigation.trackerOverview) {
          return GetPageRoute(
            routeName: TrackerOverviewNavigation.trackerOverview,
            page: () => TrackerOverview(),
          );
        }
      },
    );
  }
}
