import 'package:flutter/material.dart';

class LocationTrackerDetails extends StatelessWidget {
  const LocationTrackerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Location Tracker Details"),
        ),
      ),
    );
  }
}
