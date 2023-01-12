import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/model_place.dart';
import '../helpers/helper_db.dart';

class PlaceProvider with ChangeNotifier {
  final List<PlaceModel> _items = [
    PlaceModel(
      placeId: DateTime.now().toString(),
      placeName: 'test',
      placeImage: File(''),
    ),
    PlaceModel(
      placeId: DateTime.now().toString(),
      placeName: 'test2',
      placeImage: File(''),
    ),
    PlaceModel(
      placeId: DateTime.now().toString(),
      placeName: 'test3',
      placeImage: File(''),
    ),
  ];

  List<PlaceModel> get items {
    return [..._items];
  }

  void addPlace(String newPlaceTitle, File newPlaceImage) {
    final newPlace = PlaceModel(
      placeId: DateTime.now().toString(),
      placeName: newPlaceTitle,
      // placeLocation: newPlaceLocation,
      placeImage: newPlaceImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.placeId,
      'title': newPlace.placeName,
      'image': newPlace.placeImage.path,
    });
  }
}
