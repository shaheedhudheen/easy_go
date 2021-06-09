import 'package:easy_go/models/geometry.dart';
import 'package:easy_go/models/photoRef.dart';

class Place {
  final Geometry geometry;
  final String name;
  final String vicinity;
  final String address;
  final num rating;
  final num ratingNo;
  final List types;
  // final PhotoRef photo;

  Place({
    this.geometry,
    this.name = 'no data',
    this.vicinity = 'no data',
    this.address = 'no data',
    this.rating = 0.0,
    this.ratingNo = 0.0,
    this.types,
    // this.photo,
  });

  @override
  String toString() {
    return 'Places: {geometry: $geometry, name: $name, vicinity:$vicinity, address:$address}';
  }

  factory Place.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Place(
      geometry: Geometry.fromJson(parsedJson['geometry']),
      name: parsedJson['name'],
      vicinity: parsedJson['vicinity'],
      address: parsedJson['formatted_address'],
      rating: parsedJson['rating'],
      ratingNo: parsedJson['user_ratings_total'],
      types: parsedJson['types'],
      // photo: PhotoRef.fromJson(parsedJson['photos'] as Map),
    );
  }
}
