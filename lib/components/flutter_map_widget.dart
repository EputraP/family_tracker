import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapWidget extends StatelessWidget {
  FlutterMapWidget({super.key});

  final mapC = Get.put(FlutterMapWidgetController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => FlutterMap(
          mapController: mapC.mapController,
          options: MapOptions(
            initialZoom: mapC.currentZoom.value,
            interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag),
            initialCenter: mapC.currentCenter.value,
            onPositionChanged: (position, hasGesture) {
              if (hasGesture) {
                mapC.updateMarkerSize(position.zoom);
              }
            },
          ),
          children: [
            openStreetMapTileLayer,
            MarkerLayer(
              markers: [
                Marker(
                  point: const LatLng(-6.955470354750406, 107.70999737725637),
                  width: mapC.markerSize.value,
                  height: mapC.markerSize.value,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.circle_sharp,
                    size: mapC.markerSize.value,
                    color: Colors.blue,
                  ),
                ),
                Marker(
                  point: const LatLng(-7.796192410193114, 110.37038175433241),
                  width: mapC.markerSize.value,
                  height: mapC.markerSize.value,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.circle_sharp,
                    size: mapC.markerSize.value,
                    color: Colors.red,
                  ),
                )
              ],
            )
          ],
        ));
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      // subdomains: ['a', 'b', 'c'],
      // tileBuilder: modet,
    );
