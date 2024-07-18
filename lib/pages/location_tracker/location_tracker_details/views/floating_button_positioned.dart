import 'package:family_tracker/constans/icon_collection.dart';
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
                    Visibility(
                      visible: true,
                      child: FloatingActionButton(
                        backgroundColor: false ? Colors.red : Colors.white,
                        onPressed: () => print('Add'),
                        child: const Icon(
                          IconCollection.sosIcon,
                          color: false ? Colors.white : Colors.red,
                        ),
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
