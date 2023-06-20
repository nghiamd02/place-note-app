import 'package:fav_place_app/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super([]);

  void addPlaces(String name) {
    final newPlace = Place(name: name);
    state = [newPlace, ...state];
  }
}

final placesNotifierProvider =
    StateNotifierProvider<PlacesNotifier, List<Place>>(
        (ref) => PlacesNotifier());
