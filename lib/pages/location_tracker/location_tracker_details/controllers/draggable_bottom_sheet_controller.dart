import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraggableBottomSheetController extends GetxController {
  final controller = DraggableScrollableController();
  var initialSheetChildSize = 0.047.obs;
  var dragScrollSheetExtent = 0.0.obs;
  var widgetHeight = 0.0.obs;
  var fabPosition = 0.0.obs;
  var fabPositionPadding = 10.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var context = Get.context;
      fabPosition.value = initialSheetChildSize.value * context!.size!.height;
    });
  }

  void changeAttributesVal(
      {required double widgetHeightInput,
      required double dragscrollSheetExtentInput,
      required double fabPositionInput}) {
    widgetHeight.value = widgetHeightInput;
    dragScrollSheetExtent.value = dragscrollSheetExtentInput;
    fabPosition.value = fabPositionInput;
  }
}
