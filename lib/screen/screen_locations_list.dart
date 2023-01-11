import 'package:flutter/material.dart';

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
              Navigator.pushNamed(context, 'AddPlaceScreen');
            },
            icon: const Icon(
              Icons.add_location_alt_sharp,
            ),
          ),
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
