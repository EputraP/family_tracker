import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/constans/icon_collection.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListTile extends StatelessWidget {
  UserListTile(
      {super.key,
      required this.userName,
      required this.address,
      required this.sosVis,
      required this.iconColor,
      required this.isOnline,
      required this.statusName});
  final String userName;
  final String address;
  final bool sosVis;
  final Map<dynamic, int> iconColor;
  final bool isOnline;
  final String statusName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 220,
        color: isOnline
            ? ColorsCollection.locationTrackerOnline
            : ColorsCollection.locationTrackerOffline,
        child: Row(
          children: [
            Container(
              width: 65,
              child: Icon(
                Icons.circle_sharp,
                size: 30,
                color: Color.fromARGB(
                  255,
                  iconColor["red"] ?? 0,
                  iconColor["green"] ?? 0,
                  iconColor["blue"] ?? 0,
                ),
              ),
            ),
            const VerticalDivider(
              width: 5,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(
                    children: [
                      Visibility(
                        visible: sosVis,
                        child: Positioned(
                            right: 0,
                            top: 0,
                            child: Icon(
                              IconCollection.sosIcon,
                              size: 30,
                              color: Colors.red,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userName[0].toUpperCase() + userName.substring(1),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 18,
                              width: 60,
                              color: statusName == "idle"
                                  ? ColorsCollection.locationTrackerIdle
                                  : ColorsCollection.locationTrackerMoving,
                              child: Center(
                                child: Text(
                                  statusName[0].toUpperCase() +
                                      statusName.substring(1),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            address,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      onTap: () {
        Get.toNamed(LocationTrackerNavigation.locationDetail);
      },
    );
  }
}
