import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/routes/tracker_overview_route.dart';
import 'package:family_tracker/routes/health_tracker_route.dart';
import 'package:family_tracker/routes/location_tracker_route.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  //State class
  int _page = 1;
  List<Color> backgroundScreenColor = [
    ColorsCollection.healthTrackerColor,
    ColorsCollection.trackerOverviewColor,
    ColorsCollection.locationTrackerColor,
  ];

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: backgroundScreenColor[_page],
          index: 1,
          height: 50,
          key: _bottomNavigationKey,
          items: const <Widget>[
            Icon(Icons.health_and_safety_outlined, size: 17),
            Icon(Icons.summarize, size: 17),
            Icon(Icons.route_sharp, size: 17),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: SafeArea(
          child: IndexedStack(
            index: _page,
            children: [
              HealthTrackerRoute(),
              TrackerOverviewRoute(),
              LocationTrackerRoute(),
            ],
          ),
        ));
  }
}
