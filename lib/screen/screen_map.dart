// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/model_place.dart';

class MapScreen extends StatefulWidget {
  static const routeName = 'MapScreen';
  final Location initialLocation;
  final bool isSelectingPlace;

  const MapScreen({
    super.key,
    this.initialLocation = const Location(
      locationAddress: '0° Center Location',
      locationLatitude: 0.00,
      locationLongitude: 0.00,
    ),
    this.isSelectingPlace = false,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late LatLng _pickedLocation;
  bool _isPicking = false;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedLocation = position;
      _isPicking = true;
    });
  }

  @override
  void initState() {
    _pickedLocation = const LatLng(00.00, 00.00);
    _isPicking = false;
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
        actions: [
          if (_isPicking == true)
            IconButton(
              onPressed: _isPicking != true
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
              icon: const Icon(Icons.add_location_sharp),
            ),
        ],
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
            zoom: 16,
          ),
          onTap: widget.isSelectingPlace ? _selectPosition : null,
          markers: _isPicking == true
              ? {}
              : {
                  Marker(
                    markerId: const MarkerId('id1'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pickedLocation,
                  ),
                }
        ),
      ),
    );
  }
}
