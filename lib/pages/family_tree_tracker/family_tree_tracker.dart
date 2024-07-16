import 'package:family_tracker/constans/colors_collection.dart';
import 'package:flutter/material.dart';

class TrackerOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.trackerOverviewColor,
      body: Center(
        child: Text("Family Tracker Coming Soon"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
