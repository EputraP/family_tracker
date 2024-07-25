import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/pages/login_page/views/login_page.dart';
import 'package:family_tracker/pages/tracker_overview/views/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FabCircularMenu extends StatelessWidget {
  FabCircularMenu({super.key});
  final GlobalKey<FabCircularMenuPlusState> fabKey = GlobalKey();
  final userAuthController = Get.find<UserAuthController>();

  @override
  Widget build(BuildContext context) {
    return FabCircularMenuPlus(
      key: fabKey,
      alignment: Alignment.bottomRight,
      ringColor: Colors.transparent,
      ringDiameter: 280.0,
      ringWidth: 80.0,
      fabSize: 60.0,
      fabElevation: 8.0,
      fabIconBorder: const CircleBorder(),
      fabColor: Colors.white,
      fabOpenIcon: const Icon(Icons.menu, color: Colors.black),
      fabCloseIcon: const Icon(Icons.close, color: Colors.blue),
      fabMargin: const EdgeInsets.only(top: 100),
      animationDuration: const Duration(milliseconds: 800),
      animationCurve: Curves.easeInOutCirc,
      children: <Widget>[
        CircularButton(
          color: Colors.black,
          width: 50,
          height: 50,
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onClick: () async {
            await userAuthController.logout();
            userAuthController.changeIsAuthVal(false);
            userAuthController.emptyToken();
            Get.to(const LoginPage());
          },
        ),
        CircularButton(
          color: Colors.black,
          width: 50,
          height: 50,
          icon: const Icon(
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
          icon: const Icon(
            Icons.person_add,
            color: Colors.white,
          ),
          onClick: () {
            print('Second button');
          },
        ),
      ],
    );
  }
}
