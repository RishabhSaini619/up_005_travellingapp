import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/model_place.dart';

class MapScreen extends StatefulWidget {
  static const routeName = 'MapScreen';
  final Location initialLocation;
  final bool isSelectingPlace;

  const MapScreen(
      {this.initialLocation = const Location(
        '0° Center Location',
        locationLatitude: 0.00,
        locationLongitude: 0.00,
      ),
      this.isSelectingPlace = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select on Map'),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(seconds: 5),
        curve: Curves.elasticOut,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 1),
        ),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.initialLocation.locationLatitude,
              widget.initialLocation.locationLongitude,
            ),
            zoom: 10,

          ),
        ),
      ),
    );
  }
}
