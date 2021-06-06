import 'dart:async';

import 'package:easy_go/models/geometry.dart';
import 'package:easy_go/models/location.dart';
import 'package:easy_go/models/place.dart';
import 'package:easy_go/models/placeSearch.dart';
import 'package:easy_go/screens/maps/mapScreen.dart';
import 'package:easy_go/services/geolocatorService.dart';
import 'package:easy_go/services/markerService.dart';
import 'package:easy_go/services/placesService.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  final placesService = PlacesService();
  final markerService = MarkerService();

  //variables
  Position currentLocation;
  List<PlaceSearch> searchResults; //= List<PlaceSearch>();
  StreamController<Place> selectedLocation =
      StreamController<Place>.broadcast();
  StreamController<LatLngBounds> bounds =
      StreamController<LatLngBounds>.broadcast();
  Place selectedLocationStatic;
  String placeType;
  List<Marker> markers = List<Marker>();

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    selectedLocationStatic = Place(
        name: null,
        geometry: Geometry(
            location: Location(
                lat: currentLocation.latitude,
                lng: currentLocation.longitude)));
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    print('search result start');
    print(searchResults);
    print('search result end');

    notifyListeners();
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation.add(sLocation);
    selectedLocationStatic = sLocation;
    searchResults = null;
    notifyListeners();
  }

  togglePlaceType(String value, bool selected) async {
    if (selected) {
      placeType = value;
    } else {
      placeType = null;
    }

    if (placeType != null) {
      var places = await placesService.getPlaces(
          selectedLocationStatic.geometry.location.lat,
          selectedLocationStatic.geometry.location.lng,
          placeType);
      markers = [];

      if (places.length > 0) {
        for (int i = 0; i < places.length; i++) {
          var newMarker = markerService.createMarkerFromPlace(places[i]);
          markers.add(newMarker);
        }
      }

      var locationMarker =
          markerService.createMarkerFromPlace(selectedLocationStatic);
      markers.add(locationMarker);

      var _bounds = markerService.bounds(Set<Marker>.of(markers));
      bounds.add(_bounds);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    selectedLocation.close();
    bounds.close();
    super.dispose();
  }
}
