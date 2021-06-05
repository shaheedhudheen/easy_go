class PlaceSearch {
  final String description;
  final String placeId;

  PlaceSearch({this.description, this.placeId});

  @override
  String toString() {
    return 'Places: {description: $description, placeId: $placeId}';
  }

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
      description: json['description'],
      placeId: json['place_id'],
    );
  }
}
