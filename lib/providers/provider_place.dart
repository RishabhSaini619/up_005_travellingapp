import 'package:flutter/foundation.dart';

import '../models/model_place.dart';

class PlaceProvider with ChangeNotifier {
  final List<PlaceModel> _items = [];
  List<PlaceModel> get items {
    return [..._items];
  }
}
