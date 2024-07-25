import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/pages/tracker_overview/views/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackerOverview extends StatelessWidget {
  final userAuthController = Get.find<UserAuthController>();
  final GlobalKey<FabCircularMenuPlusState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.trackerOverviewColor,
      body: Center(
        child: Text("Family Tracker Coming Soon"),
      ),
      floatingActionButton: Builder(builder: (context) => FabCircularMenu()),
    );
  }
}
