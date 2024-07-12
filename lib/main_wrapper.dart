import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:family_tracker/pages/family_tree_tracker/family_tree_tracker.dart';
import 'package:family_tracker/pages/health_tracker/health_tracker.dart';
import 'package:family_tracker/pages/location_tracker_overview/location_trackter_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapper extends StatefulWidget {
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  //State class
  int _page = 1;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          key: _bottomNavigationKey,
          items: const <Widget>[
            Icon(Icons.health_and_safety_outlined, size: 17),
            Icon(Icons.route_sharp, size: 17),
            Icon(Icons.supervised_user_circle, size: 17),
          ],
          onTap: (index) {
            setState(() {
              // if (index == 0) {
              //   Get.to(() => HealthTracker());
              // } else if (index == 1) {
              //   Get.to(() => LocationTrackerOverview());
              // }
              _page = index;
            });
          },
        ),
        body: _page == 1
            ? LocationTrackerOverview()
            : _page == 0
                ? HealthTracker()
                : FamilyTreeTracker());
  }
}
