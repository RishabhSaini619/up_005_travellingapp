import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_005_travellingapp/models/model_place.dart';
import 'package:up_005_travellingapp/widgets/widget_location_getter.dart';
import '../providers/provider_place.dart';
import '../widgets/widget_image_getter.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = 'AddPlaceScreen';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen>
    with SingleTickerProviderStateMixin {
  final newPlaceTitleController = TextEditingController();
  late AnimationController newPlaceController;
  late File _pickedImage;
  late Location _pickedLocation;

  void _selectedImage(File pickedImageFile) {
    _pickedImage = pickedImageFile;
  }

  void _selectedLocation(double lan, double lng) {
    _pickedLocation = Location(
      locationAddress: "",
      locationLatitude: lan,
      locationLongitude: lng,
    );
  }

  void _savePlaceButtonFunction() {
    if (newPlaceTitleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    }
    Provider.of<PlaceProvider>(
      context,
      listen: false,
    ).addPlace(
      newPlaceTitleController.text,
      _pickedImage,
      _pickedLocation,
    );
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _pickedImage = File('');
    super.initState();
    newPlaceController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    newPlaceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(seconds: 5),
        curve: Curves.elasticOut,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                            // icon: Icon(Icons.abc_sharp),
                            labelText: "Title ",
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                            hintText: "Product Title ",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          controller: newPlaceTitleController,
                        ),
                      ),
                      ImageGetterWidget(_selectedImage),
                      LocationGetterWidget(_selectedLocation),
                    ],
                  ),
                ),
              ),
            ),
            //button
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.save_alt_sharp,
                ),
                label: Text(
                  'Add Place',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onPressed: _savePlaceButtonFunction,
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(
                      //     color: Colors.red),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    elevation: 2,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shadowColor: Theme.of(context).colorScheme.secondary,
                    textStyle: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
