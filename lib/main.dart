import 'package:family_tracker/pages/overview_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverviewPosition(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapController? mapController;
  double markerSize = 20;
  double currentZoom = 12.0;

  LatLng currentCenter = LatLng(-6.955470354750406, 107.70999737725637);

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    markerSize = 20; // Default marker size
  }

  void _updateMarkerSize(double zoom) {
    // Update the marker size based on zoom
    setState(() {
      markerSize = 20.0 * (zoom / currentZoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Tracker"),
      ),
      body: FlutterMap(
        mapController: mapController,
        children: [
          openStreetMapTileLayer,
          MarkerLayer(markers: [
            Marker(
                point: LatLng(-6.955470354750406, 107.70999737725637),
                width: markerSize,
                height: markerSize,
                alignment: Alignment.center,
                child: Icon(
                  Icons.circle_sharp,
                  size: markerSize,
                  color: Colors.blue,
                ))
          ])
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
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
