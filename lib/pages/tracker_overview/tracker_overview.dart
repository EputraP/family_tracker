import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/pages/login_page/views/login_page.dart';
import 'package:family_tracker/pages/tracker_overview/views/circular_button.dart';
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
      floatingActionButton: Builder(
          builder: (context) => FabCircularMenuPlus(
                key: fabKey,
                alignment: Alignment.bottomRight,
                ringColor: Colors.transparent,
                ringDiameter: 280.0,
                ringWidth: 80.0,
                fabSize: 60.0,
                fabElevation: 8.0,
                fabIconBorder: CircleBorder(),
                fabColor: Colors.white,
                fabOpenIcon: Icon(Icons.menu, color: Colors.black),
                fabCloseIcon: Icon(Icons.close, color: Colors.blue),
                fabMargin: const EdgeInsets.only(top: 50),
                animationDuration: const Duration(milliseconds: 800),
                animationCurve: Curves.easeInOutCirc,
                children: <Widget>[
                  CircularButton(
                    color: Colors.black,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onClick: () {
                      userAuthController.changeIsAuthVal(false);
                      userAuthController.emptyToken();
                      Get.to(LoginPage());
                    },
                  ),
                  CircularButton(
                    color: Colors.black,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onClick: () {
                      print('Second button');
                    },
                  ),
                  CircularButton(
                    color: Colors.black,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    onClick: () {
                      print('Second button');
                    },
                  ),
                ],
              )),
    );
  }
}
