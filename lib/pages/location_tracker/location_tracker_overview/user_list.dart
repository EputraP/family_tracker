import 'dart:convert';

import 'package:family_tracker/pages/location_tracker/location_tracker_overview/user_list_tile.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key, required this.data});
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        color: Color.fromARGB(255, 55, 58, 227),
        child: Scrollbar(
          child: ListView.separated(
            itemCount: data.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 10,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctx, int i) {
              Map valueMap = json.decode(data[i]["icon_color"]);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserListTile(
                  userName: data[i]["username"],
                  address: data[i]["address"],
                  sosVis: data[i]["is_sos"] == "0" ? false : true,
                  iconColor: {
                    "red": valueMap["red"],
                    "green": valueMap["green"],
                    "blue": valueMap["blue"]
                  },
                  isOnline: data[i]["is_online"] == "0" ? false : true,
                  statusName: data[i]["status_name"],
                ),
              );
            },
          ),
        ));
  }
}
