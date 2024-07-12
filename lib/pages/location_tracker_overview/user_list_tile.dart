import 'package:family_tracker/pages/location_tracker_details/location_tracker_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 150,
        color: Colors.lightBlue,
      ),
      onTap: () {
        Get.to(() => LocationTrackerDetails());
      },
    );
  }
}
