import 'package:easy_go/models/photoRef.dart';
import 'package:easy_go/models/place.dart';
import 'package:easy_go/screens/amenities/amenities.dart';
import 'package:easy_go/screens/maps/popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MarkerService {
  LatLngBounds bounds(Set<Marker> markers) {
    if (markers == null || markers.isEmpty) return null;
    return createBounds(markers.map((m) => m.position).toList());
  }

  LatLngBounds createBounds(List<LatLng> positions) {
    final southwestLat = positions
        .map((p) => p.latitude)
        .reduce((value, element) => value < element ? value : element);
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions
        .map((p) => p.latitude)
        .reduce((value, element) => value > element ? value : element);
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

  Marker createMarkerFromPlace(Place place) {
    var markerId = place.name;
    String heading = place.types[0];
    String headingTo;
    // PhotoRef photoid = place.photo;
    // print('photo id details');
    // print(photoid);
    if (heading == 'restaurant') {
      headingTo = 'Hotels';
    } else if (heading == 'tourist_attraction') {
      headingTo = 'Places';
    } else if (heading == 'gas_station') {
      headingTo = 'Gas';
    } else if (heading == 'atm') {
      headingTo = 'ATM';
    } else if (heading == 'hospital') {
      headingTo = 'Hospitals';
    }

    return Marker(
      markerId: MarkerId(markerId),
      draggable: false,
      infoWindow: InfoWindow(
        title: place.name,
        // snippet: place.address,
        onTap: () {
          print('tapped marker');
          Get.to(Amenities(
            amenitiesName: headingTo,
            address: place.address,
            name: place.name,
            rating: place.rating,
            totalRating: place.ratingNo,
            // photoid: photoid,
          ));
        },
      ),
      position:
          LatLng(place.geometry.location.lat, place.geometry.location.lng),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
  }
}
