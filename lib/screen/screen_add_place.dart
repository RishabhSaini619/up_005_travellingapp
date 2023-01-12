import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  // final newPlaceLocationController = TextEditingController();

  late AnimationController newPlaceController;

   late File _pickedImage;

  void _selectedImage(File pickedImageFile) {
    _pickedImage = pickedImageFile;
  }

  void _savePlaceButtonFunction() {
    if (newPlaceTitleController.text.isEmpty) {
      return;
    }
    Provider.of<PlaceProvider>(
      context,
      listen: false,
    ).addPlace(
      newPlaceTitleController.text,
      _pickedImage,
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
                      ImageGetterWidget(_selectedImage),
                      const Divider(),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          // icon: Icon(Icons.abc_sharp),
                          labelText: "Title ",
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          hintText: "Product Title ",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: newPlaceTitleController,
                      ),
                      const Divider(),
                      // TextField(
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15),
                      //       borderSide: BorderSide(
                      //         color: Theme.of(context).colorScheme.primary,
                      //       ),
                      //     ),
                      //     // icon: Icon(Icons.abc_sharp),
                      //     labelText: "Location ",
                      //     labelStyle: Theme.of(context).textTheme.bodyLarge,
                      //     hintText: "Product Location ",
                      //     hintStyle: Theme.of(context).textTheme.bodyMedium,
                      //   ),
                      //   textInputAction: TextInputAction.next,
                      //   keyboardType: TextInputType.text,
                      //   controller: newPlaceLocationController,
                      // ),
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
