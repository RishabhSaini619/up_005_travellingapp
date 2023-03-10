import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../screen/screen_map.dart';
import '../helpers/helper_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationGetterWidget extends StatefulWidget {
  final Function onSelectedLocation;
  const LocationGetterWidget(this.onSelectedLocation, {super.key});

  @override
  State<LocationGetterWidget> createState() => _LocationGetterWidgetState();
}

class _LocationGetterWidgetState extends State<LocationGetterWidget> {
  late String _previewImageUrl;
  bool _load = false;

  void _showLocationPreview(double latitude, double longitude) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      locationLatitude: latitude,
      locationLongitude: longitude,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
      _load = true;
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      final locData = await Location().getLocation();
      _showLocationPreview(locData.latitude!, locData.longitude!);
      widget.onSelectedLocation(locData.latitude, locData.longitude);
      print('Location : \n'
          ' North ${locData.longitude} \n'
          ' East ${locData.longitude}');
    } catch (error) {
      return print('error accrued while _getCurrentLocation');
    }
  }

  Future<void> _getSelectedLocation() async {
    try {
      final selectedLocation =
          await Navigator.of(context).push<LatLng>(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (ctx) => const MapScreen(
                    isSelectingPlace: true,
                  )));
      if (selectedLocation == null) {
        return;
      }
      _showLocationPreview(
          selectedLocation.latitude, selectedLocation.longitude);
      widget.onSelectedLocation(
          selectedLocation.latitude, selectedLocation.longitude);
      print('Location : \n'
          ' North ${selectedLocation.longitude} \n'
          ' East ${selectedLocation.longitude}');
    } catch (error) {
      return print('error accrued while _getCurrentLocation');
    }
  }

  @override
  void initState() {
    _previewImageUrl = '';
    _load = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 3),
          curve: Curves.elasticInOut,
          height: 200,
          width: 350,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: Colors.amberAccent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary, width: 1),
          ),
          child: _load == true
              ? Container(
                  margin: const EdgeInsets.all(5),
                  child: Image.network(
                    _previewImageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              : Text(
                  'No Location chosen',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.my_location_sharp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                label: Text(
                  'Current Location',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                onPressed: _getCurrentLocation,
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.location_on_sharp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                label: Text(
                  'Select on Map',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                onPressed: _getSelectedLocation,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
