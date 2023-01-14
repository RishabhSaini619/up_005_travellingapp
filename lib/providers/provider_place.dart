import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/model_place.dart';
import '../helpers/helper_db.dart';
import '../helpers/helper_location.dart';

class PlaceProvider with ChangeNotifier {
  List<PlaceModel> _items = [];

  List<PlaceModel> get items {
    return [..._items];
  }

  PlaceModel findByID(String id) {
    return _items.firstWhere((place) => place.placeId  == id );
  }

  Future<void> addPlace(String newPlaceTitle, File newPlaceImage,
      Location newPlaceLocation,) async {
    final newPlaceAddress = await LocationHelper.getLocationAddress(
        newPlaceLocation.locationLatitude, newPlaceLocation.locationLongitude);
    final updatedLocation = Location(
      locationAddress: newPlaceAddress,
      locationLatitude: newPlaceLocation.locationLatitude,
      locationLongitude: newPlaceLocation.locationLongitude,
    );

    final newPlace = PlaceModel(
      placeId: DateTime.now().toString(),
      placeName: newPlaceTitle,
      placeLocation: updatedLocation,
      placeImage: newPlaceImage,
    );

    _items.add(newPlace);
    notifyListeners();

    DBHelper.insert('user_places', {
      'id': newPlace.placeId,
      'title': newPlace.placeName,
      'image': newPlace.placeImage.path,
      'latitude': newPlace.placeLocation.locationLatitude,
      'longitude': newPlace.placeLocation.locationLongitude,
      'address': newPlace.placeLocation.locationAddress,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => PlaceModel(
            placeId: item['id'],
            placeName: item['title'],
            placeImage: File(item['image']),
            placeLocation: Location(
              locationAddress: item['address'],
              locationLatitude: item['latitude'],
              locationLongitude: item['longitude'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
