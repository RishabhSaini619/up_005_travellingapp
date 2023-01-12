// ignore_for_file: depend_on_referenced_packages, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider_place.dart';
import 'screen_add_place.dart';

class PlacesListScreen extends StatelessWidget {
  static const routeName = 'PlacesListScreen';
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Places'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(
              Icons.add_location_alt_sharp,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<PlaceProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                  strokeWidth: 2,
                ),
              )
            : Consumer<PlaceProvider>(
                child: Center(
                  child: Text(
                    'No places to visit yet, start adding some!',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                builder: (ctx, placeProviderWidget, customChild) =>
                    placeProviderWidget.items.isEmpty
                        ? customChild!
                        : ListView.builder(
                            itemCount: placeProviderWidget.items.length,
                            itemBuilder: (context, index) => AnimatedContainer(
                              alignment: Alignment.center,
                              duration: const Duration(seconds: 5),
                              curve: Curves.elasticOut,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.5),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                                // border: Border.all(
                                //     color: Theme.of(context).colorScheme.primary,
                                //     width: 1),
                              ),
                              child: ListTile(
                                shape: StadiumBorder(
                                  side: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                                leading: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: FileImage(
                                    placeProviderWidget.items[index].placeImage,
                                  ),
                                ),
                                title: Text(
                                  placeProviderWidget.items[index].placeName,
                                ),
                              ),
                            ),
                          ),
              ),
      ),
    );
  }
}
