import 'package:family_tracker/constans/icon_collection.dart';
import 'package:flutter/material.dart';

class UserListTileSkeleton extends StatelessWidget {
  UserListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 220,
        color: Color.fromARGB(200, 203, 201, 201),
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
                              color: const Color.fromARGB(200, 255, 255, 255),
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
                              color: const Color.fromARGB(200, 255, 255, 255),
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
                              color: const Color.fromARGB(200, 255, 255, 255),
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
    );
  }
}
