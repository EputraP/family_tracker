import 'package:family_tracker/pages/location_tracker/location_tracker_details/controllers/draggable_bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoContainer extends StatelessWidget {
  PhotoContainer({super.key, required this.maxChildSize});
  final draggableBottomC = Get.find<DraggableBottomSheetController>();
  final double maxChildSize;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: draggableBottomC.widgetHeight.value * maxChildSize - 35,
        width: (MediaQuery.of(context).size.width - 20) * 1 / 3,
        child: const Center(
          child: Center(
            child: Icon(
              Icons.circle_sharp,
              size: 80,
              color: Colors.blue,
            ),
          ),
        )));
  }
}
