import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_overview/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../components/flutter_map_widget.dart';

class LocationTrackerOverview extends StatefulWidget {
  const LocationTrackerOverview({Key? key}) : super(key: key);

  @override
  _LocationTrackerOverviewState createState() =>
      _LocationTrackerOverviewState();
}

class _LocationTrackerOverviewState extends State<LocationTrackerOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.locationTrackerColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserList(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(child: FlutterMapWidget()),
            )
          ],
        ),
      ),
    );
  }
}
