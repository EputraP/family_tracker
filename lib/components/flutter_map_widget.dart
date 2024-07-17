import 'package:family_tracker/controllers/flutter_map_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class FlutterMapWidget extends StatelessWidget {
  const FlutterMapWidget({super.key, required this.mapC});
  final FlutterMapWidgetController mapC;

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
            MarkerLayer(markers: mapC.mapData.value)
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
