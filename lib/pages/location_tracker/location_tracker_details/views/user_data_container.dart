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
        height: draggableBottomC.widgetHeight.value * maxChildSize - 60,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Putra",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 3,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 22,
                  width: 60,
                  color: Colors.grey,
                  child: const Center(
                    child: Text(
                      "Idle",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "Jl.oilenfoiwefoinweoifnowiefn",
                style: TextStyle(fontSize: 14, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
