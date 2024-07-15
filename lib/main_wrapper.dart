import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:family_tracker/pages/family_tree_tracker/family_tree_tracker.dart';
import 'package:family_tracker/pages/health_tracker/health_tracker.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_wrapper.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  //State class
  int _page = 1;
  List<Color> backgroundScreenColor = [
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.orangeAccent
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
          Icon(Icons.route_sharp, size: 17),
          Icon(Icons.supervised_user_circle, size: 17),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: IndexedStack(
        index: _page,
        children: [
          HealthTracker(),
          LocationTrackerWrapper(),
          FamilyTreeTracker()
        ],
      ),
    );
  }
}
