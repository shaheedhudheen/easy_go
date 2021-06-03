import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:easy_go/models/placeSearch.dart';
// import 'package:http/http.dart';

class PlacesService {
  final key = 'AIzaSyB4Qt3tY4YGspfX6PP1armGBfSKu1-Stts';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key');

    http.Response response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
