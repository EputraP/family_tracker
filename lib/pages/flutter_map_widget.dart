import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapWidget extends StatefulWidget {
  const FlutterMapWidget({Key? key}) : super(key: key);

  @override
  _FlutterMapWidgetState createState() => _FlutterMapWidgetState();
}

class _FlutterMapWidgetState extends State<FlutterMapWidget> {
  MapController? mapController;
  double markerSize = 10;
  double currentZoom = 6.0;

  LatLng currentCenter = LatLng(-6.955470354750406, 107.70999737725637);

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    markerSize = 10; // Default marker size
  }

  void _updateMarkerSize(double zoom) {
    // Update the marker size based on zoom
    setState(() {
      markerSize = 10.0 * (zoom / currentZoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      children: [
        openStreetMapTileLayer,
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(-6.955470354750406, 107.70999737725637),
              width: markerSize,
              height: markerSize,
              alignment: Alignment.center,
              child: Icon(
                Icons.circle_sharp,
                size: markerSize,
                color: Colors.blue,
              ),
            ),
            Marker(
              //-7.796192410193114, 110.37038175433241
              point: LatLng(-7.796192410193114, 110.37038175433241),
              width: markerSize,
              height: markerSize,
              alignment: Alignment.center,
              child: Icon(
                Icons.circle_sharp,
                size: markerSize,
                color: Colors.red,
              ),
            )
          ],
        )
      ],
      options: MapOptions(
        initialZoom: currentZoom,
        interactionOptions: InteractionOptions(
            flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag),
        initialCenter: currentCenter,
        onPositionChanged: (position, hasGesture) {
          if (hasGesture) {
            _updateMarkerSize(position.zoom);
          }
        },
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      subdomains: ['a', 'b', 'c'],
      tileBuilder: darkModeTileBuilder,
    );
