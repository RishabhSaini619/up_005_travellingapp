import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationGetterWidget extends StatefulWidget {
  const LocationGetterWidget({Key? key}) : super(key: key);

  @override
  State<LocationGetterWidget> createState() => _LocationGetterWidgetState();
}

class _LocationGetterWidgetState extends State<LocationGetterWidget> {
  late String _previewImageUrl;

  Future <void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);

  }

  @override
  void initState() {
    _previewImageUrl = '';
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
          decoration: BoxDecoration(
            // color: Colors.amberAccent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary, width: 1),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No Location chosen',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.location_on_sharp,
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
                  Icons.map_sharp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                label: Text(
                  'Select on Map',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}