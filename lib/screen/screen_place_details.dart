import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/screen_map.dart';
import '../providers/provider_place.dart';

class PlaceDetailsScreen extends StatefulWidget {
  static const routeName = 'PlaceDetailsScreen';

  const PlaceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen>
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
    final id = ModalRoute.of(context)?.settings.arguments;
    final selectedPlace =
        Provider.of<PlaceProvider>(context, listen: false).findByID('$id');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${selectedPlace.placeName} Details'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 300),
        curve: Curves.easeOutSine,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 300),
              curve: Curves.easeOutSine,
              height: 250,
              width: double.infinity,
              child: Image.file(
                selectedPlace.placeImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              selectedPlace.placeLocation.locationAddress,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => MapScreen(
                      initialLocation: selectedPlace.placeLocation,
                      isSelectingPlace: false,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.map_sharp,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: Text(
                'View address on map',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
