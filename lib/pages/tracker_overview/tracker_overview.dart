import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/controllers/user_auth_controller.dart';
import 'package:family_tracker/pages/login_page/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackerOverview extends StatelessWidget {
  final userAuthController = Get.find<UserAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.trackerOverviewColor,
      body: Center(
        child: Text("Family Tracker Coming Soon"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userAuthController.changeIsAuthVal(false);
          userAuthController.emptyToken();
          Get.to(LoginPage());
        },
        shape: const CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
