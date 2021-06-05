import 'package:easy_go/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:easy_go/models/placeSearch.dart';

class PlacesService {
  final key = 'AIzaSyAyF77uJei6MFUW22Mvfw3z_iXCs2QsiLE';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key');

    var response = await http.get(url);

    var json = convert.jsonDecode(response.body);

    var jsonResults = json['predictions'] as List;

    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?key=$key&place_id=$placeId');

    var response = await http.get(url);

    var json = convert.jsonDecode(response.body);

    var jsonResult = json['result'] as Map<String, dynamic>;

    return Place.fromJson(jsonResult);
  }

  Future<List<Place>> getPlaces(
      double lat, double lng, String placeType) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?type=$placeType&location=$lat,$lng&rankby=distance&key=$key');

    var response = await http.get(url);

    var json = convert.jsonDecode(response.body);

    var jsonResults = json['results'] as List;
    print(jsonResults);
    print('jsonresults');
    print(jsonResults.map((place) => Place.fromJson(place)).toList());
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
