import 'package:family_tracker/main_wrapper.dart';
import 'package:family_tracker/pages/location_tracker_overview/location_trackter_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}
