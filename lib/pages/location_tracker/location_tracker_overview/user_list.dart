import 'package:family_tracker/pages/location_tracker/location_tracker_overview/user_list_tile.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        // color: Colors.red,
        child: Scrollbar(
          child: ListView.separated(
            // physics: const ClampingScrollPhysics(),
            itemCount: 7,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 10,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctx, int i) {
              return UserListTile();
            },
          ),
        ));
  }
}
