import 'package:family_tracker/constans/colors_collection.dart';
import 'package:family_tracker/components/flutter_map_widget.dart';
import 'package:family_tracker/pages/location_tracker/location_tracker_details/dynamic_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationTrackerDetails extends StatefulWidget {
  const LocationTrackerDetails({Key? key}) : super(key: key);

  @override
  State<LocationTrackerDetails> createState() => _LocationTrackerDetailsState();
}

class _LocationTrackerDetailsState extends State<LocationTrackerDetails> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();
  double _initialSheetChildSize = 0.047;
  double _dragScrollSheetExtent = 0;

  double _widgetHeight = 0;
  double _fabPosition = 0;
  double _fabPositionPadding = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // render the floating button on widget
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
          FlutterMapWidget(),
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
                    child: Icon(Icons.arrow_back),
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
                        child: Icon(
                          Icons.sos_sharp,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red,
                        onPressed: () => print('Add'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton(
                        child: Icon(Icons.my_location),
                        onPressed: () => print('Add'),
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

                  // Calculate FAB position based on parent widget height and DraggableScrollable position
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
                // snapSizes: [
                //   60 / constraints.maxHeight,
                //   0.5,
                // ],
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
                        // SliverToBoxAdapter(
                        //   child: widget.child,
                        // ),
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
      child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Container(
                child: Center(
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
            ]))),
          ])),
    );
  }
}
