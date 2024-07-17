import 'package:family_tracker/pages/location_tracker/location_tracker_details/controllers/draggable_bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingButtonPositioned extends StatelessWidget {
  FloatingButtonPositioned({super.key});

  final dragableBottomSheetC = Get.find<DraggableBottomSheetController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Positioned(
          width: MediaQuery.sizeOf(context).width,
          bottom: dragableBottomSheetC.fabPosition.value +
              dragableBottomSheetC.fabPositionPadding.value,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  child: const Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                  ),
                ),
                Column(
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () => print('Add'),
                      child: const Icon(
                        Icons.sos_sharp,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () => print('Add'),
                      child: const Icon(Icons.my_location),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
