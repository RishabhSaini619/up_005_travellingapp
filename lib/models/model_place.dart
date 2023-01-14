import 'dart:io';

class Location {
  final double locationLatitude;
  final double locationLongitude;
  final String locationAddress;

  const Location({
    required this.locationAddress,
    required this.locationLatitude,
    required this.locationLongitude,
  });
}
class PlaceModel {
  final String placeId;
  final String placeName;
  final Location placeLocation;
  final File placeImage;

  PlaceModel({
    required this.placeId,
    required this.placeName,
    required this.placeLocation,
    required this.placeImage,
  });
}


