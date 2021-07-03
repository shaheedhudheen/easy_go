import 'package:easy_go/models/photoRef.dart';
import 'package:easy_go/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:easy_go/models/placeSearch.dart';

class PlacesService {
  final key = 'Your API key';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(regions)&key=$key');

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

    // var jsonImageResult = jsonResult['photos'];
    // print('json Iamge Result is \n\n');

    // print(jsonImageResult);

    // print('\n\n');

    return Place.fromJson(jsonResult);
  }

  Future<List<Place>> getPlaces(
      double lat, double lng, String placeType) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?type=$placeType&location=$lat,$lng&rankby=distance&key=$key');

    var response = await http.get(url);

    var json = convert.jsonDecode(response.body);

    var jsonResults = json['results'] as List;
    // print('json result is \n\n');
    // print(jsonResults.map((place) => Place.fromJson(place)).toList());

    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
