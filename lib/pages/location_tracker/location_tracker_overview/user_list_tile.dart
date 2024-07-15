import 'package:family_tracker/pages/location_tracker/location_tracker_details/location_tracker_details.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 220,
        color: Colors.lightBlue,
        child: Row(
          children: [
            Container(
              width: 65,
              // color: Colors.red,
              child: Icon(
                Icons.circle_sharp,
                size: 30,
                color: Colors.blue,
              ),
            ),
            VerticalDivider(
              width: 5,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Eka",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 18,
                        width: 60,
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            "Idle",
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Jl.oilenfoiwefoinweoifnowiefn",
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      onTap: () {
        Get.toNamed(LocationTrackerNavigation.locationDetail,
            id: LocationTrackerNavigation.id);
      },
    );
  }
}
