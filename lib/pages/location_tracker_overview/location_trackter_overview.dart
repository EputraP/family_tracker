import 'package:family_tracker/pages/location_tracker_overview/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../flutter_map_widget.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: const Text("Location Tracker Overview")),
      ),
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
