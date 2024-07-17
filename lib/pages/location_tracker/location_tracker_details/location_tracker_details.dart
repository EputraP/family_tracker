import 'package:family_tracker/components/flutter_map_widget.dart';
import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationTrackerDetails extends StatefulWidget {
  const LocationTrackerDetails({super.key});

  @override
  State<LocationTrackerDetails> createState() => _LocationTrackerDetailsState();
}

class _LocationTrackerDetailsState extends State<LocationTrackerDetails> {
  var mapCDetail = Get.find<FlutterMapWidgetController>(tag: "Detail");

  final sheet = GlobalKey();
  final controller = DraggableScrollableController();
  final double _initialSheetChildSize = 0.047;
  double _dragScrollSheetExtent = 0;

  double _widgetHeight = 0;
  double _fabPosition = 0;
  final double _fabPositionPadding = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _fabPosition = _initialSheetChildSize * context.size!.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCollection.locationTrackerColor,
      body: Stack(
        children: [
          FlutterMapWidget(mapC: mapCDetail),
          Positioned(
            width: MediaQuery.sizeOf(context).width,
            bottom: _fabPosition + _fabPositionPadding,
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
          ),
          NotificationListener<DraggableScrollableNotification>(
              onNotification: (DraggableScrollableNotification notification) {
                setState(() {
                  _widgetHeight = context.size!.height;
                  _dragScrollSheetExtent = notification.extent;

                  _fabPosition = _dragScrollSheetExtent * _widgetHeight;
                });
                return true;
              },
              child: DraggableScrollableSheet(
                key: sheet,
                initialChildSize: 0.04,
                maxChildSize: 0.5,
                minChildSize: 0.04,
                expand: true,
                snap: true,
                controller: controller,
                builder:
                    (BuildContext context, ScrollController scrollController) {
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
                        topButtonIndicator(),
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  SliverToBoxAdapter topButtonIndicator() {
    return SliverToBoxAdapter(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: Wrap(children: <Widget>[
              Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  )),
            ])),
          ]),
    );
  }
}
