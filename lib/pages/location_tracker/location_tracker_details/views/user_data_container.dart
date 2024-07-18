import 'package:family_tracker/pages/location_tracker/location_tracker_details/controllers/draggable_bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDataContainer extends StatelessWidget {
  UserDataContainer({super.key, required this.maxChildSize});
  final draggableBottomC = Get.find<DraggableBottomSheetController>();
  final double maxChildSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: draggableBottomC.widgetHeight.value * maxChildSize - 35,
        // color: Colors.red,
      ),
    );
  }
}
