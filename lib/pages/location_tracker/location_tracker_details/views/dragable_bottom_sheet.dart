import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/constans/icon_collection.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/controllers/draggable_bottom_sheet_controller.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/views/photo_container.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/views/top_botton_indicators.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/views/user_data_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraggableBottomSheet extends StatelessWidget {
  DraggableBottomSheet({super.key, required this.data});

  final Map<dynamic, dynamic> data;
  final draggableBottomC = Get.find<DraggableBottomSheetController>();
  final sheet = GlobalKey();
  final maxChildSize = 0.2;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
        onNotification: (DraggableScrollableNotification notification) {
          var widgetHeight = context.size!.height;
          var dragScrollSheetExtent = notification.extent;
          var fabPosition = dragScrollSheetExtent * widgetHeight;

          draggableBottomC.changeAttributesVal(
              widgetHeightInput: widgetHeight,
              dragscrollSheetExtentInput: dragScrollSheetExtent,
              fabPositionInput: fabPosition);

          return true;
        },
        child: DraggableScrollableSheet(
          key: sheet,
          initialChildSize: 0.04,
          maxChildSize: maxChildSize,
          minChildSize: 0.04,
          expand: true,
          snap: true,
          controller: draggableBottomC.controller,
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                color: ColorsCollection.locationTrackerColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const TopBottonIndicators(),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: double.infinity,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Obx(() => Stack(
                                  children: [
                                    const Visibility(
                                      visible: true,
                                      child: Positioned(
                                          right: 20,
                                          top: 0,
                                          child: Icon(
                                            IconCollection.sosIcon,
                                            size: 30,
                                            color: Colors.red,
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        PhotoContainer(
                                            maxChildSize: maxChildSize),
                                        Container(
                                          width: 2,
                                          height: draggableBottomC
                                                      .widgetHeight.value *
                                                  maxChildSize -
                                              60,
                                          color: Colors.grey,
                                        ),
                                        UserDataContainer(
                                            maxChildSize: maxChildSize)
                                      ],
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
