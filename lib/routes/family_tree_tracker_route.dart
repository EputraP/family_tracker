import 'package:family_tracker/pages/family_tree_tracker/family_tree_tracker.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyTreeTrackerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(FamilyTreeTrackerNavigation.id),
      initialRoute: FamilyTreeTrackerNavigation.familyTreeOverview,
      onGenerateRoute: (settings) {
        if (settings.name == FamilyTreeTrackerNavigation.familyTreeOverview) {
          return GetPageRoute(
            routeName: FamilyTreeTrackerNavigation.familyTreeOverview,
            page: () => FamilyTreeTracker(),
          );
        }
      },
    );
  }
}
