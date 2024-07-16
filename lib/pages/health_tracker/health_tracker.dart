import 'package:family_tracker/constans/colors_collection.dart';
import 'package:flutter/material.dart';

class HealthTracker extends StatelessWidget {
  const HealthTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.healthTrackerColor,
      body: Center(
        child: Text("Health Tracker Coming Soon"),
      ),
    );
  }
}
