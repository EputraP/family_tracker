import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/routes/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 220,
        color: ColorsCollection.locationTrackerOnline,
        child: Row(
          children: [
            Container(
              width: 65,
              // color: Colors.red,
              child: const Icon(
                Icons.circle_sharp,
                size: 30,
                color: Colors.blue,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Eka",
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
                        color: ColorsCollection.locationTrackerMoving,
                        child: const Center(
                          child: Text(
                            "Moving",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "Jl.oilenfoiwefoinweoifnowiefn",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
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
