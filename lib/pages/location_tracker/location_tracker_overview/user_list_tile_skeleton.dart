import 'package:family_tracker/constans/icon_collection.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListTileSkeleton extends StatelessWidget {
  UserListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 220,
        color: const Color.fromARGB(255, 228, 228, 228),
        child: Row(
          children: [
            Container(
              width: 65,
              child: Icon(Icons.circle_sharp, size: 30, color: Colors.white),
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
                        visible: false,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 18,
                              width: 150,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 18,
                              width: 150,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 18,
                              width: 150,
                              color: Colors.white,
                            ),
                          ),
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
