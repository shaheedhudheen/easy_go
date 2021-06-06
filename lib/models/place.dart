import 'package:easy_go/models/geometry.dart';

class Place {
  final Geometry geometry;
  final String name;
  final String vicinity;
  final String address;
  // final int rating;
  // final int ratingNo;
  final List types;

  Place(
      {this.geometry,
      this.name,
      this.vicinity,
      this.address,
      // this.rating,
      // this.ratingNo,
      this.types});

  @override
  String toString() {
    return 'Places: {geometry: $geometry, name: $name, vicinity:$vicinity, address:$address}';
  }

  factory Place.fromJson(Map<String, dynamic> parsedJson) {
    return Place(
      geometry: Geometry.fromJson(parsedJson['geometry']),
      name: parsedJson['name'],
      vicinity: parsedJson['vicinity'],
      address: parsedJson['formatted_address'],
      // rating: parsedJson['rating'],
      // ratingNo: parsedJson['user_rating_total'],
      types: parsedJson['types'],
    );
  }
}
